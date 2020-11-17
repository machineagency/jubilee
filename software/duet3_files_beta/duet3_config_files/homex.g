; Home X Axis

G91                     ; Relative mode
G1 H2 Z5 F5000          ; Lower the bed
G1 X-330 F3000 H1       ; Big negative move to search for endstop
G1 X4 F600              ; Back off the endstop
G1 X-10 F600 H1         ; Find endstop again slowly
G1 H2 Z-5 F5000         ; Raise the bed
G90                     ; Set absolute mode
