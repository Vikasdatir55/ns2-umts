set ns [new Simulator]
source ./function.tcl
global a 
set a [list 1 2 3]
set a [lreplace $a 1 1 4]
puts $a 

$ns at [$ns now] "modify"

proc modify {} {
	global a

	set a [lreplace $a 1 1 9]
	puts $a
}

$ns run

