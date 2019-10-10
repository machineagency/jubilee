; Pause macro file
M83					; relative extruder moves
G1 E-3 F2500		; retract 4mm
G91					; relative moves
G1 Z30 F5000			; raise nozzle 2mm
G90					; absolute moves
G1 X305 Y85 F5000		; move head out of the way of the print
