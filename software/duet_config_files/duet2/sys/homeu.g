; Home U Axis

G91                     ; Set relative mode
G1 U-360 F9000 S1       ; Big negative move to search for home endstop
G1 U6 F600              ; Back off the endstop
G1 U-10 F600 S1         ; Find endstop again slowly
G90                     ; Set absolute mode
