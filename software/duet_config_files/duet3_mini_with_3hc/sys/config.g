; Jubilee CoreXY ToolChanging Printer - Config File
; This file is intended for a Duet 3 Mini Mainboard + one 3HC expansion board.

; Name and Network
;-------------------------------------------------------------------------------
M550 P"Jubilee"           ; Name used in UI and for mDNS  http://Jubilee.local
; Networking handled by Duet.
; Comment out the next three lines only if running the Duet in SBC Mode with Pi.
M552 P192.168.1.2 S1      ; Use Ethernet with a static IP, 0.0.0.0 for dhcp
M554 192.168.1.3          ; Gateway
M553 P255.255.255.0       ; Netmask


; General setup
;-------------------------------------------------------------------------------
M111 S0                    ; Debug off 
M929 P"eventlog.txt" S1    ; Start logging to file eventlog.txt

; General Preferences
M555 P2                    ; Set Marlin-style output
G21                        ; Set dimensions to millimetres
G90                        ; Send absolute coordinates...
M83                        ; ...but relative extruder moves


; Motor (Drive) to Axis Mapping
;-------------------------------------------------------------------------------
M584 X1.0 Y1.1            ; Map Corexy's X,Y axes to 3HC board port's 0 and 1. 
M584 U0.1                 ; Map U axis (toolchanger lock) do main board port 1.
M584 Z0.2:0.3:0.4         ; Map 3 axes for Z to main board ports 2, 3, and 4.


; Motor (Drive) Currents and Directions
;-------------------------------------------------------------------------------
M569 P1.0 S0              ; Flip 3HC Motor 0 (corexy a) direction
M569 P1.1 S0              ; Flip 3HC Motor 1 (corexy b) direction
M906 X{0.85*sqrt(2)*2500} ; LDO XY 2500mA RMS the TMC5160 driver on duet3
M906 Y{0.85*sqrt(2)*2500} ; generates a sinusoidal coil current so we can 
                          ; multply by sqrt(2) to get peak used for M906
                          ; Do not exceed 90% without heatsinking the XY 
                          ; steppers.
                                            
M569 P0.2 S0              ; Flip Mainboard Motor 2 (Front Left Z) direction.
M569 P0.3 S0              ; Flip Mainboard Motor 2 (Front Right Z) direction.
M569 P0.4 S0              ; Flip Mainboard Motor 2 (Back Z) direction.
M906 Z{0.7*sqrt(2)*1680}  ; 70% of 1680mA RMS current.

M569 P0.1 S0              ; Flip Main Board Motor 0 (toolchanger) directon.
M906 U670 I60             ; 100% of 670mA RMS current. idle 60%.
                          ; Note that the idle will be shared for all drivers.


; Kinematics
;-------------------------------------------------------------------------------
M669 K1                   ; CoreXY mode

; Kinematic bed ball locations.
; Locations are extracted from CAD model assuming lower left build plate corner
; is (0, 0) on a 305x305mm plate.
M671 X297.5:2.5:150 Y313.5:313.5:-16.5 S10 ; Front Left: (297.5, 313.5)
                                           ; Front Right: (2.5, 313.5)
                                           ; Back: (150, -16.5)
                                           ; Set up to 10mm correction.


; Steps/<unit> Configuration
; XYZZZ are in steps/mm. U is in steps/degree. 
;-------------------------------------------------------------------------------

M350 X1 Y1 Z1 U1       ; Disable microstepping to simplify calculations.
M92 X{1/(1.8*16/180)}  ; step angle * tooth count / 180 .
M92 Y{1/(1.8*16/180)}  ; The 2mm tooth spacing cancel out with diam to radius.
M92 Z{360/0.9/4}       ; 0.9 deg stepper / screw lead pitch (4mm) .
                       ; If using a T8x2 leadscrew, change 4 to 2.
M92 U{13.76/1.8}       ; gear ratio / step angle for tool lock geared motor.

; Enable microstepping.
; All steps-per-unit will be multiplied by the new step definition.
M350 X16 Y16 I1        ; 16x microstepping for CoreXY axes. Use interpolation.
M350 U4 I1             ; 4x for toolchanger lock. Use interpolation.
M350 Z16 I1            ; 16x microstepping for Z axes. Use interpolation.


; Speed and Acceleration
;-------------------------------------------------------------------------------
M201 X1500 Y1500       ; XY accelerations [mm/s^2]
                       ; XY accel can be increased up to 2500 or beyond later.
M201 Z100              ; ZZZ Acceleration
M201 U800              ; U accelerations [deg/s^2]

M203 X18000 Y18000 Z1600 U9000 ; Maximum axis speeds [mm/min]
                               ; If using a T8x2 leadscrew, change Z to 800.
M566 X500 Y500 Z500 U50        ; Maximum jerk speeds [mm/min]


; Endstops and Probes 
;-------------------------------------------------------------------------------
M574 X1 S1 P"^1.io0.in"  ; 3HC X homing position X1 = axis min, S1 = switch type
M574 Y1 S1 P"^1.io1.in"  ; 3HC Y homing position Y1 = axis min, S1 = switch type
M574 U1 S1 P"^0.io1.in"  ; Mainboard U homing position.
                         ; U1 = axis min, S1 = switch type

M574 Z0                  ; Configure z switch as a Z probe, not as an endstop. 
M558 P8 C"io0.in" H3 F360 T6000 ; H = dive height
                                ; F = probe speed
                                ; T = travel speed
G31 K0 X0 Y0 Z-2        ; Set the limit switch as the "Control Point"
                        ; Offset it downwards slightly so we don't smear it along
                        ; the bed while traveling when z=0.

; Set axis software limits and min/max switch-triggering positions.
; Dimensions are adjusted such that (0,0) lies at the lower left corner
; of a centered 300x300mm square in the 305mmx305mm build plate.
M208 X-13.75:313.75 Y-44:341 Z0:300
M208 U0:200            ; Set Elastic Lock (U axis) max rotation angle


; Bed Heater and Temperature Sensor
;-------------------------------------------------------------------------------
; Define Built-in Thermistor Settings
M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed" ; built-in Keenovo thermistor
; Define Heater 0
M950 H0 C"out0" T0      ; H = Heater 0
                        ; C = heater output pin
                        ; T = assigned temperature sensor
M143 H0 S130            ; Set max bed temperature to 130C    
M140 H0                 ; Assign Heater 0 to the bed

; This config requires a heater-tuning procedure to produce a valid M307 command.


M98  P"/sys/toffsets.g" ; Load tool offsets from the Control Point from ext file.
M501                    ; Load saved parameters from config-override.g
