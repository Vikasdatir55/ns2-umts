source ./sarsa.tcl
source ./constant.tcl
global alpha 
global gamma


set ns [new Simulator] 

set num_act 2
set num_state 16

set Q [InitQ 16 2]
puts $Q

set ue 0
puts [GetState $ue 0 1 1 ]
set Q [lreplace $Q 2 2 -1]
puts $Q 
puts [GetAction $ue 1 $Q]

PrintQ $Q 2 16

puts "Test UpdateQ"

set r_previous 1
set r_current 1.5

set current_index 1  
set Q [UpdateQ $ue $r_previous $r_current $Q $current_index]

PrintQ $Q 2 16

puts "Test CalculateReword"
set d_cost 0.1
set d_bandth 0.1 
set d_delay 0.1
set d_jitter 0.1
set d_loss 0.1
set d_energy 0.1 

set alpha_c [expr 1.0/3]
set alpha_p [expr 1.0/3]
set alpha_i [expr 1.0/3]

puts [CalculateReward $d_cost $d_bandth $d_delay \
		 $d_jitter $d_loss $d_energy $alpha_c $alpha_p $alpha_i]


$ns run