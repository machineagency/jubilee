; Home Y Axis

G91                     ; Set relative mode
G1 Y-386 F6000 H1       ; Big negative move to search for endstop
G1 Y4 F600              ; Back off the endstop
G1 Y-10 F600 H1         ; Find endstop again slowly
G1 Y2 G600              ; Relieve strain from endstop
G90                     ; Set absolute mode
