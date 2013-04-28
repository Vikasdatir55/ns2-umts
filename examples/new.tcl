# Check input
if {$argc != 0} {
	puts ""
	puts "Wrong Number of Arguments! No arguments in this topology"
	puts ""
	exit (1)
}
global ns

source ./function.tcl
source ./topo.tcl

# set output directory
set output_dir .

#create a simulation instance
set ns [new Simulator]
#$ns use-newtrace

#set trace output file and directory
set f [open out.tr w]
$ns trace-all $f
set namfile [open out.nam w]
#$ns namtrace-all-wireless $namfile 1000 1000
$ns namtrace-all $namfile

# configure UMTS 
$ns set hsdschEnabled_ 1addr
$ns set hsdsch_rlc_set_ 0
$ns set hsdsch_rlc_nif_ 0

# configure address model (domain:cluster:ip number) (needed for routing over a basestation)
$ns node-config -addressType hierarchical
AddrParams set domain_num_  31           	           												;# domain number
AddrParams set cluster_num_ {1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}      	;# cluster number
AddrParams set nodes_num_   {22 1 1 1 1 1 1 1 1 1 21 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}	  	;# nodes number             

#configure RNC 
puts ""
puts "Creating RNC"
$ns node-config -UmtsNodeType rnc 
set RNC [$ns create-Umtsnode 0.0.0] ;# node id is 0.
$ns at 0.005 "$RNC label \"RNC 0.0.0\""

setNodePosition $RNC $opt(RNC_X) $opt(RNC_Y) 0 
$RNC color "yellow"
$ns initial_node_pos $RNC 5
printNodeID $RNC "RNC"
puts "Done RNC configuration"

# UMTS Bastation
puts ""
puts "Creating BS"
$ns node-config -UmtsNodeType bs \
		-downlinkBW 384kbs \
		-downlinkTTI 10ms \
		-uplinkBW 384kbs \
		-uplinkTTI 10ms \
     	-hs_downlinkTTI 2ms \
      	-hs_downlinkBW 384kbs 

set BS [$ns create-Umtsnode 0.0.1] ;# node id is 1, BS and RNC is in the same domain
$ns at 0.005 "$BS label \"BS 0.0.1\""

setNodePosition $BS $opt(BS_X) $opt(BS_Y) 0
$BS color yellow
$ns initial_node_pos $BS 400
printNodeID $BS "BS"
puts "Done BS configuration"

# Link BS and RNC 
$ns setup-Iub $BS $RNC 622Mbit 622Mbit 15ms 15ms DummyDropTail 2000 color red

#create UMTS nodes
puts ""
puts "Creating UMTS nodes"
$ns node-config -UmtsNodeType ue \
		-baseStation $BS \
		-radioNetworkController $RNC

for {set i 0} {$i < 20} {incr i 1} {
	set td_scdma_interface($i) [$ns create-Umtsnode 0.0.[expr $i+2]]
	
#	$ns at 0.005 "$td_scdma_interface($i) label \"td_scdma_interface($i) 0.0.[expr $i+2]\""
	setRandomPositionForNode $td_scdma_interface($i) 400 600
	$ns initial_node_pos $td_scdma_interface($i) $opt(node_size)
	$td_scdma_interface($i) color "red"
}

# create a dummy node for simulation run normally, but
# it seems no need anymore

# Create SGSN and GGSN, they are in different domain and id for SGSN0 and GGSN0 are 4 and 5, respectively.

puts ""
puts "Creating SGSN and GGSN"

set SGSN [$ns node 1.0.0]
$ns at 0.005 "$SGSN label \"SGSN 1.0.0\""
setNodePosition $SGSN $opt(SGSN_X) $opt(SGSN_Y) 0
printNodeID $SGSN "SGSN"
$SGSN color "blue"
$ns initial_node_pos $SGSN $opt(node_size)

set GGSN [$ns node 2.0.0]
$ns at 0.005 "$GGSN label \"GGSN 2.0.0\""
setNodePosition $GGSN $opt(GGSN_X) $opt(GGSN_Y) 0
printNodeID $GGSN "GGSN"
$GGSN color "blue"
$ns initial_node_pos $GGSN $opt(node_size)

puts "Done SGSN and GGSN creation"


# Create core-network node

puts ""
puts "Creating core-network node"

set Yahoo [$ns node 3.0.0]
$ns at 0.005 "$Yahoo label \"Yahoo\""
setNodePosition $Yahoo $opt(Yahoo_X) $opt(Yahoo_Y) 0
$ns initial_node_pos $Yahoo $opt(node_size)

set Youtube [$ns node 4.0.0]
$ns at 0.005 "$Youtube label \"Youtube\""
setNodePosition $Youtube $opt(Youtube_X) $opt(Youtube_Y) 0
$ns initial_node_pos $Youtube $opt(node_size)

set Facebook [$ns node 5.0.0]
$ns at 0.005 "$Facebook label \"Facebook\""
setNodePosition $Facebook $opt(Facebook_X) $opt(Facebook_Y) 0
$ns initial_node_pos $Facebook $opt(node_size)

set QQ [$ns node 6.0.0]
$ns at 0.005 "$QQ label \"QQ\""
setNodePosition $QQ $opt(QQ_X) $opt(QQ_Y) 0
$ns initial_node_pos $QQ $opt(node_size)

set JingFm [$ns node 7.0.0]
$ns at 0.005 "$JingFm label \"JingFm\""
setNodePosition $JingFm $opt(JingFm_X) $opt(JingFm_Y) 0
$ns initial_node_pos $JingFm $opt(node_size)

set Steam [$ns node 8.0.0]
$ns at 0.005 "$Steam label \"Steam\""
setNodePosition $Steam $opt(Steam_X) $opt(Steam_Y) 0
$ns initial_node_pos $Steam $opt(node_size)

set Google [$ns node 9.0.0]
$ns at 0.005 "$Google label \"Google\""
setNodePosition $Google $opt(Google_X) $opt(Google_Y) 0
$ns initial_node_pos $Google $opt(node_size)

puts "Done core-network node creation"

# do the connections in the UMTS part
puts ""
puts "Connecting RNC SGSN GGSN CN_host0"

$ns duplex-link $RNC $SGSN 622Mbit 0.4ms DropTail 1000 color red
$ns duplex-link $SGSN $GGSN 622MBit 10ms DropTail 1000 color red
$ns duplex-link $GGSN $Yahoo 10MBit 15ms DropTail 1000 color red
$ns duplex-link $GGSN $Youtube 10MBit 15ms DropTail 1000 color red
$ns duplex-link $GGSN $Facebook 10MBit 15ms DropTail 1000 color red
$ns duplex-link $GGSN $QQ 10MBit 15ms DropTail 1000 color red
$ns duplex-link $GGSN $JingFm 10MBit 15ms DropTail 1000 color red
$ns duplex-link $GGSN $Steam 10MBit 15ms DropTail 1000 color red
$ns duplex-link $GGSN $Google 10MBit 15ms DropTail 1000 color red
$RNC add-gateway $SGSN

puts "Done connection of RNC, SGSN GGSN CN_host0"

puts ""
puts "Add Gateway"
$RNC add-gateway $SGSN                                  		;#这一句应该放在链路搭建完成之后，一般情况放在这个位置
puts "Done adding gateway"

# add WLAN network 

puts ""
puts "Creating WLAN"
# parameter for wireless nodes
set opt(chan)           Channel/WirelessChannel   			;# channel type for 802.11
set opt(prop)           Propagation/TwoRayGround   			;# radio-propagation model 802.11
set opt(netif)          Phy/WirelessPhy            			;# network interface type 802.11
set opt(mac)            Mac/802_11                 			;# MAC type 802.11
set opt(ifq)            Queue/DropTail/PriQueue    			;# interface queue type 802.11
set opt(ll)             LL                         			;# link layer type 802.11
set opt(ant)            Antenna/OmniAntenna        			;# antenna model 802.11
set opt(ifqlen)         50              	   			    ;# max packet in ifq 802.11
set opt(adhocRouting)   DSDV                       			;# routing protocol 802.11
set opt(umtsRouting)    ""                         			;# routing for UMTS (to reset node config)
set opt(x) 				2500   			                    ;# X dimension of the topography
set opt(y) 				2500		                        ;# Y dimension of the topography

Mac/802_11 set basicRate_ 11Mb
Mac/802_11 set dataRate_ 11Mb
Mac/802_11 set bandwidth_ 11Mb
Mac/802_11 set client_lifetime_ 10 					            ;#increase since iface 2 is not sending traffic for some time

puts "Creating topology"
set topo [new Topography]
$topo load_flatgrid $opt(x) $opt(y)
puts "Topology created"

# create God
#set god [create-god 92]				                		     ;# give the number of nodes 
create-god 72

# Create multiple interfaces nodes
puts ""
puts "Creating multiple interfaces ue"
$ns node-config  -multiIf ON                            		;#to create MultiFaceNode
for {set i 0} {$i < 20} {incr i 1} {
	set ue($i) [$ns node [expr 11+$i].0.0]						;# multiIf has not X_ and Y_
	$ns at 0.005 "$ue($i) label \"ue($i) [expr 10+$i].0.0]\""	
	set in_service_network($i) $NO_SERVICE

	#$ns initial_node_pos $ue($i) 1
}
$ns node-config  -multiIf OFF                           		;#reset attribute
puts "Done multiIf node creation"

# set number of hop between nodes, minimize the calculation time
#$god set-dist 1 2 1 
#$god set-dist 0 2 2 
#$god set-dist 0 1 1 
#set god [God instance]

puts "Creating AP"
puts ""
puts "coverge:70m"

Phy/WirelessPhy set Pt_ 0.025
Phy/WirelessPhy set RXThresh_ 3.92405e-08
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
                 -macTrace ON  \
                 -movementTrace ON	

# configure Base station 802.11
set AP0 [$ns node 10.0.0]
$ns at 0.005 "$AP0 label \"AP0 3.0.0\""

setNodePosition $AP0 $opt(AP_X) $opt(AP_Y) 0 
printNodeID $AP0 "AP0"
$AP0 color red
$ns initial_node_pos $AP0 50

[$AP0 set mac_(0)] bss_id [[$AP0 set mac_(0)] id]
[$AP0 set mac_(0)] enable-beacon
[$AP0 set mac_(0)] set-channel 1

puts "Done AP creation"

# creation of the wireless interface 802.11
puts ""
puts "Creating WLAN UEs"
$ns node-config -wiredRouting OFF \
                -macTrace ON 				
for {set i 0} {$i < 20} {incr i 1} {
	set wifi_interface($i) [$ns node 10.0.[expr $i+1]]
	$wifi_interface($i) random-motion 1
#	$ns at 0.005 "$wifi_interface($i) label \"wifi_interface($i) 3.0.[expr $i+1]\""

	$wifi_interface($i) base-station [AddrParams addr2id [$AP0 node-addr]]
	setRandomPositionForNode $wifi_interface($i) [expr 460-$i*20] [expr 500+$i*20]
	syncTwoInterfaces $wifi_interface($i) $td_scdma_interface($i)

	#[$wifi_interface($i) set mac_(0)] set-channel 1
	printNodeID $wifi_interface($i) "wifi_interface($i)"
#	printNodePosition $wifi_interface($i)
	$ns initial_node_pos $wifi_interface($i) $opt(node_size)
	$td_scdma_interface($i) color blue
}
puts "Done creation of WLAN UEs"
# add link to backbone
puts ""
puts "Connecting AP0 to GGSN"
$ns duplex-link $AP0 $GGSN 10MBit 15ms DropTail 1000
puts "Done connection of AP0 and GGSN"

# add interfaces to MultiFaceNode
puts ""
puts "adding interfaces to multiface ue"
for {set i 0} {$i < 20} {incr i 1} {
	$ue($i) add-interface-node $wifi_interface($i)
	$ue($i) add-interface-node $td_scdma_interface($i)
}
puts "Done adding interfaces to multiface ue"

puts ""
puts "creating a real time monitor agent"
set realtime_monitor [new Agent/RealtimeTrace]

for {set i 0} {$i < 20} {incr i 1} {
	set src_umts($i)  [new Agent/UDP]
	$ue($i) attach-agent $src_umts($i) $td_scdma_interface($i)
	set sink_umts($i) [new Agent/Null]
	#$ue(0) attach-agent $sink(0) $td_scdma_interface(0) 
    $ns attach-agent $td_scdma_interface($i) $sink_umts($i)
    $src_umts($i) set fid_ $i
    $sink_umts($i) set fid_ $i

    set src_wlan($i)  [new Agent/UDP]
    $ue($i) attach-agent $src_wlan($i) $wifi_interface($i)
    set sink_wlan($i) [new Agent/Null]
    $ns attach-agent $wifi_interface($i) $sink_wlan($i)
    $src_wlan($i) set fid_ [expr $i+20]
    $sink_wlan($i) set fid_ [expr $i+20]
}

for {set i 0} {$i < 20} {incr i 1} {
	set app($i) [new Application/Traffic/CBR]
}

# Scanning Networks
array set in_service_network [scanNetworks 20 ue in_service_network wifi_interface td_scdma_interface $AP0 $BS]

puts "Done initiation networks"

for {set i 0} {$i < 18} {incr i 1} {
	set dst_node_index [expr $i+2]

 	if {$in_service_network($i) == $WIFI_IN_SERVICE && $in_service_network($dst_node_index) == $WIFI_IN_SERVICE} {
 		#$ns connect $src_wlan($i) $sink_wlan($dst_node_index)
 		$ue($i) connect-agent $src_wlan($i) $sink_wlan($dst_node_index) $wifi_interface($i)
 		$app($i) attach-agent $src_wlan($i)
 		puts "WIFI TO WIFI"
 	}
 	if {$in_service_network($i) == $UMTS_IN_SERVICE && $in_service_network($dst_node_index) == $WIFI_IN_SERVICE} {
 		#$ns connect $src_umts($i) $sink_wlan($dst_node_index)
 		$ue($i) connect-agent $src_umts($i) $sink_wlan($dst_node_index) $td_scdma_interface($i)
 		$app($i) attach-agent $src_umts($i)
 		puts "UMTS TO WIFI"
 	}
 	if {$in_service_network($i) == $WIFI_IN_SERVICE && $in_service_network($dst_node_index) == $UMTS_IN_SERVICE} {
 		#$ns connect $src_wlan($i) $sink_umts($dst_node_index)
 		$ue($i) connect-agent $src_wlan($i) $sink_umts($dst_node_index) $wifi_interface($i)
 		$app($i) attach-agent $src_wlan($i)
 		puts "WIFI TO UMTS"
 	}
 	if {$in_service_network($i) == $UMTS_IN_SERVICE && $in_service_network($dst_node_index) == $UMTS_IN_SERVICE} {
 		#$ns connect $src_umts($i) $sink_umts($dst_node_index)
 		$ue($i) connect-agent $src_umts($i) $sink_umts($dst_node_index) $td_scdma_interface($i)
 		$app($i) attach-agent $src_umts($i)
 		puts "UMTS TO UMTS"
 	}
	$app($i) set packet_size_ [expr 666+$i]
	$app($i) set type_ CBR
	$ns at [expr 1.0+$i/5] "$app($i) start"
}

# do some kind of registration in UMTS
puts ""
puts "doing some kind of registration in UMTS......"
$ns node-config -llType UMTS/RLC/AM \
		-downlinkBW 384kbs \
		-uplinkBW 384kbs \
		-downlinkTTI 20ms \
		-uplinkTTI 20ms \
   		-hs_downlinkTTI 2ms \
    	-hs_downlinkBW 384kbs

# for the first HS-DSCH, we must create. If any other, then use attach-hsdsch

$ns create-hsdsch $td_scdma_interface(0) $src_umts(0)
for {set i 1} {$i < 19} {incr i 1} {
	#$ns attach-hsdsch $td_scdma_interface(1) $src_umts(1)
	#$ns attach-hsdsch $td_scdma_interface(1) $sink_umts(1)
	$ns attach-hsdsch $td_scdma_interface($i) $src_umts($i)
	$ns attach-hsdsch $td_scdma_interface($i) $sink_umts($i)
}
puts "Done umts registration"

# we must set the trace for the environment. If not, then bandwidth is reduced and
# packets are not sent the same way (it looks like they are queued, but TBC)
puts "set trace for the environment......"

$BS setErrorTrace 0 "idealtrace"

# load the CQI (Channel Quality Indication)
puts "loading Channel Quality Indication......"

$BS loadSnrBlerMatrix "SNRBLERMatrix"

$BS trace-outlink $f 2

#for {set i 0} {$i < 20} {incr i 1} {
#  $td_scdma_interface($i) trace-inlink $f $i
#  $td_scdma_interface($i) trace-outlink $f $i
#  $wifi_interface($i) trace-outlink $f [expr $i + 20]
#  $wifi_interface($i) trace-inlink $f [expr $i + 20]
#}

# call to redirect traffic
#$ns at 2 "redirectTraffic $ue(0) $wifi_interface(0) $src_wlan(0) $sink_wlan(1)"
#$ns at 2 "$ns trace-annotate \"Redirecting traffic\""

$ns at 15 "finish"

puts " Simulation is running ... please wait ..."
$ns run
