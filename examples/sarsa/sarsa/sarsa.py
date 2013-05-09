#!/usr/bin/python
from element import *
from read_configure import *

state = State()
agent = Agent()
agent.set_N(6)
#read award map to r_map
agent.r_map = read_array("r_map.txt")
print '%d'  %agent.r_map[0][0]
agent.q_map = [([0.0] * agent.N) for i in range(agent.N)]
print "%d" %agent.q_map[0][0]
'''
for i in range(agent.N):
	for j in range(agent.N):
		agent.q_map[i][j] = 0
		agent.r_map[i][j] = get_random(agent.N)
'''
offset = 0
diff = 0
count = 0
for episode in range(100000):
	agent.current_state = get_random(agent.N)
	pre_q_map = agent.q_map
	agent.get_action()
	for i in range(agent.N):
		for j in range(agent.N):
			diff = agent.q_map[i][j] - pre_q_map[i][j]
			offset = offset + diff
	if abs(offset) < 0.0001 and count >= 10000:
		break
	else:
		count = count + 1
print 'have finished %d time episodes' %count
	
print "Q_Map is"
for i in range(agent.N):
	print agent.q_map[i]

print "R_map"
for i in range(agent.N):
	print agent.r_map[i]
