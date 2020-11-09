; Jubilee 2.1.1 Config File
; drawing inspiration from the Railcore 300ZL config file

; Name and Identification
M550 P"Cubilee"                         ; Machine name and Netbios name

; Networking
M552 P192.168.1.2 S1                    ; Use Ethernet with a static IP
M554 192.168.1.3                        ; Gateway
M553 P255.255.255.0                     ; Netmask
M586 P2 S1                              ; Enable Telnet

; Debugging
M111 S0                                 ; Debug off
M929 P"eventlog.txt" S1                 ; Start logging to file eventlog.txt

; General Preferences
M555 P2                                 ; Set Marlin-style output
G21                                     ; Set dimensions to millimetres
G90                                     ; Send absolute coordinates...
M83                                     ; ...but relative extruder moves

; Joints
M584 X0 Y1 Z6:7:8 E3:4:5:9 U2   ; Map Z to drives 6, 7, 8. Map extruders to 3 and 4. Create Toolchanger Lock axis.

M569 P0 S0                  ; Drive 0 direction | X stepper
M569 P1 S0                  ; Drive 1 direction | Y Stepper

M569 P6 S0                  ; Drive 6 direction | Front Left Z
M569 P7 S0                  ; Drive 7 direction | Front Right Z
M569 P8 S0                  ; Drive 8 direction | Back Z

M569 P2 S0                  ; Drive 2 direction | Toolchanger Actuator

M569 P3 S0 D2               ; Drive 3 direction | Extruder 0 in SpreadCycle Mode
M569 P4 S0 D2               ; Drive 4 direction | Extruder 1 in SpreadCycle Mode


; Joint Kinematics
M669 K1                                 ; CoreXY mode

; Kinematic bed ball locations. Locations are extracted from CAD model assuming:
;   300x300mm build region offset evenly from the 305x305mm plate.
;   back right corner of build region is (0, 0).
M671 X297:2.5:150 Y313.5:313.5:-16.5 S10 ; Front Left: (297.5, 313.5) | Front Right: (2.5, 313.5) | Back: (150, -16.5)


; Axis and Motor Configuration
M350 X16 Y16 Z16 E16 U4 I1              ; Set 16x microstepping for xyz axes & extruder, 4x for toolchanger lock. Use interpolation.
M574 X1 Y1 Z1 S1                        ; Set homing switch configuration x low-end, y low-end, z low-end, all active-high (NC)
M574 U1 S1                              ; Set homing switch configuration for toolchange lock. Both switches should be wired NC and in series.

M906 X2263 Y2263                        ; LDO XY motor currents (mA). 2263mA is 80% of 2828mA Peak Current. (2828mA Peak is 2000mA RMS)
                                        ; Do not exceed 90% of full XY motor current rating without heatsinking the XY motor drivers.
;M906 X1900 Y1900                       ; StepperOnline XY motor currents (mA)
M906 Z1600                              ; LDO ZZZ Motor currents (mA). Conservative.
;M906 Z1750                             ; StepperOnline ZZZ motor currents (mA)

M906 E1250                              ; Motor currents E (mA)

M906 U670 I60                           ; LDO Toolchanger Elastic Lock motor current (mA) and idle motor percentage.
;M906 U900 I60                          ; StepperOnline Toolchanger Elastic Lock motor current (mA) and idle motor percentage
                                        ; Note: Idle current setting is common across all motors (XYZZZU).

M201 X1000 Y1000                        ; XY Acceleration. Conservative. 1500+ possible.
M201 Z100                               ; LDO ZZZ Acceleration
;M201 Z100                               ; StepperOnline Z Acceleration
M201 E1300                              ; E Acceleration
M201 U800                               ; LDO U Accelerations (mm/s^2) conservative

M203 X13000 Y13000 Z800 E8000 U9000     ; Maximum speeds (mm/min) conservative. 18000+ possible on XY. Depends on tool.
M566 X1000 Y1000 Z500 E3000 U50          ; Maximum jerk speeds mm/minute

M92 X200 Y200                           ; Steps/mm for X,Y

M92 U30.578                             ; Steps/deg for U from (200 * 4 * 13.76)/360
M92 Z3200                               ; Steps/mm for Z for a T8x2 leadscrew and 0.9mm stepper. (16 * 400)/2
;M92 Z1600                               ; Steps/mm for Z for a T8x4 leadscrew and 0.9mm stepper. (16 * 400)/4
M92 E830                                ; Extruder - 0.9 deg/step

; Set axis software limits and min/max switch-triggering positions.
; Adjusted such that (0,0) lies at the upper right corner of a 300x300mm square in the 305mmx305mm build plate.
M208 X-13.75:313.75 Y-44:341 Z-0.2:305
M208 U0:200                                 ; Set Elastic Lock (U axis) max rotation angle

; Thermistors
M305 P0 S"Bed" T10000 B3435 H0                ; BOM-specified Adjusted Terminal Lug Thermistor values.
;M305 P0 S"Bed" T10000 B3984 H0 L160          ; BOM-specified Terminal Lug Thermistor values.
;M305 P0 S"Bed" T100000 B3950 R4700 H0 L0    ; Built-in Keenovo Bed Thermistor values.

; PT100 Hotend Temperature Sensors. These require an external Breakout Board. For other configs, see the wiki:
; https://jubilee3d.com/index.php?title=Bondtech_Direct_Drive_Extruder 
M305 P1 X200                                ; Map Extruder 0 sensor to PT100 Channel 0
M305 P2 X201                                ; Map Extruder 1 sensor to PT100 Channel 1

;Heaters
M570 S30                                    ; Print will be terminated if a heater fault is not reset within 30 minutes.
M143 H0 S100                                ; Maximum H0 (Bed) heater temperature
;M143 H1 S260                                ; Maximum H1 (Extruder) heater temperature

; Default heater model
M307 H0 A270.7 C90.4 D6.7 B0 S1.0           ; Default Bed Heater Parameters, before tuning / if config-override.g is missing

; Tool definitions
M563 P0 S"Extruder 0" D0 H1 F0          ; Define tool 0
G10 P0 X-4.5 Y44.02 Z-5.62              ; Set tool 0 offset from the bed
G10 P0 S190 R170                        ; Set tool 0 operating and standby temperatures(-273 = "off")
M572 D0 S0.1				; Set pressure advance on Extruder Drive 0

M563 P1 S"Extruder 1" D1 H2 F2          ; Define tool 1
G10 P1 X-4.23 Y45.60 Z-2.51             ; Set tool 1 offset from the bed with tool-0 as a reference.
G10 P1 S190 R170                        ; Set tool 1 operating and standby temperatures(-273 = "off")
M572 D1 S0.1                            ; Set pressure advance on Extruder Drive 1

; Fans
M106 P0 S0                               ; Turn off fan 0
;M106 P1 S0                               ; Turn off fan 1

;Mesh Bed Leveling Settings:
M557 X10:290 Y10:290 P6

; Z probing settings
M558 P4 C2 H5 A1 T10000  S0.02
; P4 --> probe type: switch
; C2 --> endstop number
; H5 --> dive height
; A1 --> max number of times to probe
; T100000 --> travel speed between probe points
; S0.02 --> tolerance when probing multiple times

M593 F33.33  ; Reduce resonances at 33Hz based on XY vibration pattern on prints. This value could use a second opinion.

M98 P"config-user.g"                    ; Load custom user config

M501                                    ; Load saved parameters from non-volatile memory