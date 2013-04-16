# function: finish process 
proc finish {} {
    global ns f
    $ns flush-trace
    close $f
    puts " Simulation ended."
    exit 0
}

# function: create UDP Agent for UE
# args
#     ue: ue which need agent
#     agent_name: agent name
#     interface: the network interface which ue is using
proc createUDPAgentForUE {ue agent_name interface} {
    set agent_name [new Agent/UDP]
    $ue attach-agent $agent_name $interface
}

# function: create FullTcp Agent for UE
# args
#     ue: ue which need agent
#     agent_name: agent name
#
proc createTCPAgentForUE {ue agent_name} {
    set agent_name [new Agent/TCP/FullTcp]
    $ue attach-agent $agent_name $interface
}

# function: connect send agent and recieve agent of two UEs 
# args
#     agent_src: source agent
#     agent_des: destination agent
#
proc connectTwoAgents {agent_src agent_des} {
  $ns connect $agent_ue1 $agent_ue2
}

# function: set Node position
# args
#  	node: umts node
#  	pos_x: X_ value
#  	pos_y: Y_ value
#  	pos_z: Z_ value
proc setNodePosition {node pos_x pos_y pos_z} {
	$node set X_ $pos_x
	$node set Y_ $pos_y
	$node set Z_ $pos_z
}

# function: set random position for node
# args
# 	node: node
# 	min: minimum value you want
# 	max: maximum value you want
proc setRandomPositionForNode {node min max} {
	set rand_x [expr rand()]
	set rand_y [expr rand()]
	set pos_x [expr $rand_x * ($max - $min) + $min]
	set pos_y [expr $rand_y * ($max - $min) + $min]
	$node set X_ $pos_x
	$node set Y_ $pos_y
	$node set Z_ 0.0
}

# funcition: make umts ue move by setting the X_ and Y_ value
# args 
# 	umts_ue: umts node
proc moveUmtsNode {umts_ue} {
	set prev_x [$umts_ue set X_]
	set prev_y [$umts_ue set Y_]
	set rand_x [expr rand()]
	set rand_y [expr rand()]
	set mov_x [expr $rand_x * (2 - (-2)) + (-2)]
	set mov_y [expr $rand_y * (2 - (-2)) + (-2)]
	$umts_ue set X_ [expr $prev_x + $mov_x]
	$umts_ue set Y_ [expr $prev_y + $mov_y]
}

# function: move umts node every certain time slot
# args
# 	umts_ue: umts node
# 	time_slot: time slot
# 	from_time: time to start to move
# 	time_length: the length of whole time
proc umtsNodeMove {umts_ue from_time time_slot time_lenght} {
	global ns
	for {set i 0} {$i < [expr $time_lenght/$time_slot]} {incr i 1} {
		$ns at [expr $from_time + $i * $time_slot] "moveUmtsNode $umts_ue"	
	}
}

# function: make two nodes(interfaces) move together, because actually a mobile phone with
# 	two different network cards but they are at the same position, they are all in the cellphone
# args
# 	wlan_ue: wifi network interface
# 	umts_ue: umts(3G) network interface
proc syncTwoInterfaces {wlan_ue umts_ue} {
	$umts_ue set X_ [$wlan_ue set X_]
	$umts_ue set Y_ [$wlan_ue set Y_]
}

# function: initial network selection, when network topo done, mobile node will chose an network to stay according to RSSI
# args
# 	ue: the mutilple interfaces mobile node
# 	wlan_ue: the wifi network card
# 	umts_ue: the umts(3G) network card
# 	ap: the wifi access point
# 	bs: the 3G basetation 
# notice: we select network using the WIFI comes first policy
proc initNetworkSelection {ue wlan_ue umts_ue ap bs send_agent recv_agent} {
	set ap_cover_radiu 70
	set bs_cover_radiu 1000
	set ap_distance [getDistance $wlan_ue $ap]
	set bs_distance [getDistance $umts_ue $bs]
	if {ap_distance < $ap_cover_radiu} then {
		#select wifi
		puts "accessing to WLAN"
		networkSelection $ue $wlan_ue $send_agent $recv_agent
		return "WIFI"
	} else if {bs_distance < $bs_cover_radiu} {
		#select umts
		puts "accessing to UMTS"
		networkSelection $ue $umts_ue $send_agent $recv_agent
		return "UMTS"
	} else {
		puts "No network service"
		return "NO SERVICE"
	} 
}

# function: get coordinate x of node position
# args
# 	ue: the node we want to get
proc getNodePosition_x {ue} {
	$ue set X_
}

# function: get coordinate y of node position
# args
# 	ue: the node we want to get
proc getNodePosition_y {ue} {
	$ue set Y_
}

# function: get distance between two nodes
# args
# 	src_node: source node
# 	dst_node: destination ndoe
proc getDistance {src_node dst_node} {
	set src_x [$src_node set X_]
	set src_y [$src_node set Y_]
	set dst_x [$dst_node set X_]
	set dst_y [$dst_node set Y_]
	set distance_value_tmp [expr ($dst_x - $src_x)*($dst_x - $src_x) + ($dst_y - $src_y)*($dst_y - $src_y)]
	set distance_value [expr pow($distance_value_tmp, 0.5)]
}

# function: print position of node
# args: 
# 	node: node
proc printNodePosition {node} {
	set tmp_x [$node set X_]
	set tmp_y [$node set Y_]
	puts "X: $tmp_x Y:$tmp_y"	
}

# function: print Node id
# args 
# 	node: node name
proc printNodeID {node node_name} {
	set node_id [$node id]
	puts "$node_name id=$node_id"
}

# function: do handover action
# args
#     ue: the UE which want to handover
#     interface: the network interface which ue want to handover to
#     sent_agent: agent for sending
#     receieve_agent: agent for receiving
proc redirectTraffic {ue interface send_agent recieve_agent} {
	set flag [ checkCurrentDelay 0.05 ]
	if { $flag == 1 } then {
    	puts "handover happening now"
		$ue attach-agent $send_agent $interface 
		$ue connect-agent $send_agent $recieve_agent $interface  
	} else {
		set ns [ Simulator instance ]
		set now [ $ns now ]
		$ns at [expr $now + 0.2 ] "redirectTraffic $ue $interface $send_agent $recieve_agent"
	}
	
}

# function: network selection
# args:
# 	ue: multiple interfaces mobile node
# 	interface: the netwrok interface to use, which means chose the network
# 	send_agent: agent for sending data
# 	recv_agent: agent for recieving data
proc networkSelection {ue interface send_agent recv_agent} {
	$ue attach-agent $send_agent $interface
	$ue connect-agent $send_agent $recv_agent $interface
}

# function: record position of node 
# args
#     ue: the UE we want to record 
proc record {ue} {
   set ns [Simulator instance]
   set time 0.1;# record 0.5 second
   set pos_x [ $ue set X_ ]
   set pos_y [ $ue set Y_ ]
   set now [ $ns now ]

  # puts "$pos_x\t$pos_y"
   $ns at [expr $now + $time] "record $ue"
}

# function: check the current delay, if current delay >= given delay, return 1 else return 0
# args
# 	delay: given delay
proc checkCurrentDelay {delay} {
	set ns [ Simulator instance ]
	set time 0.3 ;#slot time to detect delay
	set realtrace_tmp [ new Agent/RealtimeTrace ]
	set current_delay [ $realtrace_tmp GetCurrentDelay "5.0.0" "3.0.2" "cbr" ]
	if { $current_delay >= $delay } then {
		set flag 1
	} else {
		set now [ $ns now ]
		$ns at [ expr $now + $time ] "checkCurrentDelay $delay"
		set flag 0
	}
}


proc getMeanDelay {} {
  set trace_tmp [new Agent/RealtimeTrace]
  set mean_delay [$trace_tmp GetMeanDelay "5.0.0" "3.0.2" "cbr" ]
  puts "mean_delay is $mean_delay s"
  set current_delay [$trace_tmp GetCurrentDelay "5.0.0" "3.0.2" "cbr"]
  puts "current_delay is $current_delay s"
  set mean_throughput [$trace_tmp GetMeanThroughput "5.0.0" "cbr" "1"]
  puts "mean_throughput is $mean_throughput Mb"
}
