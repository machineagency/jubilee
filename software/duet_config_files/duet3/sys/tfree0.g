; Runs at the start of a toolchange if the current tool is tool1.
; Note: tool offsets are applied at this point unless we preempt commands with G53!
; Note: Prior to this macro, XYZ have been saved to slot 2 by the firmware as though a G60 S2 were executed. 

G91                           ; Relative to move bed down
G1 Z5 F6000                   ; Move the bed further from the nozzle prior to any tool moves.  No G53 needed because this is a relative move.  Bed will be placed back in position in the post macro. 
G90                           ; Return to absolute


G53 G0      Y275 F10000       ; Rapid to the approach position with tool-0. (park_x, park_y - offset).  Y first in case close to tool row. 
G53 G0 X97       F10000       ; Rapid to the approach position with tool-0. (park_x, park_y - offset).  X next to make a square move. 
G53 G0 X97  Y320 F10000       ; Rapid to the approach position with tool-1. (park_x, park_y - offset)
G53 G1 Y355 F6000             ; Controlled move to the park position with tool-1. (park_x, park_y)
M98 P"/macros/tool_unlock.g"  ; Unlock the tool
G53 G1 Y340 F6000             ; Move the carraige to retract the pin until it clears the tool.
G53 G0 Y280 F10000	          ; Rapid to a position where a future tool change won't hurt anything by returning to this position via its G60 S2

