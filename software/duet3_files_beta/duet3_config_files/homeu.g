	; Home X Axis

	G91                     ; Set relative mode
	;G1 X-999 F6000 H1       ; Big negative move to search for endstop
	G1 X-999 F3000 H1       ; Big negative move to search for endstop
	G1 X4 F600              ; Back off the endstop
	G1 X-10 F600 H1         ; Find endstop again slowly
	G90                     ; Set absolute mode
	G1 X0 F6000