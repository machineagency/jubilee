; Runs after freeing the previous tool if the next tool is tool-0.
; Note: tool offsets are not applied at this point!
;G0 X289 Y335 F25000  ; Rapid to the approach position without any current tool.
;G1 E5 F600           ; Undo any prior retraction and purge the nozzle.
;G92 E0               ; Zero the E axis.
;G4 S2                ; Wait for the ooze to settle.
;G1 Y365 F10000       ; Move to the pickup position with tool-0.
;M98 P"/macros/tool_lock.g" ; Lock the tool
;G1 Y320 F6000       ; Retract the entire tool and wipe Backwards.
;G1 Y360 F10000       ; Wipe Forwards.
;G1 Y320 F10000       ; Wipe Backwards.
;G1 Y360 F10000       ; Wipe Forwards.
;G1 Y320 F10000       ; Wipe Backwards.

G0 X289 Y320 F25000  ; Rapid to the approach position without any current tool.

G60 S2               ; Save this position as the reference point from which to later apply new tool offsets.
