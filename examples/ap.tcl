# ======================================================================
# Define options
# ======================================================================

set opt(chan)       Channel/WirelessChannel         ;# channel type
set opt(prop)       Propagation/TwoRayGround        ;# radio-propagationmodel
set opt(netif)      Phy/WirelessPhy                 ;# network interface type
set opt(mac)        Mac/802_11                      ;# MAC type
set opt(ifq)        Queue/DropTail/PriQueue         ;# interface queue type
set opt(ll)         LL                              ;# link layer type
set opt(ant)        Antenna/OmniAntenna             ;# antenna model
set opt(ifqlen)         1000                        ;# max packet in ifq 
set opt(nn) 		4 								;# number of mobilenodes
set opt(adhocRouting)   DSDV                        ;# routing protocol
set opt(threshold)     1.41828e-9            		;# the distance of coverage 75m 
set opt(x)          100                             ;# x coordinate of topology
set opt(y)          100                             ;# y coordinate of topology
set opt(stop)       10                              ;# time to stop simulation
set num_wired_nodes     4
set num_bs_nodes        2                  			;# this is not really used here.
set size        500
# ======================================================================

set basic         1.0e6
set data        2.0e6

source ./function.tcl

# create simulator instance

set ns_   [new Simulator]

# set up for hierarchical routing
$ns_ node-config -addressType hierarchical

AddrParams set domain_num_ 3           ;# number of domains
lappend cluster_num 1 1 1             ;# number of clusters in each domain
AddrParams set cluster_num_ $cluster_num
lappend eilastlevel 7 3 3        ;# number of nodes in each cluster
AddrParams set nodes_num_ $eilastlevel ;# of each domain

set tracefd  [open out.tr w]
set namtrace [open out.nam w]
$ns_ trace-all $tracefd
$ns_ namtrace-all-wireless $namtrace $opt(x) $opt(y)

set f1 [open s1 a]
set f2 [open s2 a]
set f3 [open s3 a]
set f4 [open s4 a]


# Create topography object
set topo   [new Topography]

# define topology
$topo load_flatgrid $opt(x) $opt(y)

# create God
create-god $opt(nn)

#create wired nodes

set W1 [$ns_ node 0.0.0]
set W2 [$ns_ node 0.0.1]
set W3 [$ns_ node 0.0.2]
set W4 [$ns_ node 0.0.3]
set W5 [$ns_ node 0.0.4]
#set W6 [$ns_ node 0.0.5]
#set W7 [$ns_ node 0.0.6]
set W8 [$ns_ node 0.0.5]
set W9 [$ns_ node 0.0.6]

# Configure for Basestation Node
$ns_ node-config -adhocRouting $opt(adhocRouting) \
                 -llType $opt(ll) \
                 -macType $opt(mac) \
                 -ifqType $opt(ifq) \
                 -ifqLen $opt(ifqlen) \
                 -antType $opt(ant) \
                 -propType $opt(prop) \
                 -phyType $opt(netif) \
                 -channelType $opt(chan) \
         -topoInstance $topo \
                 -wiredRouting ON \
         -agentTrace ON \
                 -routerTrace ON \
                 -macTrace ON

Phy/WirelessPhy set RXThresh_ $opt(threshold)

# Position (fixed) for base-station nodes (HA & FA).

set BS1 [$ns_ node 1.0.0]
set BS2 [$ns_ node 2.0.0]



# create a mobilenode that would be moving between HA and FA.
# note address of MH indicates its in the same domain as HA.
$ns_ node-config -wiredRouting OFF

set R1 [$ns_ node 1.0.2]
set R2 [$ns_ node 1.0.3]
set R3 [$ns_ node 2.0.2]
set R4 [$ns_ node 2.0.3]


$R1 base-station [AddrParams addr2id [$BS1 node-addr]]
$R2 base-station [AddrParams addr2id [$BS1 node-addr]]
$R3 base-station [AddrParams addr2id [$BS2 node-addr]]
$R4 base-station [AddrParams addr2id [$BS2 node-addr]]

# position of the nodes
$R1 set X_ 120.000000000000
$R1 set Y_ 80.000000000000
$R1 set Z_ 0.000000000000

$R2 set X_ 160.000000000000
$R2 set Y_ 40.000000000000
$R2 set Z_ 0.000000000000

$R3 set X_ 160.000000000000
$R3 set Y_ 0.000000000000
$R3 set Z_ 0.000000000000

$R4 set X_ 160.000000000000
$R4 set Y_ -40.000000000000
$R4 set Z_ 0.000000000000

$ns_ at 2.0 "$R1 setdest 90.0 20.0 20.0"
$ns_ at 2.0 "$R3 setdest 90.0 82.0 20.0"

# create links between wired and BaseStation nodes
$ns_ duplex-link $W1 $W3 2Mb 20ms DropTail
$ns_ duplex-link $W2 $W4 2Mb 20ms DropTail
$ns_ duplex-link $W8 $W3 2Mb 20ms DropTail
$ns_ duplex-link $W9 $W4 2Mb 20ms DropTail

$ns_ duplex-link $W3 $W5 5Mb 20ms DropTail
$ns_ duplex-link $W4 $W5 5Mb 20ms DropTail
#$ns_ duplex-link $W5 $W6 10Mb 20ms DropTail
#$ns_ duplex-link $W5 $W7 10Mb 20ms DropTail
$ns_ duplex-link $W5 $BS1 5Mb 20ms DropTail
$ns_ duplex-link $W5 $BS2 5Mb 20ms DropTail

# set the layout of links in NAM
$ns_ duplex-link-op $W1 $W3 orient right
$ns_ duplex-link-op $W8 $W3 orient right-down

$ns_ duplex-link-op $W2 $W4 orient right-up
$ns_ duplex-link-op $W9 $W4 orient right

$ns_ duplex-link-op $W3 $W5 orient right-down
$ns_ duplex-link-op $W4 $W5 orient right-up

#$ns_ duplex-link-op $W5 $W6 orient right-up
#$ns_ duplex-link-op $W5 $W7 orient right-down
$ns_ duplex-link-op $W5 $BS1 orient right-up
$ns_ duplex-link-op $W5 $BS2 orient right-down



$ns_ at 0.0 "$W1 label W1"
$ns_ at 0.0 "$W2 label W2"
$ns_ at 0.0 "$W8 label W3"
$ns_ at 0.0 "$W9 label W4"
$ns_ at 0.0 "$W3 label R1"
$ns_ at 0.0 "$W4 label R2"
$ns_ at 0.0 "$W5 label R3"
#$ns_ at 0.0 "$W6 label R4"
#$ns_ at 0.0 "$W7 label R5"
$ns_ at 0.0 "$BS1 label BS1"
$ns_ at 0.0 "$BS2 label BS2"
$ns_ at 0.0 "$R1 label R1"
$ns_ at 0.0 "$R2 label R2"
$ns_ at 0.0 "$R3 label R3"
$ns_ at 0.0 "$R4 label R4"
$ns_ at 0.0 "$R1 add-mark m1 green circle"
$ns_ at 0.0 "$R2 add-mark m1 red circle"
$ns_ at 0.0 "$R3 add-mark m1 blue circle"
$ns_ at 0.0 "$R4 add-mark m1 purple circle"
# setup TCP connections

  set udp(0) [new Agent/UDP]
  $ns_ attach-agent $W1  $udp(0)
  set udp(1) [new Agent/Null]
  $ns_ attach-agent $R1  $udp(1)
  puts [getNodeIpAddress $R1]
  $ns_ connect $udp(0) $udp(1)
  set cbr(0) [new Application/Traffic/CBR]
  $cbr(0) set packet_size_ 333
  $cbr(0) attach-agent $udp(0)
  $ns_ at 1.0 "$cbr(0) start"
  $ns_ at 1.0 "$ns_ trace-annotate \"W1 Sends packets to R1 via Home Agent(BS1). \""

  set udp(2) [new Agent/UDP]
  $ns_ attach-agent $W2  $udp(2)
  set udp(3) [new Agent/Null]
  $ns_ attach-agent $R2  $udp(3)
  puts [getNodeIpAddress $R2]
  $ns_ connect $udp(2) $udp(3)
  set cbr(1) [new Application/Traffic/CBR]
  $cbr(1) attach-agent $udp(2)
  $cbr(1) set packet_size_ 444
  $ns_ at 2.0 "$cbr(1) start"
  $ns_ at 2.0 "$ns_ trace-annotate \"W3 Sends packets to R2 via Home Agent(BS1). \""

  set udp(4) [new Agent/UDP]
  $ns_ attach-agent $W2  $udp(4)
  set udp(5) [new Agent/Null]
  $ns_ attach-agent $R3  $udp(5)
  puts [getNodeIpAddress $R3]
  $ns_ connect $udp(4) $udp(5)
  set cbr(2) [new Application/Traffic/CBR]
  $cbr(2) attach-agent $udp(4)
  $cbr(2) set packet_size_ 555
  $ns_ at 2.0 "$cbr(2) start"
  $ns_ at 3.0 "$ns_ trace-annotate \"W2 Sends packets to R3 via Home Agent(BS2). \""

  set udp(6) [new Agent/UDP]
  $ns_ attach-agent $W9  $udp(6)
  set udp(7) [new Agent/Null]
  $ns_ attach-agent $R4  $udp(7)
  puts [getNodeIpAddress $R4]
  $ns_ connect $udp(6) $udp(7)
  set cbr(3) [new Application/Traffic/CBR]
  $cbr(3) attach-agent $udp(6)
  $cbr(3) set packet_size_ 660
  $ns_ at 2.0 "$cbr(3) start"
  $ns_ at 4.0 "$ns_ trace-annotate \"W4 Sends packets to R4 via Home Agent(BS2). \""

# Define initial node position in nam

$ns_ initial_node_pos $R1 10
$ns_ initial_node_pos $R2 10
$ns_ initial_node_pos $R3 10
$ns_ initial_node_pos $R4 10


# Tell all nodes when the siulation ends
$ns_ at $opt(stop).0 "$R1 reset";
$ns_ at $opt(stop).0 "$R2 reset";
$ns_ at $opt(stop).0 "$R3 reset";
$ns_ at $opt(stop).0 "$R4 reset";

$ns_ at $opt(stop).0002 "puts \"NS EXITING...\" ; $ns_ halt"
#$ns_ at $opt(stop).0001 "stop"

proc stop {} {
    global ns_ tracefd namtrace opt

global ns_  f1 f2 f3 f4 cbr mbw1 mbw2 mbw3 mbw4 rate size
    #received bytes
    set bw1  [$cbr(0) set packet_size_]
    set bw2  [$cbr(1) set packet_size_]
    set bw3  [$cbr(2) set packet_size_]
    set bw4  [$cbr(3) set packet_size_]

    #set current time
    set now [$ns_ now]
    set time $now

    # convert bytes into Mb/s
    set mbw1 [expr $bw1/$time*8/1000000]
    set mbw2 [expr $bw2/$time*8/1000000]
    set mbw3 [expr $bw3/$time*8/1000000]
    set mbw4 [expr $bw4/$time*8/1000000]

    set tot [expr $mbw1 + $mbw2 + $mbw3 + $mbw4 ]
    puts $tot
    puts "NS Exiting ..."
    puts $f1 "$mbw1"
    puts $f2 "$mbw2"
    puts $f3 "$mbw3"
    puts $f4 "$mbw4"


    close $tracefd
    close $namtrace
    exec  nam out.nam &
    exit 0
}

puts "Starting Simulation..."
$ns_ run
