; Machine Prechecks
M84
M291 R"Machine Prechecks" P"Please move printhead to center of bed, and bed to middle height, and tool changer axis to middle." S3


; Endstop Checks
M291 R"Endstop Checks" P"Walk through each endstop and make sure it's detected and wired properly" S3

; Prechecks
if sensors.endstops[0].triggered
  M291 R"X Axis Error" P"X Endstop is already triggered! Either it's depressed, wired wrong, or broken." S3
if sensors.endstops[1].triggered
  M291 R"Y Axis Error" P"Y Endstop is already triggered! Either it's depressed, wired wrong, or broken." S3
if sensors.probes[0].value[0] != 0
  M291 R"Z Axis Error" P"Z Probe is already triggered! Either it's depressed, wired wrong, or broken." S3
if sensors.endstops[3].triggered
  M291 R"U Axis Error" P"U Endstop is already triggered! Either it's depressed, wired wrong, or broken." S3

; X
echo "Please depress X endstop for 1s"
M577 X S1
echo "X endstop test passed"

; Y
echo "Please depress Y endstop for 1s"
M577 Y S1
echo "Y endstop test passed"

; Z
echo "Please depress Z probe for 1s"
while sensors.probes[0].value[0] == 0
  G4 P500
echo "Z probe test passed"

; U
echo "Rotate U axis to minimum"
M577 U S1
echo "Rotate U Axis to maximum (*insert spring stretch explanation)"
M577 U S0
M577 U S1
echo "U endstop test passed"

M291 R"Endstop Checks" P"All endstop checks passed!" S3


; Motor Dir Checks
M291 R"Motor Direction Checks" P"Walk through each motor to ensure it spins in the correct direction" S3

; XY1 (A)
M291 R"Motor A Check" P"Rear right motor should rotate clockwise for 6s after pressing OK" S3
G91 G1 X-30 H2 F300
M291 R"Motor A Check" P"If motor turned clockwise, press OK, otherwise, in config.g change S from 0->1 or 1->0 for X Axis Motor" S3

; XY2 (B)
M291 R"Motor B Check" P"Rear left motor should rotate clockwise for 6s after pressing OK" S3
G91 G1 Y-30 H2 F300
M291 R"Motor B Check" P"If motor turned clockwise, press OK, otherwise, in config.g change S from 0->1 or 1->0 for Y Axis Motor" S3

; Z
M291 R"Motor Z Check" P"All Z motors should rotate clockwise for 6s after pressing OK" S3
G91 G1 Z-10 H2 F100
M291 R"Motor Z Check" P"For any motor that turned counterclockwise, in config.g change S from 0->1 or 1->0 for Z Motor" S3

; U
M291 R"Motor U Check" P"Rotate U motor to minimum, motor should rotate COUNTERclockwise for 6s after pressing OK" S3
G91 G1 U30 H2 F300
M291 R"Motor U Check" P"If motor turned COUNTERclockwise, press OK, otherwise, in config.g change S from 0->1 or 1->0 for Toolchanger Actuator" S3

M291 R"Motor Direction Checks" P"All motor direction checks passed!" S3


; Steps/mm Checks

