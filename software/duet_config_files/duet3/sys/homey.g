; Home Y Axis

G91                     ; Set relative mode
G1 H2 Z5 F5000          ; Lower the bed
G1 Y-400 F6000 H1       ; Big negative move to search for endstop
G1 Y4 F600              ; Back off the endstop
G1 Y-10 F600 H1         ; Find endstop again slowly
G1 H2 Z-5 F5000         ; Raise the bed
G90                     ; Set absolute mode
