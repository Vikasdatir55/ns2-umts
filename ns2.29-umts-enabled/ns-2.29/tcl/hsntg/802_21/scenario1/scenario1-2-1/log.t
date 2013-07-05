rnc: tcl=_o16; id=0; addr=0.0.0
bsUMTS: tcl=_o30; id=1; addr=0.0.1
router0: tcl=_o96; id=3; addr=1.0.0
router1: tcl=_o104; id=4; addr=2.0.0
multiFaceNode(s) has/have been created
INITIALIZE THE LIST xListHead
bstation802: tcl=_o173; id=6; addr=3.0.0
bss_id for bstation 1=4
Iface 1 = _o201
udp on node : _o268
num_nodes is set 11
At 0.000000 in 0.0.0 ND module added RA target 0.0.2
At 0.000000 in 3.0.0 MIH is adding mac 4
At 0.000000 in 4.0.0 Interface Manager : Flow added
 Simulation is running ... please wait ...
SORTING LISTS ...DONE!
At 10 Mobile Node starts moving
++At 20 Mobile Node enters wlan
At 0.000000 in 4.0.0 MIH is adding mac 0
At 0.000000 in 4.0.0 MIH is adding mac 5
Calling MIH_Get_Status
At 0.001000 in 4.0.0, MIH receives get_status for local MIH
MIH_Get_Status results for 2 interface(s):
	Link ID: linkType=23, macMobileTerminal=0, macPoA=-1
	Capabilities are: commands:3, events:3
MIH User subscribing for events 1fb on Mac 0
	Subscription status: requested=1fb, result=3
	Link ID: linkType=19, macMobileTerminal=5, macPoA=-1
	Capabilities are: commands:f, events:1bf
MIH User subscribing for events 1fb on Mac 5
	Subscription status: requested=1fb, result=1bb
At 0.100000 in 4.0.0 MIH Agent received LINK UP trigger.
At 0.100000 in 4.0.0 Interface Manager received MIH event
At 0.100000 in 4.0.0 Handover1 received link up 
	type 23, MacAddr=0, MacPoA=-1
	Case2: sending RS
WARNING: At 0.100000 MIPv6 Agent in 4.0.0 does not have ND to send RS
channel.cc:sendUp - Calc highestAntennaZ_ and distCST_
highestAntennaZ_ = 1.5,  distCST_ = 256.8
At 4.764694 in 3.0.0 ND module send RA
At 8.016541 in 3.0.0 ND module send RA
At 13.361835 in 3.0.0 ND module send RA
At 15.728516 in 3.0.0 ND module send RA
At 18.744008 in 3.0.0 ND module send RA
At 20.960821 in 3.0.0 ND module send RA
At 24.400305 in 4.0.0 MIH Agent received LINK DETECTED trigger.
At 24.400305 in 4.0.0 Interface Manager received MIH event
At 24.400305 in 4.0.0 Handover1 link detected 
	type 19, MacAddr=5, PoA=4
	The new interface is better...connect
	I launch the connection on the link
Link Connect to AP 4 on Channel 1
At 24.401691 in 4.0.0 MIH Agent received LINK UP trigger.
At 24.401691 in 4.0.0 Interface Manager received MIH event
At 24.401691 in 4.0.0 Handover1 received link up 
	type 19, MacAddr=5, MacPoA=4
	Case2: sending RS
At 24.401691 MIPv6 Agent in 4.0.0 requests ND to send RS
At 24.401691 in 3.0.1 ND module send RS
At 24.407845 in 3.0.0 ND module received RS from node 3.0.1
At 24.487242 in 3.0.0 ND module processes RS reply.
At 24.487242 in 3.0.0 ND module send RA
At 24.492705 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> New neighbor
At 24.492705 in 4.0.0 Handover1 received new prefix 3.0.0
	old address: 3.0.1, prefix=3.0.0, new address will be 3.0.1
At 24.492705 in 4.0.0 MIH Agent sending capability discovery request
	The new up interface is better...checking for flows to redirect
Studying flow 0 using interface 0.0.2
	Must redirect flow from interface 0.0.2 to 3.0.1
	The new up interface is better...checking for flows to redirect
Studying flow 0 using interface 3.0.1
	Must redirect flow from interface 3.0.1 to 3.0.1
At 24.492705 MIPv6 Agent in 4.0.0 send redirect message using interface 3.0.1
At 24.587075 MIPv6 Agent in 4.0.0 received ack for redirect packet from 1.0.0
At 24.594810 in 3.0.0 MIH Agent received capability discovery request
At 24.594810 in 3.0.0 MIH Agent sending capability discovery response
At 24.596372 in 4.0.0 MIH Agent received capability discovery response
At 24.999435 in 3.0.0 MIH Agent received capability discovery request
At 24.999435 in 3.0.0 MIH Agent sending capability discovery response
At 25.001307 in 4.0.0 MIH Agent received capability discovery response
At 25.502321 in 3.0.0 MIH Agent received capability discovery request
At 25.502321 in 3.0.0 MIH Agent sending capability discovery response
At 25.503823 in 4.0.0 MIH Agent received capability discovery response
At 25.869473 in 3.0.0 ND module send RA
At 25.877305 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 25.994465 in 3.0.0 MIH Agent received capability discovery request
At 25.994465 in 3.0.0 MIH Agent sending capability discovery response
At 25.996786 in 4.0.0 MIH Agent received capability discovery response
At 30.605863 in 3.0.0 ND module send RA
At 30.610591 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 34.644848 in 3.0.0 ND module send RA
At 34.649335 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 37.482807 in 3.0.0 ND module send RA
At 37.487626 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 40.670952 in 3.0.0 ND module send RA
At 40.681120 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 46.517547 in 3.0.0 ND module send RA
At 46.519093 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 52.054297 in 3.0.0 ND module send RA
At 52.059596 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 55.212460 in 3.0.0 ND module send RA
At 55.222886 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 61.146309 in 3.0.0 ND module send RA
At 61.149266 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 64.905380 in 3.0.0 ND module send RA
At 64.913256 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 69.405285 in 3.0.0 ND module send RA
At 69.415459 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 72.291501 in 3.0.0 ND module send RA
At 72.295517 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 77.205523 in 3.0.0 ND module send RA
At 77.207783 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 80.740362 in 3.0.0 ND module send RA
At 80.750822 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 84.975948 in 3.0.0 ND module send RA
At 84.985654 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 89.237799 in 3.0.0 ND module send RA
At 89.248464 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 93.501586 in 3.0.0 ND module send RA
At 93.506963 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 98.965945 in 3.0.0 ND module send RA
At 98.974592 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 104.884206 in 3.0.0 ND module send RA
At 104.885887 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 110.244608 in 3.0.0 ND module send RA
At 110.254269 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 114.494814 in 3.0.0 ND module send RA
At 114.503673 in 3.0.1 ND module received++At 120 Mobile Node leaves wlan
Mobile Node stops moving
 RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 119.574281 in 3.0.0 ND module send RA
At 119.577932 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 120.200305 in 4.0.0 MIH Agent received LINK DOWN trigger.
At 120.200305 in 4.0.0 Interface Manager received MIH event
At 120.200305 in 4.0.0 Handover1 received link down 
	MacAddr=5
Studying flow 0 using interface 3.0.1
	Must redirect this flow to use interface 0.0.2
At 120.200305 MIPv6 Agent in 4.0.0 send redirect message using interface 0.0.2
There are 1 elements in the request
At 120.200305 in 4.0.0 MIH Agent sending link scan.
At 120.360065 MIPv6 Agent in 4.0.0 received ack for redirect packet from 1.0.0
At 120.420305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 121.839330 in 3.0.0 ND module send RA
There are 1 elements in the request
At 123.420305 in 4.0.0 MIH Agent sending link scan.
At 123.640305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 124.558719 in 3.0.0 ND module send RA
There are 1 elements in the request
At 126.640305 in 4.0.0 MIH Agent sending link scan.
At 126.860305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 129.860305 in 4.0.0 MIH Agent sending link scan.
At 130.080305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 130.368082 in 3.0.0 ND module send RA
There are 1 elements in the request
At 133.080305 in 4.0.0 MIH Agent sending link scan.
At 133.300305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 135.397441 in 3.0.0 ND module send RA
There are 1 elements in the request
At 136.300305 in 4.0.0 MIH Agent sending link scan.
At 136.520305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 137.577932 in 3.0.1 ND module has prefix 3.0.0 expired 
At 137.577932 in 4.0.0 Handover1 received expired prefix 3.0.0
	We fake a link down
At 137.577932 in 4.0.0 Handover1 received link down 
	MacAddr=5
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 137.577932 in 4.0.0 MIH Agent sending link scan.
At 137.797932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 138.546100 in 3.0.0 ND module send RA
There are 1 elements in the request
At 140.797932 in 4.0.0 MIH Agent sending link scan.
At 141.017932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 141.687691 in 3.0.0 ND module send RA
There are 1 elements in the request
At 144.017932 in 4.0.0 MIH Agent sending link scan.
At 144.237932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 146.584374 in 3.0.0 ND module send RA
There are 1 elements in the request
At 147.237932 in 4.0.0 MIH Agent sending link scan.
At 147.457932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 150.457932 in 4.0.0 MIH Agent sending link scan.
At 150.677932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 152.561270 in 3.0.0 ND module send RA
There are 1 elements in the request
At 153.677932 in 4.0.0 MIH Agent sending link scan.
At 153.897932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 155.549397 in 3.0.0 ND module send RA
There are 1 elements in the request
At 156.897932 in 4.0.0 MIH Agent sending link scan.
At 157.117932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 160.117Simulation ends at 170
 Simulation ended.
932 in 4.0.0 MIH Agent sending link scan.
At 160.337932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 160.738092 in 3.0.0 ND module send RA
There are 1 elements in the request
At 163.337932 in 4.0.0 MIH Agent sending link scan.
At 163.557932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 164.266472 in 3.0.0 ND module send RA
At 166.392415 in 3.0.0 ND module send RA
There are 1 elements in the request
At 166.557932 in 4.0.0 MIH Agent sending link scan.
At 166.777932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 169.777932 in 4.0.0 MIH Agent sending link scan.
At 169.997932 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
