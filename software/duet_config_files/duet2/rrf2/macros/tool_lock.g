; Engage the toolchanger lock. RepRap Firmware V2.0.1 version.
G91                 ; Set relative mode
G1 U10 F5000 S0      ; Back off the limit switch with a small move
G1 U200 Y0.5 F5000 S1    ; Perform up to one rotation looking for the torque limit switch
G90                 ; Set absolute mode
