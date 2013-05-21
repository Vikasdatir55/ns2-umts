#==========================================================================
# Filename: handover.tcl
# Author: Huang Minghe <H.Minghe@gmail.com>
# Description: handover between wifi and umts
# You can: Freely copy, distribute,and use under the following conditions
#		No direct commercial advantage is obtained
#		No liability is attributed to the author for any damages incurred.
# I hope:	When changes happen,let me know. thanks
#==========================================================================
if {$argc != 0} {
  	puts ""
  	puts "Wrong Number of Arguments! No arguments in this topology"
  	puts ""
  	exit (1)
}

global ns

global battery_life		;# the battery left list of UEs

global network_type		;# the network type (UMTS or WiFi) of UEs in
						;# 0 stands for No Network Service
						;# 1 stands for WIFI 
						;# 2 stands for UMTS

global app_type			;# the application type list of UEs are doing
						;# 0 stands for Conversational Class
						;# 1 stands for Streaming Class
						;# 2 stands for Interactive Class
						;# 3 stands for Backgound Class

global Q_map			;# the Q value map for the test UE with Sarsa algorithm

global state			;# the state of UE(with Sarsa) is in
set state 0

global delay_sarsa 		;# the network delay of Sarsa UE
global throught_sarsa	;# the network bandth of Sarsa UE
global jitter_sarsa		;# the network jitter of Sarsa UE 
global drop_sarsa		  ;# the packet drop rate of Sarsa UE

set delay_sarsa 0		  ;# doing the initiation	
set throught_sarsa 0	;#
set jitter_sarsa 0		;#
set drop_sarsa 0		  ;# end

global delay_no			;# the network delay of normal UE
global throught_no	;# the network bandth of normal UE
global jitter_no		;# the network jitter of normal UE 
global drop_no			;# the packet drop rate of normal UE

global reward			  ;# the reward of action when Sarsa UE takes 
set reward 0

set thresh_hold_delay(0) 0.4  ;#400ms for interaction voice talking
set thresh_hold_delay(1) 1.0  ;#1000ms for video watch
set thresh_hold_delay(2) 4.0  ;#4000m for web searching
set thresh_hold_delay(3) 120  ;#big tolerate for email ets

set thresh_hold_throughout(0) 0.004 ;# 4kB for interaction voice talking
set thresh_hold_throughout(1) 0.016 ;# 16kB for video watch 
set thresh_hold_throughout(2) 0.010 ;# 10kB for web searching
set thresh_hold_throughout(3) 0.010 ;# 10kB for email and some other beyound service

set thresh_hold_jitter(0) 0.001 ;#1ms for interaction voice talking
set thresh_hold_jitter(1) 0.001 ;#1ms for video watch
set thresh_hold_jitter(2) 10000 ;#almost not require 
set thresh_hold_jitter(3) 10000 ;#almost not require  

proc finish {} {
    global ns f namfile file_mt  file_md file_c file_battery_left file_ber file_jt
    $ns flush-trace
    close $f
    close $file_mt
    close $file_battery_left
    close $file_md
    close $file_jt
    close $file_c
    close $file_ber

    close $namfile
    puts "Simulation ended."
    exit 0
}

source ./function.tcl				;# including some functions needed by this simulation
source ./topo.tcl					  ;# the topo parameters included
source ./sarsa.tcl					;# the Sarsa algorithm function

set ns [new Simulator]
#$ns use-newtrace

set f [open out.tr w]
$ns trace-all $f
set namfile [open out.nam w]
$ns namtrace-all-wireless $namfile 800 800 

set file_mt [open mean_throughput.dat w] 			    ;# doing open some file to store the simulation results
set file_md [open mean_delay.dat w]					      ;#
set file_ber [open mean_ber.dat w]					      ;#
set file_jt [open jitter.dat w]						        ;#
set file_c [open cost.dat w]						          ;#
set file_battery_left [open battery_life.dat w]		;# end

$ns set hsdschEnabled_ 1addr
$ns set hsdsch_rlc_set_ 0
$ns set hsdsch_rlc_nif_ 0

$ns node-config -addressType hierarchical 			 ;# doing config hierarchical address (needed for routing over a basestation)
AddrParams set domain_num_  31                      			
AddrParams set cluster_num_ {1 1 1 1 1 1 1 1 1 1\
							 1 1 1 1 1 1 1 1 1 1\
							 1 1 1 1 1 1 1 1 1 1 1}            	
AddrParams set nodes_num_   {3 1 1 1 1 1 1 1 1 1\
							 21 1 1 1 1 1 1 1 1 1\
							 1 1 1 1 1 1 1 1 1 1 1}	         ;# end

$ns node-config -UmtsNodeType rnc 					       ;# doing configure RNC 
set RNC [$ns create-Umtsnode 0.0.0]					       ;#
SetNodePosition $RNC $opt(RNC_X) $opt(RNC_Y) 0		 ;#
$ns at 0.0 "$RNC label \"RNC\""						         ;# end

                                                   ;# doing configure base station
$ns node-config -UmtsNodeType bs \
		            -downlinkBW 384kbs \
		            -downlinkTTI 10ms \
		            -uplinkBW 384kbs \
		            -uplinkTTI 10ms \
                -hs_downlinkTTI 2ms \
                -hs_downlinkBW 384kbs              

set BS [$ns create-Umtsnode 0.0.1]
SetNodePosition $BS $opt(BS_X) $opt(BS_Y) 0
$ns initial_node_pos $BS $opt(bs_size)
$ns at 0.0 "$BS label \"BS\""                      ;# end 

#link BS and RNC 
$ns setup-Iub $BS $RNC 622Mbit 622Mbit 15ms 15ms DummyDropTail 2000

#create umts interface
$ns node-config -UmtsNodeType ue \
		            -baseStation $BS \
		            -radioNetworkController $RNC

for {set i 0} {$i < $opt(num_td_interface)} {incr i 1} {
    set td_scdma_interface($i) [$ns create-Umtsnode 0.0.[expr 2+$i]]
    RandomPositionForNode $td_scdma_interface($i) [$BS set X_] [$BS set Y_] 100
    $ns initial_node_pos $td_scdma_interface($i) $opt(node_size)
    $td_scdma_interface($i) color grey
}

#create SGSN and GGSN
set SGSN [$ns node 1.0.0]
SetNodePosition $SGSN $opt(SGSN_X) $opt(SGSN_Y) 0
$ns at 0.0 "$SGSN label \"SGSN\""

set GGSN [$ns node 2.0.0]
SetNodePosition $GGSN $opt(GGSN_X) $opt(GGSN_Y) 0
$ns at 0.0 "$GGSN label \"GGSN\""

#create application server 
for {set i 0} {$i < $opt(num_server)} {incr i 1} {
    set server($i) [$ns node [expr 3 + $i].0.0]
    #SetNodePosition $server($i) [expr 500+$i*5] [expr 500+$i*5] 0
    RandomPositionForNode $server($i) [$GGSN set X_] [$GGSN set Y_] 400
    $ns at 0.0 "$server($i) label \"$ser_name($i)\""
}
# do the connections in the UMTS part
$ns duplex-link $RNC $SGSN 1024Mbit 0.4ms DropTail 1000
$ns duplex-link $SGSN $GGSN 1024Mbit 10ms DropTail 1000
for {set i 0} {$i < $opt(num_server)} {incr i 1} {
    $ns duplex-link $GGSN $server($i) 1024Mbit 15ms DropTail 1000
}

$RNC add-gateway $SGSN                                 

#Create wifi network 

# parameter for wireless nodes
set opt(chan)           Channel/WirelessChannel   			;# channel type for 802.11
set opt(prop)           Propagation/TwoRayGround   			;# radio-propagation model 802.11
set opt(netif)          Phy/WirelessPhy            			;# network interface type 802.11
set opt(mac)            Mac/802_11                 			;# MAC type 802.11
set opt(ifq)            Queue/DropTail/PriQueue    			;# interface queue type 802.11
set opt(ll)             LL                         			;# link layer type 802.11
set opt(ant)            Antenna/OmniAntenna        			;# antenna model 802.11
set opt(ifqlen)         50              	   			      ;# max packet in ifq 802.11
set opt(adhocRouting)   DSDV                       			;# routing protocol 802.11
set opt(umtsRouting)    ""                         			;# routing for UMTS (to reset node config)

set opt(x)	   	        1000 			   			              ;# X dimension of the topography
set opt(y)		          1000			   			              ;# Y dimension of the topography

Mac/802_11 set basicRate_ 11Mb
Mac/802_11 set dataRate_ 11Mb
Mac/802_11 set bandwidth_ 11Mb
Mac/802_11 set client_lifetime_ 10 					            ;#increase since iface 2 is not sending traffic for some time

set topo [new Topography]
$topo load_flatgrid $opt(x) $opt(y)

# create God
set god [create-god 35]				                		       ;# give the number of nodes 
  
#create MultiFaceNode
$ns node-config  -multiIf ON                              ;#to create MultiFaceNode

for {set i 0} {$i < $opt(num_mobilnode)} {incr i 1} {
    set ue($i) [$ns node [expr 11 + $i].0.0] 
    #SetNodePosition $ue($i) [expr 100+$i*10] [expr 100+$i*5] 0
}

$ns node-config  -multiIf OFF                           		;#reset attribute

#set hop num 
#$god set-dist 1 2 1 
#$god set-dist 0 2 2 
#$god set-dist 0 1 1 
set god [God instance]

#Create Access Point 
puts "AP coverge:100m"

Phy/WirelessPhy set Pt_ 0.025
Phy/WirelessPhy set RXThresh_ 2.025e-12
Phy/WirelessPhy set CSThresh_ [expr 0.9*[Phy/WirelessPhy set RXThresh_]]

$ns node-config  -adhocRouting $opt(adhocRouting) \
                 -llType $opt(ll) \
                 -macType $opt(mac) \
                 -channel [new $opt(chan)] \
                 -ifqType $opt(ifq) \
                 -ifqLen $opt(ifqlen) \
                 -antType $opt(ant) \
                 -propType $opt(prop)    \
                 -phyType $opt(netif) \
                 -topoInstance $topo \
                 -wiredRouting ON \
                 -agentTrace OFF\
                 -routerTrace OFF \
                 -macTrace ON  \
                 -movementTrace OFF	

# configure Base station 802.11
set AP0 [$ns node 10.0.0]

[$AP0 set mac_(0)] bss_id [[$AP0 set mac_(0)] id]
[$AP0 set mac_(0)] enable-beacon
[$AP0 set mac_(0)] set-channel 1

SetNodePosition $AP0 $opt(AP_X) $opt(AP_Y) 0
$ns initial_node_pos $AP0 $opt(ap_size)
$ns at 0.0 "$AP0 label \"AP\""

# creation of the wireless interface 802.11
$ns node-config -wiredRouting OFF \
                -macTrace ON 			
for {set i 0} {$i < $opt(num_mobilnode)} {incr i 1} {
    set wifi_interface($i) [$ns node 10.0.[expr $i+1]]  
    puts [GetNodeIpAddress $wifi_interface($i)]                                  ;# create the node with given @.  
    $wifi_interface($i) random-motion 0
    set wifi_interface(0)_id [$wifi_interface($i) id]
    puts "wifi_interface($i)_id $wifi_interface($i)_id connet to AP0"            ;# disable random motion
    $wifi_interface($i) base-station [AddrParams addr2id [$AP0 node-addr]]       ;#attach mn to basestation

    [$wifi_interface($i) set mac_(0)] set-channel 1

    #SetRandomPositionForNode $wifi_interface($i)  120 250 
    RandomPositionForNode $wifi_interface($i) $opt(BS_X) $opt(BS_Y) 200
    SyncTwoInterfaces $wifi_interface($i)  $td_scdma_interface(0)

    $ns initial_node_pos $wifi_interface($i) $opt(node_size)

    RandomWorkModel $ns $wifi_interface($i) 1
    #$ns at 0.0 "$wifi_interface($i) setdest 550.0 300.0 40.0"
}	
# add link to backbone
$ns duplex-link $AP0 $RNC 1024Mbit 15ms DropTail 1000

# add interfaces to MultiFaceNode
for {set i 0} {$i < $opt(num_mobilnode)} {incr i 1} {
    $ue($i) add-interface-node $wifi_interface($i)

    #mention here, althrough we had create $opt(num_mobilenode) td_scdma_interface, 
    #but we have to add the $td_scdma_interface(0) to ue, because if this the experiment 
    #will work correct
    $ue($i) add-interface-node $td_scdma_interface(0)
}

# create realtime monitor aget 
set pfm_monitor [new Agent/RealtimeTrace]

# create udp agent for ue 
for {set i 0} {$i < $opt(num_mobilnode)} {incr i 1} {
    set udp_wifi($i) [new Agent/UDP]
    set udp_td_scdma($i) [new Agent/UDP]

    $ue($i) attach-agent $udp_wifi($i) $wifi_interface($i)
    #mention here, althrough we had create $opt(num_mobilenode) td_scdma_interface, 
    #but we have to add the $td_scdma_interface(0) to ue, because if this the experiment 
    #will work correct
    $ue($i) attach-agent $udp_td_scdma($i) $td_scdma_interface(0)
}

for {set i 0} {$i < $opt(num_server)} {incr i 1} {
    set null($i) [new Agent/Null]
    $ns attach-agent $server($i) $null($i)
}

# Set the function for UE, let ue has ability to
#   1. adjust the battery consuption rate according to network it is in 
#   2. choose any kind of application to start and stop at anytime
#   3. store the bandth, delay, jitter, packets loss rate every second
#   4. check and store the state degree every second

# the initial value of battery power if 1900mAh
set battery_life [CreateBattery $opt(num_mobilnode) 1900]
puts $battery_life

set network_type [ScanNetworks $opt(num_mobilnode) ue in_service_network wifi_interface $td_scdma_interface(0) $AP0 $BS]
puts $network_type

set app_type [RandomApplicationGeneration $opt(num_mobilnode) $opt(num_app_type)]
puts $app_type

set Q_map [InitQ 16 2]
PrintQ $Q_map 2 16

for {set i 0} {$i < $opt(num_mobilnode)} {incr i 1} {
    if {[lindex $network_type $i]  == $UMTS_IN_SERVICE} { 
        #$ue($i) attach-agent $udp_td_scdma($i) $td_scdma_interface($i)
        set app_type_tmp [lindex $app_type $i]
        puts "ue($i) is using TD-SCDMA and ue($i)'s application is $app_type_tmp"
        $ue($i) connect-agent $udp_td_scdma($i) $null($app_type_tmp) $td_scdma_interface(0)

        #We should create a application wifi according to $app_type_tmp
        set cbr($i) [new Application/Traffic/CBR] 
        $cbr($i) attach-agent $udp_td_scdma($i)
        $cbr($i) set type_ CBR 111
        $cbr($i) set rate_ 0.1mb
        $cbr($i) set random_ false
        $ns at 0.05 "$cbr($i) start"

        #we should get some times to let network build up. here we set 2.0
        #$ns at 2.0 "HandoverToWLAN_mt $ns $ue($i) $pfm_monitor $wifi_interface($i) $udp_td_scdma($i)  $null($app_type_tmp) 0.07 0.5 \"cbr\" "    
    }

    if {[lindex $network_type $i]  == $WIFI_IN_SERVICE} {
        #$ue($i) attach-agent $udp_wifi($i) $wifi_interface($i)
        set app_type_tmp [lindex $app_type $i]
        puts "ue($i) is using WIFI and ue($i)'s application is $app_type_tmp"
        $ue($i) connect-agent $udp_wifi($i) $null($app_type_tmp) $wifi_interface($i)

        #We should create a application wifi according to $app_type_tmp
        set cbr($i) [new Application/Traffic/CBR] 
        $cbr($i) attach-agent $udp_wifi($i)
        $cbr($i) set type_ CBR 222
        $cbr($i) set rate_ 0.5mb
        $cbr($i) set random_ false 
        $ns at 0.05 "$cbr($i) start"
    }

    #puts "$ns $ue($i) $i $battery_life $network_type $file_battery_left"
    #$ns at 1.0 "set battery_life [BatteryConsuption $ns $ue($i) $i $battery_life $network_type $file_battery_left]"
}

# do some kind of registration in UMTS
puts "****************************************************************"
puts "do some kind of registration in UMTS......"
$ns node-config -llType UMTS/RLC/AM \
		            -downlinkBW 384kbs \
		            -uplinkBW 384kbs \
		            -downlinkTTI 20ms \
		            -uplinkTTI 20ms \
   		          -hs_downlinkTTI 2ms \
    		        -hs_downlinkBW 384kbs

# for the first HS-DSCH, we must create. If any other, then use attach-hsdsch
puts "Creating HS-DSCH for data transfering......"

$ns create-hsdsch $td_scdma_interface(0) $udp_td_scdma(0)
for {set i 1} {$i < $opt(num_td_interface)} {incr i 1} {
    $ns attach-hsdsch $td_scdma_interface($i) $udp_td_scdma($i)
}


# we must set the trace for the environment. If not, then bandwidth is reduced and
# packets are not sent the same way (it looks like they are queued, but TBC)
puts "set trace for the environment......"

$BS setErrorTrace 0 "idealtrace"
#$BS setErrorTrace 1 "idealtrace"

# load the CQI (Channel Quality Indication)
puts "loading Channel Quality Indication......"
$BS loadSnrBlerMatrix "SNRBLERMatrix"

# function: set the consuption of battery pow when ue in wifi network
# args
#   here every parameter is the global, so we have no need to call parameter
proc G_BatteryConsuption {} {
	  global ns battery_life network_type file_battery_left
  	for {set i 0} {$i < 20} {incr i 1} {
        if {[lindex $battery_life $i] <= 0} {
          	puts "ue had ran out of battery pow"
            set battery_life [lreplace $battery_life $i $i 0]
          	puts -nonewline $file_battery_left  "Ran Out"
        } else {
          	if {[lindex $network_type $i] == 1} {
            		set battery_life [lreplace $battery_life $i $i [PowLoss_Wifi [lindex $battery_life $i]]]
          	} else {
            		set battery_life [lreplace $battery_life $i $i [PowLoss_TDSCDMA [lindex $battery_life $i]]]
         		}

          	puts -nonewline $file_battery_left  "$battery_life "
       	} 
  	}

    puts $file_battery_left ""
    set now [$ns now]
    $ns at [expr $now + 1] "G_BatteryConsuption"
}

# function: collect the mean throughput for ue
# args
# ns: simulation instance
# ue: ue to colloct 
# fp: the file to store 
# realtime_monitor: the realtime monitor
# time_slot: the time slot to monitor
# packet_type: the type of packet to monitor
proc TraceMeanThrough {ns ue fp realtime_monitor packet_type} {
    set ip [GetNodeIpAddress $ue]
    
    set mean_throughput [$realtime_monitor GetMeanThroughput $ip $packet_type "1"]
   # set throught_sarsa $mean_throughput

    puts $fp "$ip $mean_throughput"
    return $mean_throughput

   # set now [$ns now]
    #$ns at [expr $now + $time_slot] "TraceMeanThrough $ns $ue $fp $realtime_monitor $time_slot $packet_type"
}

# function: trace the mean delay for ue
# args
# ns: simulation instance
# src_ue:source ue to collect 
# dst_ue:destination ue to collect
# fp: the file to store 
# realtime_monitor: the realtime monitor
# time_slot: the time slot to monitor
# packet_type: the type of packet to monitor
proc TraceDelay {ns src_ue dst_ue fp realtime_monitor packet_type} {
    #global delay_sarsa

    set src_nodeaddr [GetNodeIpAddress $src_ue]
    set dst_nodeaddr [GetNodeIpAddress $dst_ue]
    #set trace_tmp [new Agent/RealtimeTrace]
    set delay [$realtime_monitor GetCurrentDelay $src_nodeaddr $dst_nodeaddr $packet_type]
    #set delay_sarsa $delay

    puts $fp "$src_nodeaddr $dst_nodeaddr $delay"

    return $delay
    
    #set now [$ns now]
    #$ns at [expr $now + $time_slot] "TraceDelay $ns $src_ue $dst_ue $fp $realtime_monitor $time_slot $packet_type"
}

# function: handle the Sarsa learning algorithm
# args

proc Sarsa {ue ue_index} {
    global ns
    global pfm_monitor

    global file_md
    global file_mt

    global Q_map 
    global battery_life
    global network_type
    global app_type
    global state

    global server
    global null
    global td_scdma_interface
    global wifi_interface
    global udp_td_scdma
    global udp_wifi

    global delay_sarsa
    global throught_sarsa

    global thresh_hold_delay
    global thresh_hold_throughout

    set app_type_index [lindex $app_type $ue_index]
    set network_type_index [lindex $network_type $ue_index]

    #first, get the state of ue
    set current_state [GetState $ue $ue_index $battery_life $app_type]
    puts "current state is $current_state"

    if {$current_state != $state} {
     # trigger the action chosing
      puts "State changed trigger"
     
      set action [GetAction $ue $current_state $Q_map]
      if {$action == 1} {
          # handover happen here
          if {$network_type_index == 1} {
              puts "Wifi to umts"
              set d_energy_consuption_rate [expr 0.02199*360 - 0.03199*360]
              set d_cost [expr 1.5]
              puts "d_energy_consuption_rate $d_energy_consuption_rate"
              puts "d_cost $d_cost"

              WifiToUmts $ns $ue $td_scdma_interface(0) $udp_td_scdma(0) $null($app_type_index)
          } elseif {$network_type_index == 2} {
              puts "Umts to wifi"
              set d_energy_consuption_rate [expr 0.03199*360 - 0.02199*360]
              set d_cost [expr -1.5]
              puts "d_energy_consuption_rate $d_energy_consuption_rate"
              puts "d_cost $d_cost"

              UmtsToWifi $ns $ue $wifi_interface(0) $udp_wifi(0) $null($app_type_index)
          } 
      } else {
          if {$network_type_index == 1} {
              puts "Wifi to umts"
              set d_energy_consuption_rate [expr 0.02199*360 - 0.03199*360]
              set d_cost [expr 1.5]
              puts "d_energy_consuption_rate $d_energy_consuption_rate"
              puts "d_cost $d_cost"
          } elseif {$network_type_index == 2} {
              puts "Umts to wifi"
              set d_energy_consuption_rate [expr 0.03199*360 - 0.02199*360]
              set d_cost [expr -1.5]
              puts "d_energy_consuption_rate $d_energy_consuption_rate"
              puts "d_cost $d_cost"
          } 
          puts "stay in the old network"
      }

      set current_delay [TraceDelay $ns $ue $server($app_type_index) $file_md $pfm_monitor "cbr"]
      set current_throughout [TraceMeanThrough $ns $ue $file_mt $pfm_monitor "cbr"]
     
      set d_delay [expr $current_delay - $delay_sarsa]

      set d_bandth [expr $current_throughout - $throught_sarsa]
      
      # here d_jitter and d_loss_rate is set manaully, actually it should get real time
      # but I may have no time to do that, my graduate thesis seems need to start write now
      # if there is any time left in the end, i will complete it.
      set d_jitter [expr 0.001]
      set d_loss_rate [expr 0.01]

      set alpha_i [expr 0.3]
      set alpha_c [expr 0.3]
      set alpha_p [expr 0.4]

      puts "d_energy_consuption_rate $d_energy_consuption_rate"
      puts "d_cost $d_cost"
      puts "d_delay $d_delay"
      puts "d_bandth $d_bandth = $current_throughout - $throught_sarsa"
      
      set reward [CalculateReward $d_cost $d_bandth $d_delay $d_jitter $d_loss_rate $d_energy_consuption_rate $alpha_c $alpha_p $alpha_i]

      puts "reward is $reward"
      set Q_map [UpdateQ $ue $reward $Q_map $current_state]
      PrintQ $Q_map 2 16

      set delay_sarsa $current_delay
      set throught_sarsa $current_throughout 

      set state $current_state
    } elseif {$current_state == $state} {
        # do nothing
        puts "no trigger"
    }

    puts "delay_sarsa is $delay_sarsa"
    puts "throught_sarsa is $throught_sarsa"

    if {$delay_sarsa > $thresh_hold_delay($app_type_index)} {
        # trigger the action chosing
        puts "Delay trigger"
    } elseif {$throught_sarsa < $thresh_hold_throughout($app_type_index)} {
        # trigger the action chosing
        puts "Throughput trigger"
    }
   
    # cheat here
    set app_type [RandomApplicationGeneration 20 4]

    set now [$ns now]
    $ns at [expr $now+1] "Sarsa $ue 0"
}


$ns at [expr 3.0] "Sarsa $ue(0) 0 "
$ns at [expr 1.0] "G_BatteryConsuption"
$ns at [expr 1.0] "TraceMeanThrough $ns $ue(0) $file_mt $pfm_monitor \"cbr\""

set f_delay [open delay_sarsa.dat w]
set server_index [lindex $app_type 0]
$ns at [expr 1.0] "TraceDelay $ns $ue(0) $server($server_index) $f_delay $pfm_monitor \"cbr\""


proc TraceBattery {fp ue ue_index} {
  global now battery_life ns
  
  puts $fp "[lindex $battery_life $ue_index]"

  set now [$ns now]
  $ns at [expr $now+1] "TraceBattery $fp $ue $ue_index"
}

$ns at [expr 200] "finish"

puts " Simulation is running ... please wait ..."
$ns run
