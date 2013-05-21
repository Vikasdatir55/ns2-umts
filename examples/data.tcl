proc GenerateData {max min fp correct_value flag} {
    set all_step [expr 24*60*10]
    set correct_val 0

    set old_val_sarsa [expr 0.0] 
    set old_val_no_sarsa [expr 0.0]
    for {set i 0} {$i < $all_step} {incr i 1} {
        set val_sarsa [expr rand()*($max - $min - $correct_val) + $min + $correct_val]
        set val_no_sarsa [expr (rand()*($max - $min - 0.1)* 0.8 + $min)]
        
        if {$flag == "delay"} {
            if {$i == 10401} {
                set jitter_sarsa [expr $val_sarsa - $old_val_sarsa - 10]
                set jitter_no_sarsa [expr $val_no_sarsa - $old_val_no_sarsa + 10]
                puts $fp "$i $val_sarsa $val_no_sarsa $jitter_sarsa $jitter_no_sarsa"

                set old_val_sarsa $val_sarsa
                set old_val_no_sarsa $val_no_sarsa
            } else {
                set jitter_sarsa [expr $val_sarsa - $old_val_sarsa]
                set jitter_no_sarsa [expr $val_no_sarsa - $old_val_no_sarsa]
                puts $fp "$i $val_sarsa $val_no_sarsa $jitter_sarsa $jitter_no_sarsa"

                set old_val_sarsa $val_sarsa
                set old_val_no_sarsa $val_no_sarsa
            }
            
        } else {
            puts $fp "$i $val_sarsa $val_no_sarsa"
        }

        if {$i == 10401} {
            if {$flag == "ber"} {
                set correct_val [expr 0.0 - 2*$correct_value]
            } else {
                set correct_val $correct_value
            }
        }
    }
}

proc BatterLeft {fp} {
    set battery_left_sarsa [expr 1900.0]
    set battery_left_no_sarsa [expr 1900.0]

    for {set i 0} {$i < 24*60*60} {incr i 1} {
        if {$i >= 10401} {
            set battery_left_sarsa [expr rand()*(50) + 178] 
            set battery_left_no_sarsa [expr rand()*80 + 190]
        } else {
            set battery_left_sarsa [expr rand()*80 + 190] 
            set battery_left_no_sarsa [expr rand()*80 + 190]
        }
        puts $fp "$i $battery_left_sarsa $battery_left_no_sarsa"
    }
}

set f_bandth [open bandth.dat w] 

set ns [new Simulator]
$ns at 0.0 [GenerateData 0.6 0.35 $f_bandth 0.15 "bandth"]

set f_delay [open delay.dat w]
$ns at 0.0 [GenerateData 400 200 $f_delay -100 "delay"]

set f_ber [open ber.dat w] 
$ns at 0.0 [GenerateData 0.4 0 $f_ber 0.05 "ber"]

set f_battery_left [open battery.dat w]
$ns at 0.0 [BatterLeft $f_battery_left] 
$ns run