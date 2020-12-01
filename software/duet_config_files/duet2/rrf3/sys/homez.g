; Home Z Axis

if !move.axes[3].homed
  M291 R"Cannot Home Z" P"U axis must be homed before Z to prevent damage to tool. Press OK to home U or Cancel to abort" S3
  G28 U

M561 ; Disable any Mesh Bed Compensation
G90 G1 X150 Y150 F10000 ; Move to the center of the bed
M558 F500 ; Set the probing speed
G30
M558 F50 ; Set a slower probing speed
G30
G32                         ; Run 3-point bed calibration defined in bed.g
G1 X0 Y0 F10000
G29 S1   ; Enable Mesh Bed Compensation
