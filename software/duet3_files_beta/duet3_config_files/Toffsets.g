	; tpost0.g
	; called after firmware thinks Tool0 is selected
	; Note: tool offsets are applied at this point!

	M116 P0                  ; Wait for set temperatures to be reached

	; Note that commands preempted with G53 will NOT apply the tool offset.

	G53 G0 X294 Y305 F17000  ; Rapid to the approach position without any current tool.
	M302 P0                  ; Prevent Cold Extrudes, just in case temp setpoints are at 0
	G1 E10 F100              ; Purge the Nozzle
	G4 S1                    ; Slight Delay
	G1 E-1.0 F2000           ; Perform a retract to remove filament pressure.
	G91                      ; Set Relative Movements
	G1 Z3                    ; Pop the Z up slightly to avoid scraping carriage limit switch on pull-back for early layers.
							 ; Also clear any dangling debris on purge towers.
	G90                      ; Restore Absolute Movements
	G53 G1 Y321 F6000        ; Move to the pickup position with tool-0.
	G53 G1 Y321.5 F600        ; Contact the coupler by pushing on it.
	M98 P"/macros/tool_lock.g" ; Lock the tool
	G53 G1 Y280 F6000        ; Retract the entire tool and wipe Backwards.
	;G53 G1 Y323 F10000       ; Wipe Forwards.
	;G53 G1 Y296 F10000       ; Wipe Backwards.
	;G53 G1 Y323 F10000       ; Wipe Forwards.
	;G53 G1 Y296 F10000       ; Wipe Backwards.


	G1 R2 X0 Y0 Z0   ; Restore prior position now accounting for new tool offset

	M106 R2           ; restore print cooling fan speed