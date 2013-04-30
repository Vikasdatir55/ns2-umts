# Test for MutiFaceNodes.
# @author rouil
# @date 04/19/2005.
# Scenario: Create a multi-interface node using different technologies
#           There is a TCP connection between the Yahoo and MutiFaceNode.
#           We first use the UMTS interface and at t=3sec we switch the traffic 
#           to the 802.11 interface.

#
# Topology scenario:
#
#                                   AP(5.0.0)->)
#                                   /
#                                  /
# Yahoo(3.0.0)---Youtube(4.0.0)--                              +------------------------------------+
#                                  \                             + td_scdma_interface(0):802.11(5.0.1)|              |
#                                   \                            +---------------------+ MutiFaceNode |
#                                   GGSN(2.0.0)                  + wifi_interface(0):UMTS(0.0.2)  |  (6.0.0)     |
#                                      |                         +------------------------------------+
#                                   SGSN(1.0.0)                  
#                                      |
#                                    RNC(0.0.0)
#                                      |
#                                   bstationUMTS(0.0.1)->)       dummyNode:UMTS(0.0.3)
#              
# Note: the dummy node is required since UMTS works with pairs of mobile nodes. If using 2-4..UMTS mobile node
#  the dummy node is not required.
# Note2: Previous statement is deprecated. A fix was made to ns so that
#        the dummy not is not required.
#
# rouil - 2007/02/16 - 1.1     - Fixed script. Configured channel on wireless nodes and AP to send beacon
#

#check input parameters
if {$argc != 0} {
	puts ""
	puts "Wrong Number of Arguments! No arguments in this topology"
	puts ""
	exit (1)
}

global ns

#defines function for flushing and closing files
proc finish {} {
    global ns f
    $ns flush-trace
    close $f
    puts " Simulation ended."
    exit 0
}
proc redirectTrafficToWIFI {multiFaceNode send_agent recv_agent wifi_interface} {
	#global ns
	#$ns trace-annotate "Redirecting traffic to WIFI"
	$multiFaceNode attach-agent $send_agent $wifi_interface
	$multiFaceNode connect-agent $send_agent $recv_agent $wifi_interface
}
proc redirectTrafficToUMTS {multiFaceNode send_agent recv_agent td_scdma_interface} {
	#global ns
	#$ns trace-annotate "Redirecting traffic to UMTS"
	$multiFaceNode attach-agent $send_agent $td_scdma_interface
	$multiFaceNode connect-agent $send_agent $recv_agent $td_scdma_interface
}
proc redirectTrafficFromWIFIToUMTS {multiFaceNode send_agent recv_agent td_scdma_interface} {
	#global ns
	#$multiFaceNode attach-agent $send_agent $td_scdma_interface
	#$multiFaceNode connect-agent $send_agent $recv_agent $td_scdma_interface
	puts "NNNNNNNNN"
	$ns attach-agent $td_scdma_interface $send_agent
	$ns connect-agent $send_agent $recv_agent
}
source ./function.tcl
# set global variables
set output_dir .

#create the simulator
set ns [new Simulator]
#$ns use-newtrace

#open file for trace
set f [open out.tr w]
$ns trace-all $f

set namfile [open out.nam w]
$ns namtrace-all $namfile

# configure UMTS
$ns set hsdschEnabled_ 1addr
$ns set hsdsch_rlc_set_ 0
$ns set hsdsch_rlc_nif_ 0

# set up for hierarchical routing (needed for routing over a basestation)
$ns node-config -addressType hierarchical
AddrParams set domain_num_  8                      ;# domain number
AddrParams set cluster_num_ {1 1 1 1 1 1 1 1}            ;# cluster number for each domain 
AddrParams set nodes_num_   {23 1 1 1 1 2 1 1}	           ;# number of nodes for each cluster             

# configure RNC node
$ns node-config -UmtsNodeType RNC 
set RNC [$ns create-Umtsnode 0.0.0] ;# node id is 0.
setNodePosition $RNC 110 158 0
$ns at "$RNC label \"RNC\""
puts "RNC $RNC"

# configure UMTS base station
$ns node-config -UmtsNodeType bs \
		-downlinkBW 384kbs \
		-downlinkTTI 10ms \
		-uplinkBW 384kbs \
		-uplinkTTI 10ms \
  		-hs_downlinkTTI 2ms \
   		-hs_downlinkBW 384kbs 

set BS [$ns create-Umtsnode 0.0.1] ;# node id is 1
setNodePosition $BS 100 100 0 
$ns at "$BS label \"BS\""
$ns initial_node_pos $BS 100 
puts "BS $BS"

# connect RNC and base station
$ns setup-Iub $BS $RNC 622Mbit 622Mbit 15ms 15ms DummyDropTail 2000

$ns node-config -UmtsNodeType ue \
		-baseStation $BS \
		-radioNetworkController $RNC

for {set i 0} {$i < 20} {incr i 1} {
	set td_scdma_interface($i) [$ns create-Umtsnode 0.0.[expr 2+$i]]
	puts "td_scdma_interface created $td_scdma_interface(0)"
}

set dummy_node [$ns create-Umtsnode 0.0.3] ;# node id is 3
    puts "Creating dummy node $dummy_node"


# Node id for SGSN0 and GGSN0 are 4 and 5, respectively.
set SGSN [$ns node 1.0.0]
$ns at 0.005 "$SGSN label \"SGSN\""
setNodePosition $SGSN 139 150 0
$ns initial_node_pos $SGSN 5
puts "SGSN $SGSN"
set GGSN [$ns node 2.0.0]
$ns at 0.005 "$SGSN label \"GGSN\""
setNodePosition $GGSN 159 147 0
$ns initial_node_pos $GGSN 5
puts "GGSN $GGSN"
#
# Node address for Yahoo and Youtube are 6 and 7, respectively.
set Yahoo [$ns node 3.0.0]
$ns at 0.005 "$Yahoo label \"Yahoo\""
setNodePosition $Yahoo 57 244 0
$ns initial_node_pos $Yahoo 5
puts "Yahoo $Yahoo"

set Youtube [$ns node 4.0.0]
$ns at 0.005 "$Youtube label \"Youtube\""
setNodePosition $Youtube 75 183 0
$ns initial_node_pos $Youtube 5
puts "Youtube $Youtube"

set Facebook [$ns node 5.0.0]
$ns at 0.005 "$Facebook label \"Facebook\""
setNodePosition $Facebook 105 256 0
$ns initial_node_pos $Facebook 5

# do the connections in the UMTS part
$ns duplex-link $RNC $SGSN 622Mbit 0.4ms DropTail 1000
$ns duplex-link $SGSN $GGSN 622MBit 10ms DropTail 1000
$ns duplex-link $GGSN $Youtube 10MBit 15ms DropTail 1000
$ns duplex-link $Youtube $Yahoo 10MBit 35ms DropTail 1000
$ns duplex-link $Yahoo $Facebook 10MBit 35ms DropTail 1000
$RNC add-gateway $SGSN

#
# Now we add 802.11 nodes
#

# parameter for wireless nodes
set opt(chan)           Channel/WirelessChannel    ;# channel type for 802.11
set opt(prop)           Propagation/TwoRayGround   ;# radio-propagation model 802.11
set opt(netif)          Phy/WirelessPhy            ;# network interface type 802.11
set opt(mac)            Mac/802_11                 ;# MAC type 802.11
set opt(ifq)            Queue/DropTail/PriQueue    ;# interface queue type 802.11
set opt(ll)             LL                         ;# link layer type 802.11
set opt(ant)            Antenna/OmniAntenna        ;# antenna model 802.11
set opt(ifqlen)         50              	   ;# max packet in ifq 802.11
set opt(adhocRouting)   DSDV                       ;# routing protocol 802.11
set opt(umtsRouting)    ""                         ;# routing for UMTS (to reset node config)

set opt(x)		670			   ;# X dimension of the topography
set opt(y)		670			   ;# Y dimension of the topography

# configure rate for 802.11
Mac/802_11 set basicRate_ 11Mb
Mac/802_11 set dataRate_ 11Mb
Mac/802_11 set bandwidth_ 11Mb
Mac/802_11 set client_lifetime_ 10 ;#increase since iface 2 is not sending traffic for some time

#create the topography
set topo [new Topography]
$topo load_flatgrid $opt(x) $opt(y)
puts "Topology created"

# create God
create-god 31				                ;# give the number of nodes 

# creation of the MutiFaceNodes
$ns node-config  -multiIf ON                            ;#to create MultiFaceNode
set multiFaceNode [$ns node 7.0.0] 
$ns node-config  -multiIf OFF                           ;#reset attribute

# configure Access Points
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
                 -agentTrace ON \
                 -routerTrace OFF \
                 -macTrace ON  \
                 -movementTrace OFF

# configure Base station 802.11
set AP [$ns node 6.0.0]
$AP set X_ [expr 51.0]
$AP set Y_ 55.0
$AP set Z_ 0.0
[$AP set mac_(0)] bss_id [[$AP set mac_(0)] id]
[$AP set mac_(0)] enable-beacon
[$AP set mac_(0)] set-channel 6

# creation of the wireless interface 802.11
$ns node-config -wiredRouting OFF \
                -macTrace ON 				
for {set i 0} {$i < 1} {incr i 1} {
	set wifi_interface($i) [$ns node 6.0.[expr $i+1]]
	$wifi_interface($i) random-motion 0
	$wifi_interface($i) base-station [AddrParams addr2id [$AP node-addr]]
	setRandomPositionForNode $wifi_interface($i) 155.0 110.0	
	syncTwoInterfaces $wifi_interface($i) $td_scdma_interface($i)

	[$wifi_interface($i) set mac_(0)] set-channel [expr int(fmod($i, 6))+1 ]
	set channel_no [expr int(fmod($i,6))+1]
	puts "wifi_interface created at channel $channel_no..."			           ;# debug info
}

setNodePosition $wifi_interface(0) 50 50 0

# add link to backbone
$ns duplex-link $AP $GGSN 10MBit 15ms DropTail 1000

# add interfaces to MultiFaceNode
$multiFaceNode add-interface-node $wifi_interface(0)
$multiFaceNode add-interface-node $td_scdma_interface(0)

#
#create traffic: TCP application between Yahoo and Multi interface node
#

# create a TCP agent and attach it to multi-interface node
set udp(0) [new Agent/UDP]
#    $ns attach-agent $td_scdma_interface(0) $udp(0) ;# old command to attach to node
#$multiFaceNode attach-agent $udp(0) $td_scdma_interface(0)                   ;# new command: the interface is used for sending
#$multiFaceNode attach-agent $udp(0) $wifi_interface(0)                   ;# new command: the interface is used for sending
set app_(0) [new Application/Traffic/CBR]
$app_(0) attach-agent $udp(0)
$ns at 0.5 "$app_(0) start"
puts "App0 id=$app_(0)"

    
# create a TPC agent and attach it to Yahoo
set udp(1) [new Agent/Null] 
$ns attach-agent $Yahoo $udp(1)
set app_(1) [new Application/Traffic/CBR]
puts "App1 id=$app_(1)"

#redirectTrafficToUMTS $multiFaceNode $udp(0) $udp(1) $td_scdma_interface(0)
#$multiFaceNode attach-agent $udp(0) $wifi_interface(0)
#$multiFaceNode connect-agent $udp(0) $udp(1) $wifi_interface(0)
$ns attach-agent $wifi_interface(0) $udp(0)
$ns connect $udp(0) $udp(1)

#$multiFaceNode attach-agent $udp(0) $td_scdma_interface(0)

# connect both TCP agent
#$ns connect $udp(0) $udp(1) ;# old command to connect to agent
#$multiFaceNode connect-agent $udp(0) $udp(1) $wifi_interface(0) ;# new command: specify the interface to use
puts "udp stream made from udp(0) and sink(0)"

# do some kind of registration in UMTS
$ns node-config -llType UMTS/RLC/AM \
		-downlinkBW 384kbs \
		-uplinkBW 384kbs \
		-downlinkTTI 20ms \
		-uplinkTTI 20ms \
   		-hs_downlinkTTI 2ms \
   		-hs_downlinkBW 384kbs

# for the first HS-DSCH, we must create. If any other, then use attach-hsdsch
$ns create-hsdsch $td_scdma_interface(0) $udp(0)

# we must set the trace for the environment. If not, then bandwidth is reduced and
# packets are not sent the same way (it looks like they are queued, but TBC)
$BS setErrorTrace 0 "idealtrace"
#$BS setErrorTrace 1 "idealtrace"

# load the CQI (Channel Quality Indication)
$BS loadSnrBlerMatrix "SNRBLERMatrix"

# enable trace file
#$BS trace-outlink $f 2
#$td_scdma_interface(0) trace-inlink $f 2
#$td_scdma_interface(0) trace-outlink $f 3

# we cannot start the connect right away. Give time to routing algorithm to run

# function to redirect traffic from wifi_interface(0) to wifi_interface(0)
proc redirectTraffic {} {
    global multiFaceNode udp wifi_interface
    $multiFaceNode attach-agent $udp(0) $wifi_interface(0) ;# the interface is used for sending
    $multiFaceNode connect-agent $udp(0) $udp(1) $wifi_interface(0) ;# the interface is used for receiving
}
proc wifiToumts {} {
	global multiFaceNode udp td_scdma_interface
	global ns
	$ns trace-annotate "Redirecting traffic to UMTS"
	puts "No No"
#	$multiFaceNode attach-agent $udp(0) $td_scdma_interface(0)
	$multiFaceNode connect-agent $udp(0) $udp(1) $td_scdma_interface(0)
}


# send a message via Traffic/CBR
# The string will be interpreted by the receiver as Tcl code.
for { set i 1 } { $i < 5 } { incr i} {
    $ns at [expr $i + 0.5] "$app_(0) send {my message $i}"
}

# call to redirect traffic
#$ns at 2 "redirectTrafficToWIFI $multiFaceNode $udp(0) $udp(1) $wifi_interface(0)"
#$ns at 3 "redirectTrafficFromWIFIToUMTS $multiFaceNode $udp(0) $udp(1) $td_scdma_interface(0)"
#$ns at 3 "wifiToumts"

$ns at 5 "finish"

puts " Simulation is running ... please wait ..."
$ns run
