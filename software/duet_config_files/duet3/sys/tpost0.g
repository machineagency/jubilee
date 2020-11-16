; runs after firmware thinks Tool1 is selected
; Note: tool offsets are applied at this point!
; Note that commands prefixed with G53 will NOT apply the tool offset.

G0 X97 Y320 F10000       ; Rapid to the approach position without any current tool.  This lets the human know the next command is waiting on this new tool. 
M116 H2                  ; Wait for set temperatures to be reached

M302 P0                  ; Prevent Cold Extrudes, just in case temp setpoints are at 0
;G1 E5 F500              ; Purge the nozzle.
;G1 E5 F100
;G4 H0.5                    ; Slight Delay
;G1 E-1.0 F2000           ; Perform a retract to remove filament pressure.
G53 G1 Y356 F6000        ; Move to the pickup position with tool-0.
M98 P"/macros/tool_lock.g" ; Lock the tool
G53 G1 Y320 F6000        ; Retract the entire tool and wipe Backwards.
G53 G1 Y353 F10000       ; Wipe Forwards.
G53 G1 Y320 F10000       ; Wipe Backwards.
G53 G1 Y353 F10000       ; Wipe Forwards.
G53 G1 Y260 F10000       ; Wipe Backwards, and move away from other tools, incase next move is X only. 

;G1 R2 Y0        ; Restore prior position now accounting for new tool offset.  Y first to avoid certain collisions when near tool parking. 
;G1 R2 X0        ; Restore prior position now accounting for new tool offset
;G1 R2 Z0        ; Restore prior position now accounting for new tool offset

;M106 R2         ; restore print cooling fan speed



