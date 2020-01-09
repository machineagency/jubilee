G31 Y-43.5 ; Set Probe offset relative to approximate default extruder nozzle location.
G30 P0 X152.5 Y10 Z-99999   ; probe near back leadscrew
G30 P1 X295 Y295 Z-99999    ; probe near front left leadscrew
G30 P2 X5 Y295 Z-99999 S3   ; probe near front right leadscrew and calibrate 3 motors
G1 X0 Y0 F20000