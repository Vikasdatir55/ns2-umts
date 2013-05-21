# function: initiall the Q map
# args
#	num_col: the number of Q map colume
#	num_row: the number of Q map row
proc InitQ {num_col num_row} {
	set q {}
	for {set i 0} {$i < [expr $num_col*$num_row]} {incr i 1} {
		lappend q 0
	}
	return $q
}
# function: get the battery degree of ue
# args
#	ue: ue want to get
#	ue_index: the number index of ue list 
#	battery_list: batter list
proc GetBatteryDegree {ue ue_index battery_list} {
	set battery_left [lindex $battery_list $ue_index]
	#set initial_val 1900.0

	puts "$battery_left is Left"
	set percent_left [expr $battery_left/1900.0]
	if {$percent_left >= 0.8} {
		return 3
	}
	if {$percent_left >= 0.5 && $percent_left < 0.8} {
		return 2
	}
	if {$percent_left >= 0.2 && $percent_left < 0.5} {
		return 1
	}
	if {$percent_left >= 0.0 && $percent_left < 0.2} {
		return 0
	}
	if {$percent_left < 0.0} {
		puts "Battery ran out"
		return 0
	}
}

# function: get the application type of ue
# args
# 	ue: ue want to get 
# 	ue_index: the number index of ue list 
# 	app_type_list: application list
proc GetAppType {ue ue_index app_type_list} {
	return [lindex $app_type_list $ue_index]
}

# function: get the state of ue
# args
# 	ue: ue want to get 
#	num: the dimension of state
# 	ue_index: the index of ue in the list 
# 	battery_list: the list of batter 
# 	app_type_list: the application type list 
proc GetState {ue ue_index battery_list app_type_list} {
  	set battery_level [GetBatteryDegree $ue $ue_index $battery_list]
  	puts "battery level is $battery_level"
  	set app_type [GetAppType $ue $ue_index $app_type_list]  
  	puts "app type is $app_type"

	return [expr $app_type*4 + $battery_level] 
}

proc StateIsChanged {ue ue_index last_state battery_list app_type_list} {
	set current_state [GetState $ue $ue_index $battery_list $app_type_list]
	if {$last_state == $current_state} {
		return 1
	}
	if {$last_state != $current_state} {
		return 0
	}

}

proc QosIsNotSatisfied {ns realtime_monitor ue ue_index } {
	
}
# function: get the max of Q and return its index 
# args
#	ue: ue want to get
#	num_action: num of state 
#	current_state_index: current index number of ue
proc GetMaxQ {ue num_action current_state_index Q} {
	set max_q 0
	set MaxQ_index $current_state_index
	for {set i 0} {$i < $num} {incr i 1} {
		if {[lindex $Q $i] >= $max_q} {
			set max_q [lindex $Q $i]
			set MaxQ_index $i
		}
	}
	return $MaxQ_index
}

# function: get action for current state using e-greedy
# args:
# 	ue: ue want to get for 
# 	current_state_index: the index of state which ue in
# 	Q: Q map 
proc GetAction {ue current_state_index Q} {
	set q_zero [lindex $Q [expr $current_state_index*2]]
	set q_one [lindex $Q [expr $current_state_index*2 +1]]

	if {$q_zero >= $q_one} {
		set flag [expr rand()]
		if {$flag < 0.6} {
			return 0
		}	
	} 
	return 1
}

# function: get the index of q in the Q map to update 
# args:
# 	ue: ue want to get for 
# 	current_state_index: the index of state which ue in
# 	Q: Q map 
proc GetUpdateQIndex {ue current_state_index Q} {
	return [expr $current_state_index*2 + [GetAction $ue $current_state_index $Q]]
}

# function: get q of current action
# args:
# 	ue: ue want to get for 
# 	current_state_index: the index of state which ue in
# 	Q: Q map 
proc GetQofAction {ue current_state_index Q} {
	set q_zero [lindex $Q [expr $current_state_index*2]]
	set q_one [lindex $Q [expr $current_state_index*2 +1]]

	if {$q_zero >= $q_one} {
		#chose 0
		return $q_zero
	} else {
		#chose 1 
		return $q_one
	}
}

# function: get reward of action
# args
# 	ue: the ue want to get 
# 	r_previous: the previous reward value
# 	r_current: the current reward value
proc GetReward {ue r_previous r_current} {
	return [expr $r_current-$r_previous]
}

# function: Update Q map 
# args 
proc UpdateQ {ue reward Q current_state_index} {
	set alpha [expr 0.80]
	set gamma [expr 0.40]

	set q $Q

	set q_now [lindex $Q $current_state_index]
	set q_previous [GetQofAction $ue $current_state_index $Q]
	set tmp [expr $alpha*($reward+$gamma*$q_previous-$q_now)]
	set q_now [expr $q_now + $tmp]
	set index [GetUpdateQIndex $ue $current_state_index $Q]
	set q [lreplace $q $index $index $q_now]
	puts "Q_map Updated-----"

	return $q
}

# function: print the Q map as a beautiful one
# args
#	Q: the Q list to print
# 	num_action: the number of actions
#	num_state: the number of state 
proc PrintQ {Q num_action num_state} {
	set index 0
	for {set i 0} {$i < $num_state} {incr i 1} {
		for {set j 0} {$j < $num_action} {incr j 1} {
			puts -nonewline "[lindex $Q $index] "
			set index [expr $index + 1]
		}
		puts ""
	}	
}

# function: calculate the reward
# args:
#	d_cost: the changes of cost after an action
#	d_bandth: the changes of bandth after an action
# 	d_delay: the changes of delay after an action
# 	d_loss_rate: the changes of packet loss rate after an action
# 	d_enery_consuption_rate: the changes of energy consuption rate after a action
#	alpha_c: the user perference value of cost 
# 	alpha_p: the user perference value of network performance
#	alpha_i: the user perference value of energy consuption rate 
# 	notice that $alpha_p+$alpha_i+$alpha_c = 1
proc CalculateReward {d_cost d_bandth d_delay d_jitter d_loss_rate d_energy_consuption_rate\
						alpha_c alpha_p alpha_i} {
	set c [expr 1/(1+exp($d_cost))]
	set p [expr 1/(1+exp(-$d_bandth)) + 1/(1+exp($d_jitter)) + 1/(1+exp($d_delay)) + 1/(1+exp($d_loss_rate))]
	set i [expr 1/(1+exp($d_energy_consuption_rate))]

	set reward [expr $alpha_c*$c + $alpha_p*$p + $alpha_i*$i]

	return $reward
}


