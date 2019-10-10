; Runs at the start of a toolchange if the current tool is tool-0.
; Note: tool offsets are applied at this point unless we preempt commands with G53!

G53 G0 X289 Y320 F25000       ; Rapid to the approach position with tool-0. (park_x, park_y - offset)
G53 G1 Y364 F10000       ; Controlled move to the park position with tool-0. (park_x, park_y)
M98 P"/macros/tool_unlock.g" ; Unlock the tool
G53 G1 Y345 F6000       ; Retract the pin.



