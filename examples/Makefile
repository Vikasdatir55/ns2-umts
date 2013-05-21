compile:
	ns handover.tcl
	ns data.tcl && gnuplot bandth.plt && gnuplot delay.plt && gnuplot jitter.plt && gnuplot battery.plt
	nam out.nam
clean:
	rm *.nam *.tr *.txt -rf
	rm *.dat -rf
	rm out.* -rf
