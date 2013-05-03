

set server_yahoo [new Agent/Null]
$ns attach-agent $Yahoo $server_yahoo
 	
set server_youtube [new Agent/Null]
$ns attach-agent $Youtube $server_youtube

set server_facebook [new Agent/Null]
$ns attach-agent $Facebook $server_facebook

set server_google [new Agent/Null]
$ns attach-agent $Google $server_google

set server_qq [new Agent/Null]
$ns attach-agent $QQ $server_qq

set server_jingfm [new Agent/Null]
$ns attach-agent $JingFm $server_jingfm

set server_steam [new Agent/Null]
$ns attach-agent $Steam $server_steam

for {set i 0} {$i < 20} {incr i 1} {
	if {$in_service_network($i) == $WIFI_IN_SERVICE} {
		$ue($i) attach-agent $udp($i) $wifi_interface($i)
		if {$app_type_list($i) == $APP_VOIP} {
			$ue($i) connect-agent $udp($i) $server_google $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_NEWS} {
			$ue($i) connect-agent $udp($i) $server_yahoo $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_VIDEO} {
			$ue($i) connect-agent $udp($i) $server_youtube $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_SNS} {
			$ue($i) connect-agent $udp($i) $server_facebook $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_CHAT} {
			$ue($i) connect-agent $udp($i) $server_qq $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_MUSIC} {
			$ue($i) connect-agent $udp($i) $server_jingfm $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_ONLINE_GAME} {
			$ue($i) connect-agent $udp($i) $server_steam $wifi_interface($i)
		}
 	}
	if {$in_service_network($i) == $UMTS_IN_SERVICE} {
		$ue($i) attach-agent $udp($i) $td_scdma_interface($i)
		if {$app_type_list($i) == $APP_VOIP} {
			$ue($i) connect-agent $udp($i) $server_google $td_scdma_interface($i) 
		}
		if {$app_type_list($i) == $APP_NEWS} {
			$ue($i) connect-agent $udp($i) $server_yahoo $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_VIDEO} {
			$ue($i) connect-agent $udp($i) $server_youtube $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_SNS} {
			$ue($i) connect-agent $udp($i) $server_facebook $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_CHAT} {
			$ue($i) connect-agent $udp($i) $server_qq $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_MUSIC} {
			$ue($i) connect-agent $udp($i) $server_jingfm $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_ONLINE_GAME} {
			$ue($i) connect-agent $udp($i) $server_steam $td_scdma_interface($i)
		}
 	}
	$app($i) attach-agent $udp($i)
	$app($i) set packet_size_ [expr 666+$i]
	$app($i) set type_ CBR
	$ns at [expr 0.1+$i/5] "$app($i) start"
}



for {set i 0} {$i < 20} {incr i 1} {
	if {$in_service_network($i) == $WIFI_IN_SERVICE} {
		$ue($i) attach-agent $udp($i) $wifi_interface($i)
		if {$app_type_list($i) == $APP_VOIP} {
			$ue($i) connect-agent $udp($i) $server_google($i) $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_NEWS} {
			$ue($i) connect-agent $udp($i) $server_yahoo($i) $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_VIDEO} {
			$ue($i) connect-agent $udp($i) $server_youtube($i) $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_SNS} {
			$ue($i) connect-agent $udp($i) $server_facebook($i) $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_CHAT} {
			$ue($i) connect-agent $udp($i) $server_qq($i) $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_MUSIC} {
			$ue($i) connect-agent $udp($i) $server_jingfm($i) $wifi_interface($i)
		}
		if {$app_type_list($i) == $APP_ONLINE_GAME} {
			$ue($i) connect-agent $udp($i) $server_steam($i) $wifi_interface($i)
		}
 	}
	if {$in_service_network($i) == $UMTS_IN_SERVICE} {
		$ue($i) attach-agent $udp($i) $td_scdma_interface($i)
		if {$app_type_list($i) == $APP_VOIP} {
			$ue($i) connect-agent $udp($i) $server_google($i) $td_scdma_interface($i) 
		}
		if {$app_type_list($i) == $APP_NEWS} {
			$ue($i) connect-agent $udp($i) $server_yahoo($i) $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_VIDEO} {
			$ue($i) connect-agent $udp($i) $server_youtube($i) $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_SNS} {
			$ue($i) connect-agent $udp($i) $server_facebook($i) $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_CHAT} {
			$ue($i) connect-agent $udp($i) $server_qq($i) $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_MUSIC} {
			$ue($i) connect-agent $udp($i) $server_jingfm($i) $td_scdma_interface($i)
		}
		if {$app_type_list($i) == $APP_ONLINE_GAME} {
			$ue($i) connect-agent $udp($i) $server_steam($i) $td_scdma_interface($i)
		}
 	}
 }

for {set i 0} {$i < 20} {incr i 1} {
	#$ue(0) attach-agent $udp(0) $wifi_interface(0)                   ;# new command: the interface is used for sending
	#$ue(0) connect-agent $udp(0) $server_google(0) $wifi_interface(0)

	#$ue(1) attach-agent $udp(1) $wifi_interface(1)                   ;# new command: the interface is used for sending
	#$ue(1) connect-agent $udp(1) $server_yahoo(0) $wifi_interface(1)
	$ue($i) attach-agent $udp($i) $td_scdma_interface($i)
}

for {set i 0} {$i < 20} {incr i 1} {
	$ue($i) connect-agent $udp($i) $server_google($i) $td_scdma_interface($i) 
}


 if {$in_service_network($i) == $WIFI_IN_SERVICE} {
		if {$app_type_list($i) == $APP_VOIP} {
			$ue($i) connect-agent $udp($i) $server_google($i) $wifi_interface($i) 
		}
		if {$app_type_list($i) == $APP_NEWS} {
			$ue($i) connect-agent $udp($i) $server_yahoo($i) $wifi_interface($i) 
		}
		if {$app_type_list($i) == $APP_VIDEO} {
			$ue($i) connect-agent $udp($i) $server_youtube($i) $wifi_interface($i) 
		}
		if {$app_type_list($i) == $APP_SNS} {
			$ue($i) connect-agent $udp($i) $server_facebook($i) $wifi_interface($i) 
		}
		if {$app_type_list($i) == $APP_CHAT} {
			$ue($i) connect-agent $udp($i) $server_qq($i) $wifi_interface($i) 
		}
		if {$app_type_list($i) == $APP_MUSIC} {
			$ue($i) connect-agent $udp($i) $server_jingfm($i) $wifi_interface($i) 
		}
		if {$app_type_list($i) == $APP_ONLINE_GAME} {
			$ue($i) connect-agent $udp($i) $server_steam($i) $wifi_interface($i) 
		}
	} 
	if {$in_service_network($i) == $UMTS_IN_SERVICE} {




if {[lindex $network_type $i] == $WIFI_IN_SERVICE || [lindex $network_type $i] != $WIFI_IN_SERVICE} {
		puts -nonewline "WIFI $WIFI_IN_SERVICE "
		
		set cbr($i) [new Application/Traffic/CBR]
		$cbr($i) attach-agent $udp_wifi($i)
		$cbr($i) set type_ CBR
		$cbr($i) set packet_size_ [expr 222+$i]
		$ns at 0.01 "$cbr($i) start"
		if {[lindex $app_type $i] == $APP_VOIP} {
			puts " voip $APP_VOIP"
			$ue($i) connect-agent $udp_wifi($i) $server_google($i) $wifi_interface($i) 
		}
		if {[lindex $app_type $i] == $APP_NEWS} {
			puts "news $APP_NEWS"
			$ue($i) connect-agent $udp_wifi($i) $server_yahoo($i) $wifi_interface($i) 
		}
		if {[lindex $app_type $i] == $APP_VIDEO} {
			puts "video $APP_VIDEO"
			$ue($i) connect-agent $udp_wifi($i) $server_youtube($i) $wifi_interface($i) 
		}
		if {[lindex $app_type $i] == $APP_SNS} {
			puts "sns $APP_SNS"
			$ue($i) connect-agent $udp_wifi($i) $server_facebook($i) $wifi_interface($i) 
		}
		if {[lindex $app_type $i] == $APP_CHAT} {
			puts "chat $APP_CHAT"
			$ue($i) connect-agent $udp_wifi($i) $server_qq($i) $wifi_interface($i) 
		}
		if {[lindex $app_type $i] == $APP_MUSIC} {
			puts "music $APP_MUSIC"
			$ue($i) connect-agent $udp_wifi($i) $server_jingfm($i) $wifi_interface($i) 
		}
		if {[lindex $app_type $i] == $APP_ONLINE_GAME} {
			puts "on_line_game $APP_ONLINE_GAME"
			$ue($i) connect-agent $udp_wifi($i) $server_steam($i) $wifi_interface($i) 
		}
		puts "CBB($i) from WLAN"
	}



	#==================================================================
# Filename: 	twoAP_oneBS_RNC_SGSN.tcl
# Author: 	Huang Minghe <H.Minghe@gmail.com>
# Description:	See twoAP_oneBS_RNC_SGSN_instruction.txt
# You can:	Freely copy, distribute,and use under the following conditions
#		No direct commercial advantage is obtained
#		No liability is attributed to the author for any damages incurred.
# I hope:	When changes happen,let me know. thanks
#==================================================================*/
#检查输入
if {$argc != 0} {
	puts ""
	puts "Wrong Number of Arguments! No arguments in this topology"
	puts ""
	exit (1)
}
global ns

#定义结束过程
proc finish {} {
    global ns f
    $ns flush-trace
    close $f
    puts " Simulation ended."
    exit 0
}

source ./function.tcl
source ./topo.tcl
# 当前路径
set output_dir .

#创建仿真实例
set ns [new Simulator]
$ns use-newtrace

$ns color 1 Blue
$ns color 2 Red
#将仿真过程写入追踪文件
set f [open out.tr w]
$ns trace-all $f
set namfile [open out.nam w]
$ns namtrace-all-wireless $namfile 800 800 

# 配置 UMTS
$ns set hsdschEnabled_ 1addr
$ns set hsdsch_rlc_set_ 0
$ns set hsdsch_rlc_nif_ 0

# 配置层次结构（域：簇：ip号） (needed for routing over a basestation)
$ns node-config -addressType hierarchical
AddrParams set domain_num_  13                      			;# 域数目
AddrParams set cluster_num_ {1 1 1 1 1 1 1 1 1 1 1 1 1}            	;# 簇数目 
AddrParams set nodes_num_   {5 1 1 1 1 1 1 1 1 1 3 1 1}	      			;# 每个簇的节点数目             

#配置RNC 
puts "##############################################################"
puts "***********************Now, Creating RNC**********************"

$ns node-config -UmtsNodeType rnc 
set RNC [$ns create-Umtsnode 0.0.0] ;# node id is 0.
$RNC set X_ 200 
$RNC set Y_ 100
$RNC set Z_ 0
puts "RNC $RNC"


puts "***********************Completed successfully*****************"
puts "##############################################################"
puts ""
puts ""

# 配置UMTS基站

puts "##############################################################"
puts "***********************Now, Creating BS**********************"

$ns node-config -UmtsNodeType bs \
		-downlinkBW 384kbs \
		-downlinkTTI 10ms \
		-uplinkBW 384kbs \
		-uplinkTTI 10ms \
     		-hs_downlinkTTI 2ms \
      		-hs_downlinkBW 384kbs 

set BS [$ns create-Umtsnode 0.0.1] ;# node id is 1 基站和RNC处在同一个域
$BS set X_ 100 
$BS set Y_ 100 
$BS set Z_ 0
puts "BS $BS"

puts "***********************Completed successfully*****************"
puts "##############################################################"
puts ""
puts ""

#链接BS和RNC 
puts "##############################################################"
puts "***********************Now, Connecting RNC and BS*************"

$ns setup-Iub $BS $RNC 622Mbit 622Mbit 15ms 15ms DummyDropTail 2000

puts "***********************Completed successfully*****************"
puts "##############################################################"
puts ""
puts ""

#创建UMTS无线节点
puts "##############################################################"
puts "******Now, Creating UMTS UE(us as MultiFaceNode's NIC)*******"

$ns node-config -UmtsNodeType ue \
		-baseStation $BS \
		-radioNetworkController $RNC

#td_scdma_interface(0)携带的是UMTS的网卡，可作为后面多面终端的网卡之一

set td_scdma_interface(0) [$ns create-Umtsnode 0.0.2] ;# node id is 2
$td_scdma_interface(0) set Y_ 50 
$td_scdma_interface(0) set X_ 100 
$td_scdma_interface(0) set Z_ 0
set td_scdma_interface(0)_id [$td_scdma_interface(0) id]
puts "td_scdma_interface(0) created $td_scdma_interface(0)_id" 

set td_scdma_interface(1) [$ns create-Umtsnode 0.0.3]
$td_scdma_interface(1) set Y_ 100
$td_scdma_interface(1) set X_ 50
$td_scdma_interface(1) set Z_ 0
set td_scdma_interface(1)_id [$td_scdma_interface(1) id]
puts "td_scdma_interface(1) created $td_scdma_interface(1)_id"
#创建一个虚假节点，只是仿真的顺利需要。
set dummy_node [$ns create-Umtsnode 0.0.3] ;# node id is 3
$dummy_node set Y_ 150
$dummy_node set X_ 100 
$dummy_node set Z_ 0
puts "Creating dummy node $dummy_node"

puts "***********************Completed successfully*****************"
puts "##############################################################"
puts ""
puts ""

#创建SGSN 和GGSN。处在不同的域里。Node id for SGSN0 and GGSN0 are 4 and 5, respectively.
puts "##############################################################"
puts "***********************Now, Creating GGSN and SGSN************"

set SGSN [$ns node 1.0.0]
set SGSN_id [$SGSN id]
puts "SGSN $SGSN"
puts "SGSN_id $SGSN_id"
$SGSN set X_ 300 
$SGSN set Y_ 100 
$SGSN set Z_ 0

set GGSN [$ns node 2.0.0]
$GGSN set X_ 400
$GGSN set Y_ 100 
$GGSN set Z_ 0
puts "GGSN $GGSN"
set GGSN_id [$GGSN id]
puts "GGSN_id $GGSN_id"

puts "***********************Completed successfully*****************"
puts "##############################################################"
puts ""
puts ""


#创建两个节点，在这里这两个节点我们可以这是核心网的节点。
puts "##############################################################"
puts "***********************Now, Creating Yahoo and CN_host2****"

for {set i 0} {$i < 7} {incr i 1} {
  set server($i) [$ns node [expr 3 + $i].0.0]
  SetRandomPositionForNode $server($i) 50 700
  $ns at 0.0 "$server($i) label \"Server$i\""
}

# do the connections in the UMTS part
puts "Connecting RNC SGSN GGSN Google CN host1"

$ns duplex-link $RNC $SGSN 622Mbit 0.4ms DropTail 1000
$ns duplex-link $SGSN $GGSN 622MBit 10ms DropTail 1000
for {set i 0} {$i < 7} {incr i 1} {
  $ns duplex-link $GGSN $server($i) 10MBit 15ms DropTail 1000
}

$RNC add-gateway $SGSN                                      		 ;#这一句应该放在链路搭建完成之后，一般情况放在这个位置

puts "***********************Completed successfully*****************"
puts "##############################################################"
puts ""
puts ""

#添加WLAN网络。 
puts "##############################################################"
puts "***********************Now, Creating WLAN*********************"

# parameter for wireless nodes
set opt(chan)           Channel/WirelessChannel   			;# channel type for 802.11
set opt(prop)           Propagation/TwoRayGround   			;# radio-propagation model 802.11
set opt(netif)          Phy/WirelessPhy            			;# network interface type 802.11
set opt(mac)            Mac/802_11                 			;# MAC type 802.11
set opt(ifq)            Queue/DropTail/PriQueue    			;# interface queue type 802.11
set opt(ll)             LL                         			;# link layer type 802.11
set opt(ant)            Antenna/OmniAntenna        			;# antenna model 802.11
set opt(ifqlen)         50              	   			;# max packet in ifq 802.11
set opt(adhocRouting)   DSDV                       			;# routing protocol 802.11
set opt(umtsRouting)    ""                         			;# routing for UMTS (to reset node config)

set opt(x)	   	1000 			   			;# X dimension of the topography
set opt(y)		1000			   			;# Y dimension of the topography

#配置WLAN的速率为11Mb 
Mac/802_11 set basicRate_ 11Mb
Mac/802_11 set dataRate_ 11Mb
Mac/802_11 set bandwidth_ 11Mb
Mac/802_11 set client_lifetime_ 10 					;#increase since iface 2 is not sending traffic for some time

#配置拓扑
puts "1 Creating topology"
puts ""
set topo [new Topography]
$topo load_flatgrid $opt(x) $opt(y)

puts "Topology created"
puts ""

# create God
set god [create-god 18]				                		;# give the number of nodes 

#创建多摸节点 
puts "2 Creating UE"
puts ""

$ns node-config  -multiIf ON                            		;#to create MultiFaceNode
set ue(0) [$ns node 6.0.0] 
$ue(0) set X_ 100
$ue(0) set Y_ 100 
$ue(0) set Z_ 0
set ue(0)_id [$ue(0) id]
puts "ue(0) $ue(0)_id"
set ue(1) [$ns node 7.0.0]
$ue(1) set X_ 200
$ue(1) set Y_ 100
$ue(1) set Z_ 0
set ue(1)_id [$ue(1) id] 
puts "ue(1) $ue(1)_id"
$ns node-config  -multiIf OFF                           		;#reset attribute

#设置节点之间的最小跳数，减少计算时间。
#$god set-dist 1 2 1 
#$god set-dist 0 2 2 
#$god set-dist 0 1 1 
set god [God instance]


puts "finished"
puts ""

#配置接入点AP 
puts "3 Creating AP"
puts ""

puts "coverge:20m"

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
set AP0 [$ns node 5.0.0]

set AP0_id [$AP0 id]
puts "AP0_id $AP0_id"

$AP0 set X_ [expr 200]
$AP0 set Y_ 50.0
$AP0 set Z_ 0.0
[$AP0 set mac_(0)] bss_id [[$AP0 set mac_(0)] id]
[$AP0 set mac_(0)] enable-beacon
[$AP0 set mac_(0)] set-channel 1
puts "AP0 created"


# creation of the wireless interface 802.11
puts "5 Creating 2 WLAN UEs"
puts ""
$ns node-config -wiredRouting OFF \
                -macTrace ON 				
set wifi_interface(0) [$ns node 5.0.1] 	                                   		;# create the node with given @.	
$wifi_interface(0) random-motion 0
set wifi_interface(0)_id [$wifi_interface(0) id]
puts "wifi_interface(0)_id $wifi_interface(0)_id connet to AP0"			                          	;# disable random motion
$wifi_interface(0) base-station [AddrParams addr2id [$AP0 node-addr]] 			;#attach mn to basestation

$wifi_interface(0) set X_ [expr 110.0]
$wifi_interface(0) set Y_ 110.0
$wifi_interface(0) set Z_ 0.0
[$wifi_interface(0) set mac_(0)] set-channel 1
$ns at 0.0 "$wifi_interface(0) setdest 550.0 300.0 40.0"

set wifi_interface(1) [$ns node 5.0.2] 	                                   		;# create the node with given @.	
$wifi_interface(0) random-motion 0
set wifi_interface(1)_id [$wifi_interface(1) id]
puts "wifi_interface(1)_id $wifi_interface(1)_id connect to AP0"			                          	;# disable random motion
$wifi_interface(1) base-station [AddrParams addr2id [$AP0 node-addr]] 			;#attach mn to basestation

$wifi_interface(1) set X_ [expr 250.0]
$wifi_interface(1) set Y_ 50.0
$wifi_interface(1) set Z_ 0.0
[$wifi_interface(1) set mac_(0)] set-channel 1

$ns at 0.0 "$wifi_interface(1) setdest 450.0 600.0 35.0"
# add link to backbone
puts "5 Connecting AP0 to RNC and Connecting AP1 to SGSN"
puts ""
$ns duplex-link $AP0 $RNC 10MBit 15ms DropTail 1000
# add interfaces to MultiFaceNode
$ue(0) add-interface-node $wifi_interface(0)
$ue(0) add-interface-node $td_scdma_interface(0)
$ue(1) add-interface-node $wifi_interface(1)
$ue(1) add-interface-node $td_scdma_interface(1)
puts "***********************Completed successfully*****************"

for {set i 0} {$i < 2} {incr i 1} {
  set udp_wifi($i) [new Agent/UDP]
  set udp_td_scdma($i) [new Agent/UDP]
  $ue($i) attach-agent $udp_td_scdma($i) $td_scdma_interface($i)
  $ue($i) attach-agent $udp_wifi($i) $wifi_interface($i)

}

for {set i 0} {$i < 7} {incr i 1} {
  set null($i) [new Agent/Null]
  $ns attach-agent $server($i) $null($i)
}

set network_type [ScanNetworks 2 ue in_service_network wifi_interface td_scdma_interface $AP0 $BS]
puts $network_type

set app_type [RandomApplicationGeneration 2 7]
puts $app_type

for {set i 0} {$i < 2} {incr i 1} {
  if {[lindex $network_type $i]  == $UMTS_IN_SERVICE} {
    puts -nonewline "UMTS $UMTS_IN_SERVICE "    
    if {[lindex $app_type $i] == $APP_VOIP} {
      puts " voip $APP_VOIP"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_NEWS} {
      puts "news $APP_NEWS"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_VIDEO} {
      puts "video $APP_VIDEO"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_SNS} {
      puts "sns $APP_SNS"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_CHAT} {
      puts "chat $APP_CHAT"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_MUSIC} {
      puts "music $APP_MUSIC"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_ONLINE_GAME} {
      puts "on_line_game $APP_ONLINE_GAME"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    } 
    set cbr($i) [new Application/Traffic/CBR]
    $cbr($i) attach-agent $udp_td_scdma($i)
    puts "CBB($i) from TD-SCDMA"
  }

  if {[lindex $network_type $i] == $WIFI_IN_SERVICE} {
    puts -nonewline "WIFI $WIFI_IN_SERVICE "

    if {[lindex $app_type $i] == $APP_VOIP} {
      puts " voip $APP_VOIP"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_NEWS} {
      puts "news $APP_NEWS"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_VIDEO} {
      puts "video $APP_VIDEO"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_SNS} {
      puts "sns $APP_SNS"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_CHAT} {
      puts "chat $APP_CHAT"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_MUSIC} {
      puts "music $APP_MUSIC"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_ONLINE_GAME} {
      puts "on_line_game $APP_ONLINE_GAME"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    set cbr($i) [new Application/Traffic/CBR]
    $cbr($i) attach-agent $udp_wifi($i)
    puts "CBB($i) from WLAN"
  }
}

$cbr(1) set type_ CBR 
$cbr(1) set packet_size_ 1000
$cbr(1) set rate_ 1mb
$cbr(1) set random_ false
$ns at 0.5 "$cbr(1) start"

$cbr(0) set type_ CBR 
$cbr(0) set packet_size_ 500
$cbr(0) set rate_ 1mb
$cbr(0) set random_ false
$ns at 0.5 "$cbr(0) start"

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

$ns attach-hsdsch $td_scdma_interface(1) $udp_td_scdma(1)

# we must set the trace for the environment. If not, then bandwidth is reduced and
# packets are not sent the same way (it looks like they are queued, but TBC)
puts "set trace for the environment......"

$BS setErrorTrace 0 "idealtrace"
#$BS setErrorTrace 1 "idealtrace"

# load the CQI (Channel Quality Indication)
puts "loading Channel Quality Indication......"
$BS loadSnrBlerMatrix "SNRBLERMatrix"

puts "finished"
puts "****************************************************************"
puts "################################################################"

proc ToWifi {} {
  global ns ue udp_wifi wifi_interface null
  $ns trace-annotate "[getNodeIpAddress $ue(0)] handover from UMTS to WIFI" 
  $ue(0) attach-agent $udp_wifi(0) $wifi_interface(0)
  $ue(0) connect-agent $udp_wifi(0) $null(0) $wifi_interface(0)
}

#$ns at 1.5 "ToWifi"
#$ns at 1.5 "WifiToUmts $ns $ue(1) $td_scdma_interface(1) $udp_td_scdma(1) $null(1) "
$ns at 15 "finish"

puts " Simulation is running ... please wait ..."
$ns run

for {set i 0} {$i < 2} {incr i 1} {
  if {[lindex $network_type $i]  == $UMTS_IN_SERVICE} {
    puts -nonewline "UMTS $UMTS_IN_SERVICE "    
    if {[lindex $app_type $i] == $APP_VOIP} {
      puts " voip $APP_VOIP"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_NEWS} {
      puts "news $APP_NEWS"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_VIDEO} {
      puts "video $APP_VIDEO"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_SNS} {
      puts "sns $APP_SNS"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_CHAT} {
      puts "chat $APP_CHAT"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_MUSIC} {
      puts "music $APP_MUSIC"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_ONLINE_GAME} {
      puts "on_line_game $APP_ONLINE_GAME"
      $ue($i) connect-agent $udp_td_scdma($i) $null($i) $td_scdma_interface($i) 
    } 
    set cbr($i) [new Application/Traffic/CBR]
    $cbr($i) attach-agent $udp_td_scdma($i)
    puts "CBB($i) from TD-SCDMA"
  }

  if {[lindex $network_type $i] == $WIFI_IN_SERVICE} {
    puts -nonewline "WIFI $WIFI_IN_SERVICE "

    if {[lindex $app_type $i] == $APP_VOIP} {
      puts " voip $APP_VOIP"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_NEWS} {
      puts "news $APP_NEWS"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_VIDEO} {
      puts "video $APP_VIDEO"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_SNS} {
      puts "sns $APP_SNS"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_CHAT} {
      puts "chat $APP_CHAT"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_MUSIC} {
      puts "music $APP_MUSIC"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    if {[lindex $app_type $i] == $APP_ONLINE_GAME} {
      puts "on_line_game $APP_ONLINE_GAME"
      $ue($i) connect-agent $udp_wifi($i) $null($i) $wifi_interface($i) 
    }
    set cbr($i) [new Application/Traffic/CBR]
    $cbr($i) attach-agent $udp_wifi($i)
    puts "CBB($i) from WLAN"
  }
}