	; Jubilee CoreXY ToolChanging Printer - Config File
	; This file intended for Duet 3 hardware, main board plus two expansion boards
	; As of 4/08/2020 INCOMPLETE AND ONLY PARTIALLY TESTED.  See the discord for more info. 

	; Name and Identification
	; Printer name is now set on the R Pi. 


; Communication and general -------------------------------------------------------------------------------------------------------------------------------------
	; Networking
	;;;M552 P192.168.1.2 S1						; Use Ethernet with a static IP
	;;;M553 P255.255.255.0						; Netmask
	;;;M554 192.168.1.3							; Gateway
	M586 P1 S1									; Enable FTP
	M586 P2 S1									; Enable Telnet

	; Debugging
	M111 S0										; Debug off
	M929 P"eventlog.txt" S1						; Start logging to file eventlog.txt

	; General Preferences
	M555 P2										; Set Marlin-style output
	G21											; Set dimensions to millimetres
	G90											; Send absolute coordinates...
	M83											; ...but relative extruder moves



; Axis to driver mapping -----------------------------------------------------------------------------------------------------------------------------------------
	M584 X1 Y0 U2 Z3:4:5						; X and Y for CoreXY.  U for toolchanger lock. Z has three drivers for kinematic bed suspension. 
	;M584 E1.0:1.1:2.0:2.1						; Extruders for four tools. 
    M584 E1.0:1.1								; Extruders for two tools. 

	M569 P0 S1									; Drive 0 | X stepper
	M569 P1 S1									; Drive 1 | Y Stepper
	M569 P2 S1									; Drive 2 | U Tool Changer Lock
	M569 P3 S1									; Drive 3 | Front Left Z
	M569 P4 S1									; Drive 4 | Front Right Z
	M569 P5 S1									; Drive 5 | Back Z
	
	; End of main board drivers.  Expansion boards have three each.
	; Expansion 0
	M569 P6 S0									; Drive 6 | Extruder T0
	M569 P7 S0									; Drive 7 | Extruder T1
	
	; Expansion 1
	;M569 P8 S0									; Drive 8 | Extruder T2
	;M569 P9 S0									; Drive 9 | Extruder T3



; Kinematics -----------------------------------------------------------------------------------------------------------------------------------------------------
	M669 K1										; CoreXY mode

	; Kinematic bed ball locations.
	; Locations are extracted from CAD model assuming lower left build plate corner is (0, 0) on a 305x305mm plate.
	M671 X297:2.5:150 Y313.5:313.5:-16.5 S10 ; Front Left: (297.5, 313.5) | Front Right: (2.5, 313.5) | Back: (150, -16.5)



; Axis and motor configuration -----------------------------------------------------------------------------------------------------------------------------------
	M350 X16 Y16 I1								; Set 16x microstepping for CoreXY axes. Use interpolation.
	M350 U4 I1									; Set 4x for toolchanger lock. Use interpolation.
	M350 Z16 I1									; Set 16x microstepping for Z axes. Use interpolation.
	M350 E16 I1									; Set 16x microstepping for Extruder axes. Use interpolation.

	M906 X1900 Y1900 Z1700 E1330 I30			; Motor currents (mA) and Idle percentage
	M906 U1100 I40								; Motor currents (mA) and Idle percentage
	M201 X1000 Y1000 Z50 E1300 U1000			; Accelerations (mm/s^2)
	M203 X13000 Y13000 Z800 E8000 U10000		; Maximum speeds (mm/min)
	M566 X1000 Y1000 Z150 E3000 U200			; Maximum jerk speeds mm/minute

	M92 X200 Y200								; Steps/mm for X,Y with 16 tooth pulleys (preferred). 
	M92 Z3200									; Steps/mm for Z - TR8*4 / 0.9 deg stepper
	M92 U11.429									; Steps/mm for tool lock geared motor. 
	M92 E400									; Extruder - 0.9 deg/step



; Endstops and probes --------------------------------------------------------------------------------------------------------------------------------------------
	M574 U1 S1 P"io0.in"						; Set homing switch configuration U1 = low-end, S1 = active-high (NC)
	M574 X1 S1 P"io1.in"						; Set homing switch configuration X1 = low-end, S1 = active-high (NC)
	M574 Y1 S1 P"io2.in"						; Set homing switch configuration Y1 = low-end, S1 = active-high (NC)

	M558 P5 C"io4.in" H3 A1 T6000 S0.02
	;M558 K0 P5 C"io4.in" H5 A5 T6000 S0.02		; Z probe - Set the height of the bed when homing G28.  Combined with content of bed.g as invoked by G32, levels bed. Also used for Mesh. 
												; P5 = Switch, NC
												; C  = Input Connector
												; Hn = dive height
												;   A bigger dive height prevents a situation where the bed is out of alignment by more than the dive height
												;   on any corner, which can crash the hot-end into the bed while moving the head in XY.
												;   Probing speed and travel speed are similarly reduced in case the Z probe isn't connected properly (or
												;   disconnects later after moving to a point) giving the user more time to stop.
												; An = Number of times to probe each point. 
												; Tnnn = Travel speed between probe points. 
												; Snnn = Tolerance when probing multiple times. Two readings inside this window and we move on. 
	;M558 K1 P5 C"!io4.in"                   	; create probe #1 for use with M585, active low


	; Set axis software limits and min/max switch-triggering positions.
	; Adjusted such that (0,0) lies at the lower left corner of a 300x300mm square in the 305mmx305mm build plate.
	M208 X-11.5:311.5 Y-44:341 Z-0.2:315
	M208 U0:200									; Set Elastic Lock (U axis) max rotation angle



; Thermistors and heaters ---------------------------------------------------------------------------------------------------------------------------------------
	; ***Temperature sensors***
	; Main Board
	M308 S0 P"0.temp0" Y"thermistor" T100000 B3950 A"Bed"		; Silicone Pad
	M308 S5 P"0.temp1" Y"thermistor" T10850 B2900 A"BedT"		; Theramal Lug these are not factory but calibrated so that the lug displays bed temp
																; based on measurements with IR from 19.5c-60c (currently only monitored)

	; Expansion 0
	M308 S1 P"1.temp0" Y"pt1000" A"HE1"							; Configure extruder 1 temperature sensor - PT1000 sensor
	M308 S2 P"1.temp1" Y"thermistor" T100000 B3950 A"HE2"
	
	; Expansion 1
	;M308 S3 P"2.temp0" Y"thermistor" T100000 B3950 A"HE3"
	;M308 S4 P"2.temp1" Y"thermistor" T100000 B3950 A"HE4"


	; ***Heaters***
	; Main Board
	M950 H0 C"0.out0" T0						; Bed.  H = Heater 0, C is output for heater itself, T = Temperature sensor (defined above)
	
	; Expansion 0
	M950 H1 C"1.out0" T1						; Heater for extruder out tool 0
	M950 H2 C"1.out1" T2						; Heater for extruder out tool 1
	
	; Expansion 1
	;M950 H3 C"2.out0" T3						; Heater for extruder out tool 2
	;M950 H4 C"2.out1" T4						; Heater for extruder out tool 3


	;*** Max Temp ***
	; Main Board
	M143 H0 S130								; Set maximum temperature for bed to 130C
	
	; Expansion 0
	M143 H1 S300								; Set maximum temperature for hotend to 300C
	M143 H2 S300								; Set maximum temperature for hotend to 300C
	
	; Expansion 1
	;M143 H3 S300								; Set maximum temperature for hotend to 300C
	;M143 H4 S300								; Set maximum temperature for hotend to 300C	
	
	
	; ***Further setup for bed***
	M140 H0										; map heated bed to heater 0

	; Calibration 3 April 2020 Note, Duet 3.0 with ras pi you cannot save the parameters automtically need to manually put them in config
	M307 H0 A413.3 C806.5 D0.8 S1.0 V24.5 B0	; Tuned Bed Heater Paramaters, disable bang-bang mode for the bed heater and set PWM limit



; Fans -------------------------------------------------------------------------------------------------------------------------------------------------------
	; ***Fans for hot end cooling***
	; Expansion 0
	M950 F1 C"1.out6"
	M106 P1 S255 H1 T45							; S = Speed of fan Px, Hxx = heater for thermo mode, T = temps for thermo mode.
	M950 F2 C"1.out7"
	M106 P2 S255 H2 T45							; S = Speed of fan Px, Hxx = heater for thermo mode, T = temps for thermo mode.
	
	; Expansion 1
	;M950 F3 C"2.out6"
	;M106 P3 S255 H3 T45						; S = Speed of fan Px, Hxx = heater for thermo mode, T = temps for thermo mode.
	;M950 F4 C"2.out7"
	;M106 P4 S255 H4 T45						; S = Speed of fan Px, Hxx = heater for thermo mode, T = temps for thermo mode.


	; ***Fans for print cooling***
	; Expansion 0
	M950 F5 C"1.out3" 
	M106 P5 C"PrintCool5"
	M950 F6 C"1.out4" 
	M106 P6 C"PrintCool6"
	
	; Expansion 0
	;M950 F7 C"2.out3" 
	;M106 P7 C"PrintCool7"
	;M950 F8 C"2.out4" 
	;M106 P8 C"PrintCool8"



; Tool definitions --------------------------------------------------------------------------------------------------------------------------------------------
	; Expansion 0
	M563 P0 S"Tool 0" D0 H1 F5					; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), H1 = Heater Number, Fx = Fan number print cooling fan
	G10  P0 S0 R0								; Set tool 0 operating and standby temperatures(-273 = "off")
	M572 D0 S0.025								; Set pressure advance on Hemera

	M563 P1 S"Tool 1" D1 H2 F6					; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), H1 = Heater Number, Fx = Fan number print cooling fan
	G10  P1 S0 R0								; Set tool 0 operating and standby temperatures(-273 = "off")
	;M572 D1 S0.1								; Set pressure advance on 

	; Expansion 0
	;M563 P2 S"Tool 2" D2 H3 F7					; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), H1 = Heater Number, Fx = Fan number print cooling fan
	;G10  P2 S0 R0								; Set tool 0 operating and standby temperatures(-273 = "off")
	;M572 D2 S0.1								; Set pressure advance on

	;M563 P3 S"Tool 3" D3 H4 F8					; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), H1 = Heater Number, Fx = Fan number print cooling fan
	;G10  P3 S0 R0								; Set tool 0 operating and standby temperatures(-273 = "off")
	;M572 D3 S0.1								; Set pressure advance on 

	M98  P"/sys/Toffsets.g"						; Set tool offsets from the bed. In separate file so test macro can invoke. 



	;M98 P"config-user.g"						; Load custom user config if one exists.

	;M501										; Load saved parameters from non-volatile memory

	;G29 S1

	; Note: you will need to tune the bed heater, and both extruder cartridges before printing.
	; See the following link for more details. https://duet3d.dozuki.com/Wiki/Tuning_the_heater_temperature_control


