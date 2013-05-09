reset
set term png
set output "mean_throughput.png"

set xlabel "time"
set ylable "mean throughput"

set tittle "Just Test"

plot '15.dat' using 2 
