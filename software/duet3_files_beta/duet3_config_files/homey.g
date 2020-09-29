; Home Y Axis

G91                     ; Set relative mode
;G1 Y-999 F6000 H1		; Big negative move to search for endstop
G1 Y-999 F3500 H1		; Big negative move to search for endstop
G1 Y4 F600				; Back off the endstop
G1 Y-10 F600 H1         ; Find endstop again slowly
G90                     ; Set absolute mode
G1 Y0 F6000