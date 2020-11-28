; Assumes the tool changer is in 1 of 2 possible states.
; 1. No tool attached (U=0), usually the result of the tool being properly parked.
; 2. Tool attached (U=?), usually the result of the machine being powered powered off with a tool still active.
G92 U0 ; Set u axis to 0
G1 U2 H2 F5000 ; Move u axis to 2deg to (1. free endstop) or (2. tighten down tool slightly)
G1 U170 H1 F5000 ; Move u axis up to 170 deg or until endstop is triggered (1. won't trigger endstop) or (2. will trigger endstop)
if abs(move.axes[3].userPosition - 170) > 1 ; Check if endstop is triggered, occurs if condition 2 is met.
    M84 U ; Release u motor so it can be turned by hand
    M291 R"Intervention Required" P"A tool has been detected! Please remove and return to post." S2 ; Alert user that intervention is required to continue
G28 U ; Home u motor to ensure that G92 doesn't provide a "false-home"

; To run on restart add -> M98 P"/macros/tool_check.g" <- to end of config.gg