; Home X Axis

if state.currentTool != -1
	abort "Cannot Home With Tool Selected!"

G91                     ; Set relative mode
G1 X-330 F6000 S1       ; Big negative move to search for endstop
G1 X4 F600              ; Back off the endstop
G1 X-10 F600 S1         ; Find endstop again slowly
G90                     ; Set absolute mode
