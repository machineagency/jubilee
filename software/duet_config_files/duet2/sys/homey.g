; Home Y Axis

G91                     ; Set relative mode
G1 Y-360 F6000 S1       ; Big negative move to search for endstop
G1 Y4 F600              ; Back off the endstop
G1 Y-10 F600 S1         ; Find endstop again slowly
G90                     ; Set absolute mode
