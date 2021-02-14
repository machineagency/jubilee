; Home Y Axis

; In case homey.g is called in isolation, ensure
; (1) Endstop is not already triggered (in case of damaged endstop)
; Ask for user-intervention if any case fails.

if sensors.endstops[1].triggered
  M291 "Cannot Home Y" P"Y Endstop is already triggered!" S2
  abort "Y Endstop was triggered before homing."

G91                     ; Set relative mode
G1 Y-400 F6000 H1       ; Big negative move to search for endstop
G1 Y4 F600              ; Back off the endstop
G1 Y-10 F600 H1         ; Find endstop again slowly
G90                     ; Set absolute mode
