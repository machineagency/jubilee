; Home Z Axis

G90 G1 X150 Y150 F10000 ; Move to the center of the bed
M558 F500 ; Set the probing speed
G30
M558 F50 ; Set a slower probing speed
G30
G32                         ; Run 3-point bed calibration defined in bed.g

