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
MIH User subscribing for events 1f9 on Mac 0
	Subscription status: requested=1f9, result=1
	Link ID: linkType=19, macMobileTerminal=5, macPoA=-1
	Capabilities are: commands:f, events:1bf
MIH User subscribing for events 1f9 on Mac 5
	Subscription status: requested=1f9, result=1b9
At 0.100000 in 4.0.0 MIH Agent received LINK UP trigger.
At 0.100000 in 4.0.0 Interface Manager received MIH event
At 0.100000 in 4.0.0 Handover1 received link up 
	type 23, MacAddr=0, MacPoA=-1
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
At 25.869473 in 3.0.0 ND module send RA
At 25.879408 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> New neighbor
At 25.879408 in 4.0.0 Handover1 received new prefix 3.0.0
	old address: 3.0.1, prefix=3.0.0, new address will be 3.0.1
At 25.879408 in 4.0.0 MIH Agent sending capability discovery request
	The new up interface is better...checking for flows to redirect
Studying flow 0 using interface 0.0.2
	Must redirect flow from interface 0.0.2 to 3.0.1
	The new up interface is better...checking for flows to redirect
Studying flow 0 using interface 3.0.1
	Must redirect flow from interface 3.0.1 to 3.0.1
At 25.879408 MIPv6 Agent in 4.0.0 send redirect message using interface 3.0.1
At 25.974858 MIPv6 Agent in 4.0.0 received ack for redirect packet from 1.0.0
At 25.982159 in 3.0.0 MIH Agent received capability discovery request
At 25.982159 in 3.0.0 MIH Agent sending capability discovery response
At 25.983781 in 4.0.0 MIH Agent received capability discovery response
At 26.381103 in 3.0.0 MIH Agent received capability discovery request
At 26.381103 in 3.0.0 MIH Agent sending capability discovery response
At 26.383205 in 4.0.0 MIH Agent received capability discovery response
At 26.883645 in 3.0.0 MIH Agent received capability discovery request
At 26.883645 in 3.0.0 MIH Agent sending capability discovery response
At 26.885586 in 4.0.0 MIH Agent received capability discovery response
At 27.381708 in 3.0.0 MIH Agent received capability discovery request
At 27.381708 in 3.0.0 MIH Agent sending capability discovery response
At 27.383670 in 4.0.0 MIH Agent received capability discovery response
At 29.379495 in 3.0.0 ND module send RA
At 29.389981 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 32.583171 in 3.0.0 ND module send RA
At 32.584073 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 36.622414 in 3.0.0 ND module send RA
At 36.624408 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 41.244062 in 3.0.0 ND module send RA
At 41.249857 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 43.785638 in 3.0.0 ND module send RA
At 43.793207 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 49.049329 in 3.0.0 ND module send RA
At 49.055299 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 54.878347 in 3.0.0 ND module send RA
At 54.887732 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 58.110106 in 3.0.0 ND module send RA
At 58.116118 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 63.995768 in 3.0.0 ND module send RA
At 64.000743 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 69.090671 in 3.0.0 ND module send RA
At 69.095193 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 71.882187 in 3.0.0 ND module send RA
At 71.889716 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 75.471798 in 3.0.0 ND module send RA
At 75.478135 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 79.305838 in 3.0.0 ND module send RA
At 79.307226 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 81.474456 in 3.0.0 ND module send RA
At 81.478067 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 85.911714 in 3.0.0 ND module send RA
At 85.916465 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 90.985673 in 3.0.0 ND module send RA
At 90.992928 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 95.744203 in 3.0.0 ND module send RA
At 95.745381 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 99.370561 in 3.0.0 ND module send RA
At 99.378302 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 103.702476 in 3.0.0 ND module send RA
At 103.712519 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 109.209740 in 3.0.0 ND module send RA
At 109.213902 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 115.051353 in 3.0.0 ND module send RA
At 115.061144 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 118.708857 in 3.0.0 ND module send RA
At 118.713390 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	a++At 120 Mobile Node leaves wlan
Mobile Node stops moving
Simulation ends at 170
 Simulation ended.
dvertisement interval=6000 ms
	-> Update lifetime 
At 121.615968 in 3.0.0 ND module send RA
At 126.401961 in 3.0.0 ND module send RA
At 130.094233 in 3.0.0 ND module send RA
At 135.119320 in 3.0.0 ND module send RA
At 136.713390 in 3.0.1 ND module has prefix 3.0.0 expired 
At 136.713390 in 4.0.0 Handover1 received expired prefix 3.0.0
	We fake a link down
At 136.713390 in 4.0.0 Handover1 received link down 
	MacAddr=5
Studying flow 0 using interface 3.0.1
	Must redirect this flow to use interface 0.0.2
At 136.713390 MIPv6 Agent in 4.0.0 send redirect message using interface 0.0.2
There are 1 elements in the request
At 136.713390 in 4.0.0 MIH Agent sending link scan.
At 136.860065 MIPv6 Agent in 4.0.0 received ack for redirect packet from 1.0.0
At 136.933390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 139.933390 in 4.0.0 MIH Agent sending link scan.
At 140.153390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
At 140.161118 in 3.0.0 ND module send RA
There are 1 elements in the request
At 143.153390 in 4.0.0 MIH Agent sending link scan.
At 143.373390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
At 146.017929 in 3.0.0 ND module send RA
There are 1 elements in the request
At 146.373390 in 4.0.0 MIH Agent sending link scan.
At 146.593390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 149.593390 in 4.0.0 MIH Agent sending link scan.
At 149.813390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
At 151.973120 in 3.0.0 ND module send RA
There are 1 elements in the request
At 152.813390 in 4.0.0 MIH Agent sending link scan.
At 153.033390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 156.033390 in 4.0.0 MIH Agent sending link scan.
At 156.092947 in 3.0.0 ND module send RA
At 156.253390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 159.253390 in 4.0.0 MIH Agent sending link scan.
At 159.473390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
At 161.684491 in 3.0.0 ND module send RA
There are 1 elements in the request
At 162.473390 in 4.0.0 MIH Agent sending link scan.
At 162.693390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
At 164.817038 in 3.0.0 ND module send RA
There are 1 elements in the request
At 165.693390 in 4.0.0 MIH Agent sending link scan.
At 165.913390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 168.913390 in 4.0.0 MIH Agent sending link scan.
At 169.022249 in 3.0.0 ND module send RA
At 169.133390 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
Studying flow 0 using interface 0.0.2
