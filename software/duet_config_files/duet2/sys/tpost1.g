; tpost1.g
; called after firmware thinks Tool1 is selected
; Note: tool offsets are applied at this point!

M116 P1 ; Wait for set temperatures to be reached

; Note that commands preempted with G53 will NOT apply the tool offset.

G53 G0 X21 Y311 F17000  ; Rapid to the approach position without any current tool.
;M302 P0                  ; Prevent Cold Extrudes, just in case temp setpoints are at 0
;G1 E10 F100
;G4 S1                    ; Slight Delay
;G1 E-1.0 F2000           ; Perform a retract to remove filament pressure.
G91                      ; Set Relative Movements
G1 Z3                    ; Pop the Z up slightly to avoid scraping carriage limit switch on pull-back for early layers.
                         ; Also clear any dangling debris on purge towers.
G90                      ; Restore Absolute Movements
G53 G1 Y340 F6000       ; Move to the pickup position with tool-0.
G53 G1 Y344.5 F600        ; Contact the coupler by pushing on it.
M98 P"/macros/tool_lock.g" ; Lock the tool
G53 G1 Y296 F6000        ; Retract the entire tool and wipe Backwards.
;G53 G1 Y336 F10000       ; Wipe Forwards.
;G53 G1 Y296 F10000       ; Wipe Backwards.
;G53 G1 Y336 F10000       ; Wipe Forwards.
;G53 G1 Y296 F10000       ; Wipe Backwards.

G1 R2 X0 Y0 Z0   ; Restore prior position now accounting for new tool offset

M106 R2           ; restore print cooling fan speed



