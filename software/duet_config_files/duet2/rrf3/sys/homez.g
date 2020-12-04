; Home Z Axis

; In case homez.g is called in isolation, ensure 
; (1) U axis is homed (which performs tool detection and sets machine tool state to a known state) and 
; (2) X&Y axis is homed (to prevent collisions with the tool posts)
; (3) No tools are loaded.
; (4) Endstop is not already triggered (in case of damaged endstop)
; Ask for user-intervention if any case fails.

if !move.axes[3].homed
  M291 R"Cannot Home Z" P"U axis must be homed before Z to prevent damage to tool. Press OK to home U or Cancel to abort" S3
  G28 U

; RRF3 does not permit Z homing without x&y being homed first. Popup window for convenience.
if !move.axes[0].homed || !move.axes[1].homed
  M291 R"Cannot Home Z" P"X&Y Axes must be homed before Z for probing. Press OK to home X&Y or Cancel to abort" S3
  G28 Y X

if state.currentTool != -1
  M84 U
  M291 R"Cannot Home Z" P"Tool must be deselected before homing. U has been unlocked, please manually dock tool and press OK to continue or Cancel to abort" S3
  G28 U

if sensors.probes[0].value[0] != 0
  M291 R"Cannot Home Z" P"Z Probe is already triggered!" S2
  abort "Z Probe was triggered before homing."

M561 ; Disable any Mesh Bed Compensation
G90 G1 X150 Y150 F10000 ; Move to the center of the bed
M558 F500 ; Set the probing speed
G30
M558 F50 ; Set a slower probing speed
G30
G32                         ; Run 3-point bed calibration defined in bed.g
G1 X0 Y0 F10000
G29 S1   ; Enable Mesh Bed Compensation
