set terminal postscript eps

set output "banth.eps"

set xtics font "Times-Roman,25"
set ytics font "Times-Roman,25"

set xlabel 'Time(s)' font "Times-Roman,25"
set ylabel 'Bandth(MB)' font "Times-Roman,25"

set style line 1 pt 5 ps 1   lw 2  lt 1 lc 1 
set style line 2 pt 5 ps 1.5 lw 10 lt 0 lc 1
set style line 3 pt 3 ps 1 	 lw 2  lt 2 lc 3
set style line 4 pt 5 ps 1.5 lw 10 lt 0 lc 3

set border 3
set xtics nomirror
set ytics nomirror

set notitle

plot [9000:13000] [0:1] 'bandth.dat' every 60 using 1:2 ls 1 with linespoints,'bandth.dat' every 60 using 1:2 ls 2 smooth sbezier with lines,'bandth.dat' every 60 using 1:3 ls 3 with linespoints ,'bandth.dat' every 60 using 1:3 ls 4 smooth sbezier with lines
