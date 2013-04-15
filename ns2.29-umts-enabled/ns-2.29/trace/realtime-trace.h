#ifndef REALTIME_TRACE_H
#define REALTIME_TRACE_H
#include <map>
#include <string.h>
#include <iostream>
#include <fstream>
#include "/home/eric/ns/ns-allinone-2.29/ns-2.29/common/agent.h"
#include "trace.h"

struct iterm {
    char* send_node_;
    char* recv_node_;
	double send_time_;
	double recv_time_;
	char* packet_type_;
	int packet_size_;
};

class RealtimeTrace : public Agent {
private:
	// the source node
	//char* src_nodeaddr;
	// the destination node
	//char* dst_nodeaddr;
	static double current_delay;
	static double mean_delay;
	static double current_throughput;
	static double mean_throughput;
	static double jitter;

	void TraceSendType(const char* fromNode, 
					   const char flag, 
					   const int packedUid, 
					   const double sendTime,
					   const char* packetType, 
					   const int packetSize);

	void TraceRecvType(const char* toNode, 
                       const char flag, 
                       const int packedUid, 
                       const double recvTime, 
					   const char* packetType, 
                       const int packetSize);
	void UpdateMeanDelay(const char* src_nodeaddr, 
                         const char* dst_nodeaddr, 
                         const char* pt);
	void UpdateCurrentDelay(const char* src_nodeaddr, 
                         	const char* dst_nodeaddr, 
                         	const char* pt);
	void UpdateMeanThroughput(const char* nodeaddr,
							  const char* pt);

public:
	//map<uid, <send_time, recv_time, packet_size>> to store the trace data
	static std::map<int, iterm> traceMap;
    
    //static double current_delay_;
    //static double mean_delay_;
	
	RealtimeTrace() : Agent(PT_UDP){};
	virtual	~RealtimeTrace();
	void TraceType(const char* fromNode, 
                   const char* toNode, 
                   const char flag, 
                   const int packedUid, 
				   const double sendTime, 	
                   const double recvTime,
				   const char* packetType, 
                   const int packetSize);
	void UpdateTraceMap(const char* fromNode,
						const char* toNode,
						const char flag,
						const int packetUid,
						const double sendTime,
						const double recvTime,
						const char* packetType,
						const int packetSize);

	double GetMeanDelay(const char* src_nodeaddr, 
                        const char* dst_nodeaddr, 
                        const char* pt) 
	{ 
		UpdateMeanDelay(src_nodeaddr, dst_nodeaddr, pt);
		return mean_delay;
	}

	double GetCurrentDelay(const char* src_nodeaddr, 
                           const char* dst_nodeaddr, 
                           const char* pt)
	{
		UpdateCurrentDelay(src_nodeaddr, dst_nodeaddr, pt);
		return current_delay;
	}

    double GetMeanThroughput(const char* nodeaddr,
							 const char* pt)
	{
		UpdateMeanThroughput(nodeaddr, pt);
		return mean_throughput;
	}

	void WriteDelayOnFile(const char* src_nodeaddr, const char* dst_nodeaddr);

    void Test();
    double SetValueTest(double val);
protected:
    int command(int argc, const char*const* argv);
};

#endif
