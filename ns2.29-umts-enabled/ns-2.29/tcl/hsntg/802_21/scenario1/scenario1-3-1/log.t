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
MIH User subscribing for events 1ff on Mac 0
	Subscription status: requested=1ff, result=3
	Link ID: linkType=19, macMobileTerminal=5, macPoA=-1
	Capabilities are: commands:f, events:1bf
MIH User subscribing for events 1ff on Mac 5
	Subscription status: requested=1ff, result=1bf
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
At 114.503673 in 3.0.1 ND module received RA from node 3.0.0
	router-lifetime=18.000000 s
	prefix valid_lifetime=5 s
	prefix=3.0.0
	advertisement interval=6000 ms
	-> Update lifetime 
At 115.645412 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 115.645412 in 4.0.0 Interface Manager received MIH event
At 115.645412 in 4.0.0 Handover1 received Link going down 
	 probability = 0%
	Do nothing
At 115.646216 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 115.646216 in 4.0.0 Interface Manager received MIH event
At 115.646216 in 4.0.0 Handover1 received Link going down 
	 probability = 0%
	Do nothing
At 115.700305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 115.700305 in 4.0.0 Interface Manager received MIH event
At 115.700305 in 4.0.0 Handover1 received Link going down 
	 probability = 1%
	Do nothing
At 115.800305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 115.800305 in 4.0.0 Interface Manager received MIH event
At 115.800305 in 4.0.0 Handover1 received Link going down 
	 probability = 4%
	Do nothing
At 115.845532 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 115.845532 in 4.0.0 Interface Manager received MIH event
At 115.845532 in 4.0.0 Handover1 received Link going down 
	 probability = 5%
	Do nothing
At 115.846336 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 115.846336 in 4.0.0 Interface Manager received MIH event
At 115.846336 in 4.0.0 Handover1 received Link going down 
	 probability = 5%
	Do nothing
At 115.900305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 115.900305 in 4.0.0 Interface Manager received MIH event
At 115.900305 in 4.0.0 Handover1 received Link going down 
	 probability = 6%
	Do nothing
At 116.000305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.000305 in 4.0.0 Interface Manager received MIH event
At 116.000305 in 4.0.0 Handover1 received Link going down 
	 probability = 9%
	Do nothing
At 116.045392 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.045392 in 4.0.0 Interface Manager received MIH event
At 116.045392 in 4.0.0 Handover1 received Link going down 
	 probability = 10%
	Do nothing
At 116.046196 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.046196 in 4.0.0 Interface Manager received MIH event
At 116.046196 in 4.0.0 Handover1 received Link going down 
	 probability = 10%
	Do nothing
At 116.100305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.100305 in 4.0.0 Interface Manager received MIH event
At 116.100305 in 4.0.0 Handover1 received Link going down 
	 probability = 11%
	Do nothing
At 116.200305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.200305 in 4.0.0 Interface Manager received MIH event
At 116.200305 in 4.0.0 Handover1 received Link going down 
	 probability = 14%
	Do nothing
At 116.245412 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.245412 in 4.0.0 Interface Manager received MIH event
At 116.245412 in 4.0.0 Handover1 received Link going down 
	 probability = 15%
	Do nothing
At 116.246216 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.246216 in 4.0.0 Interface Manager received MIH event
At 116.246216 in 4.0.0 Handover1 received Link going down 
	 probability = 15%
	Do nothing
At 116.300305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.300305 in 4.0.0 Interface Manager received MIH event
At 116.300305 in 4.0.0 Handover1 received Link going down 
	 probability = 16%
	Do nothing
At 116.400305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.400305 in 4.0.0 Interface Manager received MIH event
At 116.400305 in 4.0.0 Handover1 received Link going down 
	 probability = 19%
	Do nothing
At 116.445592 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.445592 in 4.0.0 Interface Manager received MIH event
At 116.445592 in 4.0.0 Handover1 received Link going down 
	 probability = 20%
	Do nothing
At 116.446396 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.446396 in 4.0.0 Interface Manager received MIH event
At 116.446396 in 4.0.0 Handover1 received Link going down 
	 probability = 20%
	Do nothing
At 116.500305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.500305 in 4.0.0 Interface Manager received MIH event
At 116.500305 in 4.0.0 Handover1 received Link going down 
	 probability = 21%
	Do nothing
At 116.600305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.600305 in 4.0.0 Interface Manager received MIH event
At 116.600305 in 4.0.0 Handover1 received Link going down 
	 probability = 24%
	Do nothing
At 116.645632 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.645632 in 4.0.0 Interface Manager received MIH event
At 116.645632 in 4.0.0 Handover1 received Link going down 
	 probability = 25%
	Do nothing
At 116.646436 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.646436 in 4.0.0 Interface Manager received MIH event
At 116.646436 in 4.0.0 Handover1 received Link going down 
	 probability = 25%
	Do nothing
At 116.700305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.700305 in 4.0.0 Interface Manager received MIH event
At 116.700305 in 4.0.0 Handover1 received Link going down 
	 probability = 26%
	Do nothing
At 116.800305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.800305 in 4.0.0 Interface Manager received MIH event
At 116.800305 in 4.0.0 Handover1 received Link going down 
	 probability = 29%
	Do nothing
At 116.845332 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.845332 in 4.0.0 Interface Manager received MIH event
At 116.845332 in 4.0.0 Handover1 received Link going down 
	 probability = 30%
	Do nothing
At 116.846136 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.846136 in 4.0.0 Interface Manager received MIH event
At 116.846136 in 4.0.0 Handover1 received Link going down 
	 probability = 30%
	Do nothing
At 116.900305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 116.900305 in 4.0.0 Interface Manager received MIH event
At 116.900305 in 4.0.0 Handover1 received Link going down 
	 probability = 31%
	Do nothing
At 117.000305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.000305 in 4.0.0 Interface Manager received MIH event
At 117.000305 in 4.0.0 Handover1 received Link going down 
	 probability = 34%
	Do nothing
At 117.045592 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.045592 in 4.0.0 Interface Manager received MIH event
At 117.045592 in 4.0.0 Handover1 received Link going down 
	 probability = 35%
	Do nothing
At 117.046396 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.046396 in 4.0.0 Interface Manager received MIH event
At 117.046396 in 4.0.0 Handover1 received Link going down 
	 probability = 35%
	Do nothing
At 117.100305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.100305 in 4.0.0 Interface Manager received MIH event
At 117.100305 in 4.0.0 Handover1 received Link going down 
	 probability = 36%
	Do nothing
At 117.200305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.200305 in 4.0.0 Interface Manager received MIH event
At 117.200305 in 4.0.0 Handover1 received Link going down 
	 probability = 38%
	Do nothing
At 117.245912 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.245912 in 4.0.0 Interface Manager received MIH event
At 117.245912 in 4.0.0 Handover1 received Link going down 
	 probability = 40%
	Do nothing
At 117.246716 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.246716 in 4.0.0 Interface Manager received MIH event
At 117.246716 in 4.0.0 Handover1 received Link going down 
	 probability = 40%
	Do nothing
At 117.300305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.300305 in 4.0.0 Interface Manager received MIH event
At 117.300305 in 4.0.0 Handover1 received Link going down 
	 probability = 41%
	Do nothing
At 117.400305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.400305 in 4.0.0 Interface Manager received MIH event
At 117.400305 in 4.0.0 Handover1 received Link going down 
	 probability = 43%
	Do nothing
At 117.445792 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.445792 in 4.0.0 Interface Manager received MIH event
At 117.445792 in 4.0.0 Handover1 received Link going down 
	 probability = 44%
	Do nothing
At 117.446596 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.446596 in 4.0.0 Interface Manager received MIH event
At 117.446596 in 4.0.0 Handover1 received Link going down 
	 probability = 44%
	Do nothing
At 117.500305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.500305 in 4.0.0 Interface Manager received MIH event
At 117.500305 in 4.0.0 Handover1 received Link going down 
	 probability = 45%
	Do nothing
At 117.600305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.600305 in 4.0.0 Interface Manager received MIH event
At 117.600305 in 4.0.0 Handover1 received Link going down 
	 probability = 48%
	Do nothing
At 117.645572 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.645572 in 4.0.0 Interface Manager received MIH event
At 117.645572 in 4.0.0 Handover1 received Link going down 
	 probability = 49%
	Do nothing
At 117.646376 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.646376 in 4.0.0 Interface Manager received MIH event
At 117.646376 in 4.0.0 Handover1 received Link going down 
	 probability = 49%
	Do nothing
At 117.700305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.700305 in 4.0.0 Interface Manager received MIH event
At 117.700305 in 4.0.0 Handover1 received Link going down 
	 probability = 50%
	Do nothing
At 117.800305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.800305 in 4.0.0 Interface Manager received MIH event
At 117.800305 in 4.0.0 Handover1 received Link going down 
	 probability = 52%
	Do nothing
At 117.845552 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.845552 in 4.0.0 Interface Manager received MIH event
At 117.845552 in 4.0.0 Handover1 received Link going down 
	 probability = 53%
	Do nothing
At 117.846356 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.846356 in 4.0.0 Interface Manager received MIH event
At 117.846356 in 4.0.0 Handover1 received Link going down 
	 probability = 53%
	Do nothing
At 117.900305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 117.900305 in 4.0.0 Interface Manager received MIH event
At 117.900305 in 4.0.0 Handover1 received Link going down 
	 probability = 55%
	Do nothing
At 118.000305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.000305 in 4.0.0 Interface Manager received MIH event
At 118.000305 in 4.0.0 Handover1 received Link going down 
	 probability = 57%
	Do nothing
At 118.045692 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.045692 in 4.0.0 Interface Manager received MIH event
At 118.045692 in 4.0.0 Handover1 received Link going down 
	 probability = 58%
	Do nothing
At 118.046496 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.046496 in 4.0.0 Interface Manager received MIH event
At 118.046496 in 4.0.0 Handover1 received Link going down 
	 probability = 58%
	Do nothing
At 118.100305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.100305 in 4.0.0 Interface Manager received MIH event
At 118.100305 in 4.0.0 Handover1 received Link going down 
	 probability = 59%
	Do nothing
At 118.200305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.200305 in 4.0.0 Interface Manager received MIH event
At 118.200305 in 4.0.0 Handover1 received Link going down 
	 probability = 61%
	Do nothing
At 118.245672 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.245672 in 4.0.0 Interface Manager received MIH event
At 118.245672 in 4.0.0 Handover1 received Link going down 
	 probability = 62%
	Do nothing
At 118.246476 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.246476 in 4.0.0 Interface Manager received MIH event
At 118.246476 in 4.0.0 Handover1 received Link going down 
	 probability = 62%
	Do nothing
At 118.300305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.300305 in 4.0.0 Interface Manager received MIH event
At 118.300305 in 4.0.0 Handover1 received Link going down 
	 probability = 64%
	Do nothing
At 118.400305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.400305 in 4.0.0 Interface Manager received MIH event
At 118.400305 in 4.0.0 Handover1 received Link going down 
	 probability = 66%
	Do nothing
At 118.445552 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.445552 in 4.0.0 Interface Manager received MIH event
At 118.445552 in 4.0.0 Handover1 received Link going down 
	 probability = 67%
	Do nothing
At 118.446356 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.446356 in 4.0.0 Interface Manager received MIH event
At 118.446356 in 4.0.0 Handover1 received Link going down 
	 probability = 67%
	Do nothing
At 118.500305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.500305 in 4.0.0 Interface Manager received MIH event
At 118.500305 in 4.0.0 Handover1 received Link going down 
	 probability = 68%
	Do nothing
At 118.600305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.600305 in 4.0.0 Interface Manager received MIH event
At 118.600305 in 4.0.0 Handover1 received Link going down 
	 probability = 70%
	Do nothing
At 118.645612 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.645612 in 4.0.0 Interface Manager received MIH event
At 118.645612 in 4.0.0 Handover1 received Link going down 
	 probability = 71%
	Do nothing
At 118.646416 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.646416 in 4.0.0 Interface Manager received MIH event
At 118.646416 in 4.0.0 Handover1 received Link going down 
	 probability = 71%
	Do nothing
At 118.700305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.700305 in 4.0.0 Interface Manager received MIH event
At 118.700305 in 4.0.0 Handover1 received Link going down 
	 probability = 72%
	Do nothing
At 118.800305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.800305 in 4.0.0 Interface Manager received MIH event
At 118.800305 in 4.0.0 Handover1 received Link going down 
	 probability = 75%
	Do nothing
At 118.845312 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.845312 in 4.0.0 Interface Manager received MIH event
At 118.845312 in 4.0.0 Handover1 received Link going down 
	 probability = 76%
	Do nothing
At 118.846116 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.846116 in 4.0.0 Interface Manager received MIH event
At 118.846116 in 4.0.0 Handover1 received Link going down 
	 probability = 76%
	Do nothing
At 118.900305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 118.900305 in 4.0.0 Interface Manager received MIH event
At 118.900305 in 4.0.0 Handover1 received Link going down 
	 probability = 77%
	Do nothing
At 119.000305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 119.000305 in 4.0.0 Interface Manager received MIH event
At 119.000305 in 4.0.0 Handover1 received Link going down 
	 probability = 79%
	Do nothing
At 119.045852 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 119.045852 in 4.0.0 Interface Manager received MIH event
At 119.045852 in 4.0.0 Handover1 received Link going down 
	 probability = 80%
	Do nothing
At 119.046656 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 119.046656 in 4.0.0 Interface Manager received MIH event
At 119.046656 in 4.0.0 Handover1 received Link going down 
	 probability = 80%
	Do nothing
At 119.100305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 119.100305 in 4.0.0 Interface Manager received MIH event
At 119.100305 in 4.0.0 Handover1 received Link going down 
	 probability = 81%
	We fake a link down
At 119.100305 in 4.0.0 Handover1 received link down 
	MacAddr=5
Studying flow 0 using interface 3.0.1
	Must redirect this flow to use interface 0.0.2
At 119.100305 MIPv6 Agent in 4.0.0 send redirect message using interface 0.0.2
There are 1 elements in the request
At 119.100305 in 4.0.0 MIH Agent sending link scan.
At 119.260065 MIPv6 Agent in 4.0.0 received ack for redirect packet from 1.0.0
At 119.360305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
	 Scan AP 4 on channel 1
Studying flow 0 using interface 0.0.2
At 119.400305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 119.400305 in 4.0.0 Interface Manager received MIH event
At 119.400305 in 4.0.0 Handover1 received Link going down 
	 probability = 87%
	We fake a link down++At 120 Mobile Node leaves wlan
Mobile Node stops moving

At 119.400305 in 4.0.0 Handover1 received link down 
	MacAddr=5
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 119.400305 in 4.0.0 MIH Agent sending link scan.
At 119.574281 in 3.0.0 ND module send RA
At 119.660305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
	 Scan AP 4 on channel 1
Studying flow 0 using interface 0.0.2
At 119.700305 in 4.0.0 MIH Agent received LINK GOING DOWN trigger.
At 119.700305 in 4.0.0 Interface Manager received MIH event
At 119.700305 in 4.0.0 Handover1 received Link going down 
	 probability = 93%
	We fake a link down
At 119.700305 in 4.0.0 Handover1 received link down 
	MacAddr=5
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 119.700305 in 4.0.0 MIH Agent sending link scan.
At 119.960305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
	 Scan AP 4 on channel 1
Studying flow 0 using interface 0.0.2
At 120.260305 in 4.0.0 MIH Agent received LINK DOWN trigger.
At 120.260305 in 4.0.0 Interface Manager received MIH event
At 120.260305 in 4.0.0 Handover1 received link down 
	MacAddr=5
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 120.260305 in 4.0.0 MIH Agent sending link scan.
At 120.480305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 123.480305 in 4.0.0 MIH Agent sending link scan.
At 123.700305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 124.417063 in 3.0.0 ND module send RA
There are 1 elements in the request
At 126.700305 in 4.0.0 MIH Agent sending link scan.
At 126.920305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 129.582818 in 3.0.0 ND module send RA
There are 1 elements in the request
At 129.920305 in 4.0.0 MIH Agent sending link scan.
At 130.140305 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 132.503673 in 3.0.1 ND module has prefix 3.0.0 expired 
At 132.503673 in 4.0.0 Handover1 received expired prefix 3.0.0
	We fake a link down
At 132.503673 in 4.0.0 Handover1 received link down 
	MacAddr=5
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 132.503673 in 4.0.0 MIH Agent sending link scan.
At 132.723673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 134.296483 in 3.0.0 ND module send RA
There are 1 elements in the request
At 135.723673 in 4.0.0 MIH Agent sending link scan.
At 135.943673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 138.341776 in 3.0.0 ND module send RA
There are 1 elements in the request
At 138.943673 in 4.0.0 MIH Agent sending link scan.
At 139.163673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 142.163673 in 4.0.0 MIH Agent sending link scan.
At 142.383673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 143.100478 in 3.0.0 ND module send RA
There are 1 elements in the request
At 145.383673 in 4.0.0 MIH Agent sending link scan.
At 145.603673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 147.179409 in 3.0.0 ND module send RA
There are 1 elements in the request
At 148.603673 in 4.0.0 MIH Agent sending link scan.
At 148.823673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 151.823673 in 4.0.0 MIH Agent sending link scan.
At 152.030588 in 3.0.0 ND module send RA
At 152.043673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 155.043673 in 4.0.0 MIH Agent sending link scan.
At 155.263673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow Simulation ends at 170
 Simulation ended.
0 using interface 0.0.2
At 157.877876 in 3.0.0 ND module send RA
There are 1 elements in the request
At 158.263673 in 4.0.0 MIH Agent sending link scan.
At 158.483673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 160.845225 in 3.0.0 ND module send RA
There are 1 elements in the request
At 161.483673 in 4.0.0 MIH Agent sending link scan.
At 161.703673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
There are 1 elements in the request
At 164.703673 in 4.0.0 MIH Agent sending link scan.
At 164.923673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
At 165.731786 in 3.0.0 ND module send RA
There are 1 elements in the request
At 167.923673 in 4.0.0 MIH Agent sending link scan.
At 168.143673 in 4.0.0 MIH Agent received scan response.(pending requests=1)
Studying flow 0 using interface 0.0.2
