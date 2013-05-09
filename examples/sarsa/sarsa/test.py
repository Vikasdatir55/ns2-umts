#!/usr/bin/python
from element import *
from read_configure import *
import random

agent = Agent()
agent.setStateNumber(6)
agent.initR()
printArray(agent.r_map)
agent.initQ()
printArray(agent.q_map)


#init state list and set attributes randomly
state = []
for i in range(agent.state_num):
	state.append(State())
	if i % 2 == 0 :
		state[i].network_type = "wifi"
	else:
		state[i].network_type = "TD-SCDMA"

	state[i].state_id = i
	state[i].phone_i = abs(random.random())
	state[i].phone_bandth = get_random(10)
	state[i].phone_delay = get_random(3)

# set r_map: read from file or random set according to state-actino pair
flag = 1
delta_i = [([0.0] * agent.state_num) for i in range(agent.state_num)]
delta_bandth = [([0.0] * agent.state_num) for i in range(agent.state_num)]
delta_delay = [([0.0] * agent.state_num) for i in range(agent.state_num)]
delta_prefer = 0

if flag:
	for i in range(agent.state_num):
		for j in range(agent.state_num):
			#agent.r_map[i][j] = get_random(agent.N)
			if state[i].network_type == "wifi":
				delta_prefer = 1
			else:
				delta_prefer = 0

			delta_i[i][j] = (state[i].phone_i - state[j].phone_i )
			delta_bandth[i][j] = (state[j].phone_bandth - state[i].phone_bandth)
			delta_delay[i][j] = (state[i].phone_delay - state[j].phone_delay)
			#agent.r_map[i][j] = 0.5 * delta_i[i][j]*delta_i[i][j] + 0.2 * delta_bandth[i][j] + 0.2 * delta_delay[i][j] + 0.1 * delta_prefer
			agent.r_map[i][j] = delta_i[i][j]
else:
	agent.r_map = read_array("r_map.txt")

agent.printR()
print "begin to episode"
agent.episode(10000)
print "episode done"
agent.printQ()
#go to the perfect goal with q_map
'''
agent.current_state = 3
while(agent.current_state != 5):
	agent.getOptimalAction()
agent.printRoute()

agent.current_state = 3
route_random = []
while (agent.current_state != 5):
	agent.getRandomAction()
	route_random.append(agent.current_state)
print route_random
'''
print "Let's test how much energy can save for us"
agent.current_state = 0
route_sara = []
route_random = []
time_step = 10
energy_sarsa = 1.0 * state[agent.current_state].phone_i
energy_random = 1.0 * state[agent.current_state].phone_i
bandth_sarsa = 1.0 * state[agent.current_state].phone_bandth
bandth_random = 1.0 * state[agent.current_state].phone_bandth
delay_sarsa = 1.0 * state[agent.current_state].phone_delay
delay_random = 1.0 * state[agent.current_state].phone_delay

AAAA = 0.0
BBBB = 0.0
for i in range(600):
	pre_state = agent.current_state
	agent.getOptimalAction()
	route_sara.append(agent.current_state)
	energy_sarsa = 10.0 * state[agent.current_state].phone_i + energy_sarsa
	bandth_sarsa = 1.0 * state[agent.current_state].phone_bandth + bandth_sarsa
	delay_sarsa = 1.0 * state[agent.current_state].phone_delay + bandth_sarsa
	AAAA += agent.r_map[pre_state][agent.current_state] 
agent.current_state = 0
for i in range(600):
	pre_state = agent.current_state
	agent.getRandomAction()
	route_random.append(agent.current_state)
	energy_random = 1.0 * state[agent.current_state].phone_i + energy_random
	bandth_random = 1.0 * state[agent.current_state].phone_bandth + bandth_random
	delay_random = 1.0 * state[agent.current_state].phone_delay + bandth_random
	BBBB += agent.r_map[pre_state][agent.current_state]

print "have come to goal %d" %agent.current_state
print "energy_sarsa = %f" %energy_sarsa
print "energy_random = %f" %energy_random
print "bandth_sarsa = %f" %bandth_sarsa
print "bandth_random = %f" %bandth_random
print "delay_sarsa = %f" %delay_sarsa
print "delay_random = %f" %delay_random
print "AAAA = %d" %AAAA
print "BBBB = %d" %BBBB

print "route"
print route_sara
print route_random


print "Done"

