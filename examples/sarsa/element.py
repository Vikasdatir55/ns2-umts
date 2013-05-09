#!/usr/bin/python
import random

def get_random(N):
	return int(N*random.random())	
def get_from(list_of_next_state):
	index = get_random(len(list_of_next_state))
	next_state = list_of_next_state[index]
	return next_state
def list_of_next(r_map, current_state):
	list_of_next_state = []
	for i in range(6):
		if r_map[current_state][i] >= 0:
			list_of_next_state.append(i)
	return list_of_next_state

def printArray(array):
	print "["
	for i in range(len(array)):
		for j in range(len(array)):
			print array[i][j],
			print ",",
		print ";"
    	print "]"

class Agent:
        #q_map = [([0] * 6) for i in range(6)]
	#r_map = [([0] * 6) for i in range(6)]
#	q_map = []
#	r_map = []
#	current_state = 0
#	N = 100	 			# number of state 
#	max_episode_times = 1000000	# max times of episode

	state_num = 0
	current_state = 0
	route = []

	def setStateNumber(self,val = 0):
		self.state_num = val
	def getStateNumber(self):
		return self.state_num
	def setCurrentState(self, val):
		self.current_state = val
	def getCurrentState(self):
		return self.current_state
	def initR(self):
		self.r_map = [([0.0] * self.state_num) for i in range(self.state_num)]
	def initQ(self):
		self.q_map = [([0.0] * self.state_num) for i in range(self.state_num)]
	def printR(self):
		print "R map is "
		printArray(self.r_map)
	def printQ(self):
		print "Q map is "
		printArray(self.q_map)
	def recordRoute(self):
		self.route.append(self.current_state)
	def printRoute(self):
		print self.route
	def getNextStateList(self):
		self.list_of_next_state = []
		for i in range(self.state_num):
			if self.r_map[self.current_state][i] >= 0:
				self.list_of_next_state.append(i)
		return self.list_of_next_state
	def printNextStateList(self):
		print self.list_of_next_state
	def updateQ(self, algorithm = "Sarsa"):
		list_of_next_state = self.getNextStateList()
		next_state = get_from(list_of_next_state)
		tmp = []
		for i in range(self.state_num):
			tmp.append(self.q_map[next_state][i])
		if  algorithm == "Sarsa":
			alpha = 0.9
			gamma = 0.4
			# Sarsa-learning
			random_choice = get_random(self.state_num)
			self.q_map[self.current_state][next_state] += alpha*(self.r_map[self.current_state][next_state] + gamma*tmp[random_choice] - self.q_map[self.current_state][next_state])			
		elif algorithm == "Q":
			alpha = 0.9
			gamma = 0.4
			# Q-learning
			self.q_map[self.current_state][next_state] +=  alpha*(self.r_map[self.current_state][next_state] + gamma * max(tmp) - self.q_map[self.current_state][next_state])			
		else:
			print "Have not set update Q algorithm"
			return
	def episode(self, max_episode_times=0):
		offset = 0
		diff = 0
		count = 0
		for episode in range(max_episode_times):
			self.current_state = get_random(self.state_num)
			pre_q_map = self.q_map
			self.updateQ("Sarsa")
			for i in range(self.state_num):
				for j in range(self.state_num):
					diff = self.q_map[i][j] - pre_q_map[i][j]
					offset = offset + diff
			if abs(offset) < 0.0001 and count >= 10000:
				break
			else:
				count = count + 1
		print 'have finished %d time episodes' %count
	def getOptimalAction(self):
		max_q = 0
		max_q = self.q_map[self.current_state][0]
		for i in range(1,self.state_num):
			if self.q_map[self.current_state][i] >= max_q:
				max_q = self.q_map[self.current_state][i]
		for i in range(0, self.state_num):				
			if self.q_map[self.current_state][i] == max_q:
				self.current_state = i
				self.recordRoute()
		return self.current_state
	def getRandomAction(self):
		list_of_next_state = list_of_next(self.r_map, self.current_state)
		self.current_state = get_from(list_of_next_state)
		self.recordRoute()
		return self.current_state

class State(object):
	state_id = 0
	network_type = ""
	phone_i = 0
	phone_bandth = 0
	phone_delay = 0

	def __init__(self):
		self.state_id = 0
		self.network_type = "none"
		self.phone = 0
		self.phone_bandth = 0
		self.phone_delay = 0
	def set_id(self,val):
		self.state_id = val
	def set_ivalue(self, val):
		self.phone_i = val
	def set_banth(self, val):
		self.phone_bandth = val
	def setDelay(self, val):
		self.phone_delay = 0


