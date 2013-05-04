#==================================================================
# Filename: handover.tcl
# Author: Huang Minghe <H.Minghe@gmail.com>
# Description: handover between wifi and umts
# You can: Freely copy, distribute,and use under the following conditions
#		No direct commercial advantage is obtained
#		No liability is attributed to the author for any damages incurred.
# I hope:	When changes happen,let me know. thanks
#==================================================================

#check argc
if {$argc != 0} {
	puts ""
	puts "Wrong Number of Arguments! No arguments in this topology"
	puts ""
	exit (1)
}

global ns

proc finish {} {
    global ns f
    $ns flush-trace
    close $f
    close $namfile
    puts " Simulation ended."
    exit 0
}

source ./function.tcl
source ./topo.tcl

set ns [new Simulator]
$ns use-newtrace

set f [open out.tr w]
$ns trace-all $f
set namfile [open out.nam w]
$ns namtrace-all-wireless $namfile 800 800 

$ns set hsdschEnabled_ 1addr
$ns set hsdsch_rlc_set_ 0
$ns set hsdsch_rlc_nif_ 0

#confi (needed for routing over a basestation)
$ns node-config -addressType hierarchical
AddrParams set domain_num_  31                      			
AddrParams set cluster_num_ {1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}            	
AddrParams set nodes_num_   {22 1 1 1 1 1 1 1 1 1 21 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}	      	      

#configure RNC 
$ns node-config -UmtsNodeType rnc 
set RNC [$ns create-Umtsnode 0.0.0]
SetNodePosition $RNC $opt(RNC_X) $opt(RNC_Y) 0
$ns at 0.0 "$RNC label \"RNC\""

#configure base station
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
$ns at 0.0 "$BS label \"BS\"" 

#link BS and RNC 
$ns setup-Iub $BS $RNC 622Mbit 622Mbit 15ms 15ms DummyDropTail 2000

#create umts interface
$ns node-config -UmtsNodeType ue \
		            -baseStation $BS \
		            -radioNetworkController $RNC

for {set i 0} {$i < $opt(num_mobilnode)} {incr i 1} {
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
  RandomPositionForNode $server($i) [$GGSN set X_] [$GGSN set Y_] 150
  $ns at 0.0 "$server($i) label \"$ser_name($i)\""
}
# do the connections in the UMTS part
$ns duplex-link $RNC $SGSN 622Mbit 0.4ms DropTail 1000
$ns duplex-link $SGSN $GGSN 622MBit 10ms DropTail 1000
for {set i 0} {$i < $opt(num_server)} {incr i 1} {
  $ns duplex-link $GGSN $server($i) 10MBit 15ms DropTail 1000
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
set god [create-god 54]				                		       ;# give the number of nodes 
  
#create MultiFaceNode
$ns node-config  -multiIf ON                              ;#to create MultiFaceNode

for {set i 0} {$i < $opt(num_mobilnode)} {incr i 1} {
  set ue($i) [$ns node [expr 11 + $i].0.0] 
  #SetNodePosition $ue($i) [expr 100+$i*10] [expr 100+$i*5] 0
}

$ns node-config  -multiIf OFF                           		;#reset attribute

#set hop num 
$god set-dist 1 2 1 
$god set-dist 0 2 2 
$god set-dist 0 1 1 
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
  puts [GetNodeIpAddress $wifi_interface($i)]                                       ;# create the node with given @.  
  $wifi_interface($i) random-motion 0
  set wifi_interface(0)_id [$wifi_interface($i) id]
  puts "wifi_interface($i)_id $wifi_interface($i)_id connet to AP0"                                 ;# disable random motion
  $wifi_interface($i) base-station [AddrParams addr2id [$AP0 node-addr]]       ;#attach mn to basestation

  [$wifi_interface($i) set mac_(0)] set-channel 1

  #SetRandomPositionForNode $wifi_interface($i)  120 250 
  RandomPositionForNode $wifi_interface($i) $opt(BS_X) $opt(BS_Y)  100
  SyncTwoInterfaces $wifi_interface($i)  $td_scdma_interface($i)

  $ns initial_node_pos $wifi_interface($i) $opt(node_size)

  RandomWorkModel $ns $wifi_interface($i) 1
  #$ns at 0.0 "$wifi_interface($i) setdest 550.0 300.0 40.0"
}	
# add link to backbone
$ns duplex-link $AP0 $RNC 10MBit 15ms DropTail 1000

# add interfaces to MultiFaceNode
for {set i 0} {$i < $opt(num_mobilnode)} {incr i 1} {
  $ue($i) add-interface-node $wifi_interface($i)

  #mention here, althrough we had create $opt(num_mobilenode) td_scdma_interface, 
  #but we have to add the $td_scdma_interface(0) to ue, because if this the experiment 
  #will work correct
  $ue($i) add-interface-node $td_scdma_interface($i)
}

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

set network_type [ScanNetworks $opt(num_mobilnode) ue in_service_network wifi_interface td_scdma_interface $AP0 $BS]
puts $network_type

set app_type [RandomApplicationGeneration $opt(num_mobilnode) $opt(num_app_type)]
puts $app_type

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
}

# connect both TCP agent
puts "3 Connecting send agent and recieve agent"
#$ue(0) connect-agent $tcp_(0) $tcp_(1) $td_scdma_interface(0) ;# new command: specify the interface to use
#$tcp_(0) listen


puts "finished"
puts ""

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
for {set i 1} {$i < 20} {incr i 1} {
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

$ns at 25 "finish"

puts " Simulation is running ... please wait ..."
$ns run
