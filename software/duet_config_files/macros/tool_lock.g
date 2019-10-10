; Engage the toolchanger lock

G91                 ; Set relative mode
G1 U10 F9000 S0      ; Back off the limit switch with a small move
G1 U360 F9000 S1    ; Perform up to one rotation looking for the torque limit switch
; TODO: read sensors
G90                 ; Set absolute mode
