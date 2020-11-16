; Home U Axis

G91                     ; Set relative mode
;G1 U-360 F9000 H1		; Big negative move to search for home endstop
G1 U-360 F900 H1		; Big negative move to search for home endstop
G1 U6 F600              ; Back off the endstop
G1 U-10 F600 H1         ; Find endstop again slowly
G90                     ; Set absolute mode
