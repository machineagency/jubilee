; Runs at the start of a toolchange if the current tool is tool-1.
; Note: tool offsets are applied at this point unless we preempt commands with G53!

G91                      ; Set Relative Movements
G1 Z1                    ; Pop the Z up slightly
G90                      ; Restore Absolute Movements
G53 G0 X16 Y340 F10000       ; Rapid to the approach position with tool-1. (park_x, park_y - offset)
G53 G1 Y384 F10000       ; Controlled move to the park position with tool-1. (park_x, park_y)
M98 P"/macros/tool_unlock.g" ; Unlock the tool
G53 G1 Y365 F6000       ; Retract the pin.