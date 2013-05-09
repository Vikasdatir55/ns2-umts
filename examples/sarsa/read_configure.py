#!/usr/bin/python
import re

def read_array(file_name):
	fp = open(file_name)
	list_data = []
	for line in fp.readlines():
		line = line.strip()   			#delete the newline "\n"
		list_data.append(re.split('\s', line))	#store them as two dimonssin by using regular expression
	fp.close()
	
	data_map = [([0] * len(list_data)) for i in range(len(list_data))]	
	for i in range(len(list_data)):
		for j in range(len(list_data)):
			data_map[i][j] = int(list_data[i][j])
	return data_map

