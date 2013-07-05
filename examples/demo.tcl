#==================================================================================
# Filename: demo.tcl
# Author: Huang Minghe <H.Minghe@gmail.com>
# Description: handover between wifi and umts
# You can: Freely copy, distribute,and use under the following conditions
#		No direct commercial advantage is obtained
#		No liability is attributed to the author for any damages incurred.
# I hope:	When changes happen,let me know. thanks
#==================================================================================
#
# Topology scenario:
#
#                                   AP(5.0.0)->)
#                                   /
#                                  /
# Google(3.0.0)---router(4.0.0)--                              +------------------------------------+
#                                  \                             + umts(0):802.11(5.0.1)|              |
#                                   \                            +---------------------+ MutiFaceNode |
#                                   GGSN(2.0.0)                  + wifi(0):UMTS(0.0.2)  |  (6.0.0)     |
#                                      |                         +------------------------------------+
#                                   SGSN(1.0.0)
#                                      |
#                                    RNC(0.0.0)
#                                      |
#                                   BS(0.0.1)->)       dummyNode:UMTS(0.0.3)
# Note: the dummy node is required since UMTS works with pairs of mobile nodes. If using 2-4..UMTS mobile node
#  the dummy node is not required.
# Note2: Previous statement is deprecated. A fix was made to ns so that
#        the dummy not is not required.

global ns

#defines function for flushing and closing files
proc finish {} {
  global ns f namfile
  $ns flush-trace
  close $f
  close $namfile
  puts " Simulation ended."
  exit 0
}

# function: handover ue from umts network to wifi network
# args
#   ns: ns simulator instance
#   ue: multiface node
#   wifi: wifi interface
#   send_agent: send agent
#   recv_agent: recv agent
proc UmtsToWifi {ns ue wifi send_agent recv_agent} {
  $ue attach-agent $send_agent $wifi
  $ue connect-agent $send_agent $recv_agent $wifi
  $ns trace-annotate "$ue handover from UMTS to Wifi"
}


#set some parameters
##################################

# it is ugly here, it's hard for me to layout the node in the nam beautifully, you can try
set opt(BS_X) 23
set opt(BS_Y) 425
set opt(AP_X) 1
set opt(AP_Y)	365
set opt(GGSN_X) 	674
set opt(GGSN_Y)		422
set opt(RNC_X)		315
set opt(RNC_Y) 		379
set opt(SGSN_X)		460
set opt(SGSN_Y) 	405
set opt(Google_X) 1261
set opt(Google_Y) 308
set opt(Yahoo_X)	1057
set opt(Yahoo_Y)	530


set opt(node_size) 	1
set opt(bs_size)	200
set opt(ap_size)	50

#create the simulator
set ns [new Simulator]
$ns use-newtrace

#open file for trace
set f [open out.tr w]
$ns trace-all $f
set namfile [open out.nam w]
$ns namtrace-all-wireless $namfile 800 800

# configure UMTS
$ns set hsdschEnabled_ 1addr
$ns set hsdsch_rlc_set_ 0
$ns set hsdsch_rlc_nif_ 0

# set up for hierarchical routing (needed for routing over a basestation)
$ns node-config -addressType hierarchical
AddrParams set domain_num_  7                          ;# domain number
AddrParams set cluster_num_ {1 1 1 1 1 1 1}            ;# cluster number for each domain
AddrParams set nodes_num_   {4 1 1 1 1 2 1}	           ;# number of nodes for each cluster

# configure RNC node
$ns node-config -UmtsNodeType RNC 
set RNC [$ns create-Umtsnode 0.0.0] ;# node id is 0.
$RNC set X_ $opt(RNC_X)
$RNC set Y_ $opt(RNC_Y)
$RNC set Z_ 0.0
$ns at 0.0 "$RNC label \"RNC\""		

# configure UMTS base station
$ns node-config -UmtsNodeType bs \
		-downlinkBW 384kbs \
		-downlinkTTI 10ms \
		-uplinkBW 384kbs \
		-uplinkTTI 10ms \
    -hs_downlinkTTI 2ms \
    -hs_downlinkBW 384kbs 

set BS(0) [$ns create-Umtsnode 0.0.1] ;# node id is 1
$BS(0) set X_ $opt(BS_X)
$BS(0) set Y_ $opt(BS_Y)
$BS(0) set Z_ 0.0

$ns initial_node_pos $BS(0) $opt(bs_size)
$ns at 0.0 "$BS(0) label \"BS\""

# connect RNC and base station
$ns setup-Iub $BS(0) $RNC 622Mbit 622Mbit 15ms 15ms DummyDropTail 2000

$ns node-config -UmtsNodeType ue \
		-baseStation $BS(0) \
		-radioNetworkController $RNC

set umts(0) [$ns create-Umtsnode 0.0.2] ;# node id is 2
$umts(0) set X_ [expr [$BS(0) set X_] + 50]
$umts(0) set Y_ [expr [$BS(0) set Y_] + 50]
$umts(0) set Z_ 0.0
$ns initial_node_pos $umts(0) $opt(node_size)
$umts(0) color black

set dummy_node [$ns create-Umtsnode 0.0.3] ;# node id is 3

# Node id for SGSN0 and GGSN0 are 4 and 5, respectively.
set SGSN [$ns node 1.0.0]
$SGSN set X_ $opt(SGSN_X)
$SGSN set Y_ $opt(SGSN_Y)
$SGSN set Z_ 0.0
$ns at 0.0 "$SGSN label \"SGSN\""
set GGSN [$ns node 2.0.0]
$SGSN set X $opt(SGSN_X)
$SGSN set Y_ $opt(SGSN_Y)
$SGSN set Z_ 0.0
$ns at 0.0 "$GGSN label \"GGSN\""
# Node address for Google and router are 6 and 7, respectively.
set Google [$ns node 3.0.0]
$Google set X_ $opt(Google_X)
$Google set Y_ $opt(Google_Y)
$Google set Z_ 0.0
$ns at 0.0 "$Google label \"GOOGLE\""
set router [$ns node 4.0.0]
$router set X_ $opt(Yahoo_X)
$router set Y_ $opt(Yahoo_Y)
$router set Y_ 0.0
$ns at 0.0 "$router label \"Router\""
# do the connections in the UMTS part
$ns duplex-link $RNC $SGSN 622Mbit 0.4ms DropTail 1000
$ns duplex-link $SGSN $GGSN 622MBit 10ms DropTail 1000
$ns duplex-link $GGSN $router 10MBit 15ms DropTail 1000
$ns duplex-link $router $Google 10MBit 35ms DropTail 1000
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

# create God
create-god 11				                ;# give the number of nodes 

# creation of the MutiFaceNodes
$ns node-config  -multiIf ON                            ;#to create MultiFaceNode
set ue(0) [$ns node 6.0.0] 
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
set AP [$ns node 5.0.0]
$AP set X_ $opt(AP_X)
$AP set Y_ $opt(AP_Y)
$AP set Z_ 0.0
$ns at 0.0 "$AP label \"AP\""
[$AP set mac_(0)] bss_id [[$AP set mac_(0)] id]
[$AP set mac_(0)] enable-beacon
[$AP set mac_(0)] set-channel 1

# creation of the wireless interface 802.11
$ns node-config -wiredRouting OFF \
                -macTrace ON 				
set wifi(0) [$ns node 5.0.1] 	                                   ;# create the node with given @.	
$wifi(0) random-motion 0			                           ;# disable random motion
$wifi(0) base-station [AddrParams addr2id [$AP node-addr]] ;#attach mn to basestation
$wifi(0) set X_ [expr 51.0]
$wifi(0) set Y_ 50.0
$wifi(0) set Z_ 0.0


# add link to backbone
$ns duplex-link $AP $GGSN 10MBit 15ms DropTail 1000

# add interfaces to MultiFaceNode
$ue(0) add-interface-node $wifi(0)
$ue(0) add-interface-node $umts(0)

#
#create traffic: TCP application between Google and Multi interface node
#
set udp(0) [new Agent/UDP]
$ue(0) attach-agent $udp(0) $umts(0)

set null(0) [new Agent/Null]
$ns attach-agent $Google $null(0)

$ue(0) connect-agent $udp(0) $null(0) $umts(0)

set cbr(0) [new Application/Traffic/CBR]
$cbr(0) attach-agent $udp(0)
$cbr(0) set type_ CBR
$cbr(0) set rate_ 0.1mb
$cbr(0) set random_ false

$ns at 0.05 "$cbr(0) start"

# do some kind of registration in UMTS
$ns node-config -llType UMTS/RLC/AM \
		-downlinkBW 384kbs \
		-uplinkBW 384kbs \
		-downlinkTTI 20ms \
		-uplinkTTI 20ms \
    -hs_downlinkTTI 2ms \
    -hs_downlinkBW 384kbs

# for the first HS-DSCH, we must create. If any other, then use attach-hsdsch
$ns create-hsdsch $umts(0) $udp(0)

# we must set the trace for the environment. If not, then bandwidth is reduced and
# packets are not sent the same way (it looks like they are queued, but TBC)
$BS(0) setErrorTrace 0 "idealtrace"
#$BS(0) setErrorTrace 1 "idealtrace"

# load the CQI (Channel Quality Indication)
$BS(0) loadSnrBlerMatrix "SNRBLERMatrix"

$ns at 3.0 "UmtsToWifi $ns $ue(0) $wifi(0) $udp(0) $null(0)"
$ns at 3 "$ns trace-annotate \"Redirecting traffic\""

$ns at 5 "finish"

puts " Simulation is running ... please wait ..."
$ns run
