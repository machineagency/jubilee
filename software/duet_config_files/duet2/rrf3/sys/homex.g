; Home X Axis

if !move.axes[3].homed
  M291 R"Cannot Home X" P"U axis must be homed before X to prevent damage to tool. Press OK to home U or Cancel to abort" S3
  G28 U

G91                     ; Set relative mode
G1 X-330 F6000 H1       ; Big negative move to search for endstop
G1 X4 F600              ; Back off the endstop
G1 X-10 F600 H1         ; Find endstop again slowly
G90                     ; Set absolute mode
