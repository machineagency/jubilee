; Home U Axis

; Assumes the tool changer is in 1 of 2 possible states.
; 1. No tool attached (U=0), usually the result of the tool being properly parked.
; 2. Tool attached (U=?), usually the result of the machine being powered powered off with a tool still active.

G90                     ; Set absolute mode
G92 U0                  ; Define current position as 0 to enable move without homing
G1 U2 H2 F5000          ; Move the axis 2deg to back it off of the unlocked switch
G1 U120 H1 F5000        ; Move the axis to 120deg, or until it hits an endstop
M400                    ; Wait for the command buffer to drain before checking model

if {abs((move.axes[3].userPosition - 120))} > 1
    M84 U
    M291 R"Intervention Required" P"Please remove the tool, return it to its post, and restore the twist lock to its unlocked (horizontal) position. Press OK to continue..." S3

T-1 P0                  ; Set current tool to none

G91                     ; Set relative mode
G1 U-360 F9000 H1       ; Big negative move to search for home endstop
G1 U6 F600              ; Back off the endstop
G1 U-15 F600 H1         ; Find endstop again slowly
G90                     ; Set absolute mode

