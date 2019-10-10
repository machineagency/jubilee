M401 ; deploy z probe
G0 X152.5 Y42 S1 F20000
G30 P0 X152.5 Y42 Z-99999   ; probe near back leadscrew
G0 X295 Y300 S1 F20000
G30 P1 X295 Y300 Z-99999    ; probe near front left leadscrew
G0 X5 Y300 S1 F20000
G30 P2 X5 Y300 Z-99999 S3   ; probe near front right leadscrew and calibrate 3 motors
M402 ; retract z probe
G1 X0 Y0 F20000