; Jubilee 2.2.0 Config File for RepRapFirmware 3

; Name and Identification
M550 P"Jubilee"                         ; Machine name and Netbios name

; Networking. For more info on this connection setup, see:
; https://jubilee3d.com/index.php?title=Connecting_to_Jubilee
M552 P192.168.1.2 S1                    ; Use Ethernet with a static IP
M554 192.168.1.3                        ; Gateway
M553 P255.255.255.0                     ; Netmask
M586 P1 S1                              ; Enable FTP
M586 P2 S1                              ; Enable Telnet

; Debugging
M111 S0                                 ; Debug off
M929 P"eventlog.txt" S1                 ; Start logging to file eventlog.txt

; General Preferences
M555 P2                                 ; Set Marlin-style output
G21                                     ; Set dimensions to millimetres
G90                                     ; Send absolute coordinates...
M83                                     ; ...but relative extruder moves

; Motor Drives
M584 X0 Y1 Z6:7:8 E3:4 U2   ; Map Z to drivers 6, 7, 8. Map extruders to 3 and 4. Create Toolchanger Lock axis.

M569 P0 S0                  ; Drive 0 direction | X stepper
M569 P1 S0                  ; Drive 1 direction | Y Stepper

M569 P6 S0                  ; Drive 6 direction | Front Left Z
M569 P7 S0                  ; Drive 7 direction | Front Right Z
M569 P8 S0                  ; Drive 8 direction | Back Z

M569 P2 S0                  ; Drive 2 direction | Toolchanger Actuator

M569 P3 S0 D2               ; Drive 3 direction | Extruder 0 in Spreadcycle Mode
M569 P4 S0 D2               ; Drive 4 direction | Extruder 1 in Spreadcycle Mode

; Joint Kinematics
M669 K1                                 ; CoreXY mode

; Kinematic bed ball locations.
; Locations are extracted from CAD model assuming lower left build plate corner is (0, 0) on a 305x305mm plate.
M671 X297.5:2.5:150 Y313.5:313.5:-16.5 S10 ; Front Left: (297.5, 313.5) | Front Right: (2.5, 313.5) | Back: (150, -16.5)


; XYZUE Axis Configuration
M350 X16 Y16 Z16 E16 U4 I1              ; Set 16x microstepping for xyz axes & extruder, 4x for toolchanger lock. Use interpolation.

M906 X2405 Y2405                        ; Motor currents XY (mA). 2405mA is 85% of 2828mA Peak current. (2828mA peak is 2000mA RMS)
M906 Z1600                              ; LDO ZZZ Motor Currents (mA).
M906 U670 I60                           ; (Default) LDO-28STH32-0674APG14 Toolchanger Lock motor current (mA) and idle motor percentage.
;M906 U540 I60                           ; (Alternate) LDO-28STH51-0674APG14 Toolchanger Lock motor current (mA) and idle motor percentage.
;M906 U900 I60                           ; (Old) 14HS13-0804S-PG5 StepperOnline Toolchanger Lock motor current (mA) and idle motor percentage
                                        ; Note: Idle current setting is common across all motors (XYZZZU).

M201 X1200 Y1200                        ; XY Accelerations (mm/s^2). (Can be bumped up to 2000+)
M201 Z100                               ; ZZZ Acceleration
M201 U800                               ; U Accelerations (mm/s^2)

M203 X18000 Y18000 E8000 U9000          ; Maximum X, Y, E, U axis speeds (mm/min)
M203 Z800                               ; Maximum Z axis speed with T8x2 leadscrew and 0.9mm stepper
;M203 Z1600                              ; Maximum Z axis speed with T8x4 leadscrew and 0.9mm stepper
M566 X1000 Y1000 Z500 E3000 U50         ; Maximum jerk speeds (mm/min)

M92 X200 Y200                           ; Steps/mm for X,Y for 16x microstepping & 16T pulley
;M92 Z3200                               ; Steps/mm for Z with a T8x2 leadscrew and 0.9mm stepper. (16 * 400)/2
M92 Z1600                               ; Steps/mm for Z with a T8x4 leadscrew and 0.9mm stepper. (16 * 400)/4
M92 U30.578                             ; Steps/deg for U from (200 * 4 * 13.76)/360

; Set axis software limits and min/max switch-triggering positions.
; Adjusted such that (0,0) lies at the lower left corner of a 300x300mm square in the 305mmx305mm build plate.
M208 X-13.75:313.75 Y-44:341 Z-0.2:305
M208 U0:200                                 ; Set Elastic Lock (U axis) max rotation angle

; Machine Thermistors
M308 S0 S"bed_temp" T100000 B3950 R4700 ; Define built-in Keenovo Bed Thermistor values.
;M308 S0 P"bed_temp" Y"thermistor" T10000 B3435 ; Define BOM-specified replaceable bed thermistor (with adjusted B value)
M308 S4 Y"drivers" A"DRIVERS"           ; Define sensor 4 as temperature warning and overheat flags on the TMC2660 on Duet
M308 S5 Y"mcu-temp" A"MCU"              ; Define sensor 5 as thermistor on pin e1temp for left stepper

; Machine Heaters
M570 S30                                    ; Print will be terminated if a heater fault is not reset within 30 minutes.
M950 H0 C"bed_heat" T0 						 ; heater 0 uses the bed_heat pin, sensor 0
M140 H0										 ; the bed heater is heater 0
M143 H0 S100                                 ; Maximum H0 (Bed) heater temperature

;Settings for running a mesh bed leveling procedure:
M557 X10:290 Y10:290 P6

; Machine Switches
M574 X1 S1 P"^xstop"   ; X min active high endstop switch
M574 Y1 S1 P"^ystop"   ; Y min active high endstop switch
M574 Z1 S1 P"^zstop"   ; Z min active high endstop switch
M574 U1 S1 P"^e0stop"  ; U "min/max" active high endstop switch

; Z probing settings
M574 Z0 P"nil" ; no Z endstop switch, free up Z endstop input
M558 P5 C"^zstop" H5 A1 T10000 S0.02; Z probe connected to Z endstop input
; P5 --> probe type: switch
; C2 --> endstop number
; H5 --> dive height
; A1 --> max number of times to probe
; T100000 --> travel speed between probe points
; S0.02 --> tolerance when probing multiple times
G31 K0 X0 Y0 Z0 ; Zero out default RRF 0.7mm z offset on probe 0


; Definitions for Components of 2x Extruders
M906 E1250:1250                         ; Motor currents (mA) for both extruders drives
M201 E1300:1250                         ; E Acceleration (mm/s^2)
M203 E8000:8000                         ; Maximum axis speeds (mm/min)
M566 E3000:3000                         ; Maximum jerk speeds (mm/min)
M92 E830:830                            ; BMG Extruder - 0.9 deg/step Tool0:Tool1
M308 S1 P"spi.cs1" Y"rtd-max31865"      ; define PT100-style E0 temperature sensor
M308 S2 P"spi.cs2" Y"rtd-max31865"      ; define PT100-style E1 temperature sensor
;M308 S1 P"e0_temp" Y"pt1000"           ; define PT1000-style E0 temperature sensor
;M308 S2 P"e1_temp" Y"pt1000"           ; define PT1000-style E1 temperature sensor
M143 H1 S260                            ; Maximum H1 (Extruder 0) heater temperature
M143 H2 S260                            ; Maximum H2 (Extruder 1) heater temperature
M950 F0	C"fan0"                         ; Fan 0, part cooler fan on Tool 0
M950 F1 C"fan1"                         ; Fan 1, part cooler fan on Tool 1
M950 H1 C"e0_heat" T1                   ; heater 1 uses the e0_heat pin and sensor 1
M950 H2 C"e1_heat" T2                   ; heater 2 uses the e1_heat pin and sensor 2

M563 P0 S"Extruder 0" D0 H1 F0          ; Define tool 0. Group drive, heater, and part fan.
G10 P0 X-4.5 Y44.02 Z-5.16              ; Set tool 1 XYZ offset from the Control Point (Z Probe).
                                        ; XYZ Offsets are unique to your machine.
G10 P0 S210 R190                        ; Set tool 0 operating and standby temperatures(-273 = "off")
M572 D0 S0.05                           ; Set pressure advance on Extruder Drive 0
; Note: Hotend fan is plugged into always-on port

M563 P1 S"Extruder 1" D1 H2 F1          ; Define tool 1. Group drive, heater, and part fan.
G10 P1 X-5.36 Y44.7 Z-2.22              ; Set tool 1 XYZ offset from the Control Point (Z Probe)
                                        ; XYZ Offsets are unique to your machine.
G10 P1 S210 R210                        ; Set tool 1 operating and standby temperatures(-273 = "off")
M572 D1 S0.025                          ; Set pressure advance on Extruder Drive 1
; Note: Hotend fan is plugged into always-on port


M593 P1 F27  ; ZVD input shaper at 27Hz (RRF 3.3+)

M501                                    ; Load saved parameters from non-volatile memory
