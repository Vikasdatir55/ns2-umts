# Define prameters

set topo_x			500
set topo_y			500

set opt(BS_X)		[expr 210 + $topo_x]
set opt(BS_Y) 		[expr 119 + $topo_y]
set opt(AP_X) 		[expr 210 + $topo_x]
set opt(AP_Y)		[expr 150 + $topo_y]
set opt(GGSN_X) 	[expr 400 + $topo_x]
set opt(GGSN_Y)		[expr 150 + $topo_y]
set opt(RNC_X)		[expr 321 + $topo_x]
set opt(RNC_Y) 		[expr 150 + $topo_y]
set opt(SGSN_X)		[expr 362 + $topo_x]
set opt(SGSN_Y) 	[expr 150 + $topo_y]

set opt(Yahoo_X)	571
set opt(Yahoo_Y)	169
set opt(Facebook_X)	557
set opt(Facebook_Y) 97
set opt(QQ_X) 		540
set opt(QQ_Y) 		68
set opt(JingFm_X)	486
set opt(JingFm_Y)   238
set opt(Steam_X)	568
set opt(Steam_Y) 	131
set opt(Youtube_X)	489
set opt(Youtube_Y)	43
set opt(Google_X) 	543
set opt(Google_Y) 	211

set opt(node_size) 	1
set opt(bs_size)	200
set opt(ap_size)	50

# set number of mobile nodes, 
#that means we have create same number of the td_scdma 
#interface and wifi interface
set opt(num_mobilnode) 20
set opt(num_td_interface) 1
set opt(num_server) 4
set opt(num_app_type) 4

set APP_NEWS 0
set APP_SNS 1
set APP_CHAT 2
set APP_MUSIC 3
set APP_ONLINE_GAME 4
set APP_VIDEO 5
set APP_VOIP 6









set ser_name(0) "Yahoo"
set ser_name(1) "Facebook"
set ser_name(2) "QQ"
set ser_name(3) "JingFm"
set ser_name(4) "Steam"
set ser_name(5) "Youtube"
set ser_name(6) "Google"


