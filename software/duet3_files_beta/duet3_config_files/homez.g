; Home Z Axis

M290 R0 S0              ; Reset baby stepping
M561                    ; Disable any Mesh Bed Compensation

G91                     ; Relative mode
G1 H2 Z5 F5000          ; Lower the bed
G90                     ; back to absolute positioning

G90 G1 X150 Y130 F10000 ; Move to the center of the bed -20mm to not probe on
                        ; top of the mandal rose bed magnet skrew head

M558 F500               ; Set the probing speed
G30                     ; Probe
M558 F50                ; Set a slower probing speed
G30                     ; Prob
G32                     ; Run 3-point bed calibration defined in bed.g
G29 S1                  ; Enable Mesh Bed Compensation

