; tpre1.g
; Runs after freeing the previous tool if the next tool is tool-0.
; Note: tool offsets are not applied at this point!

G90                  ; Ensure the machine is in absolute mode before issuing movements.
                     ; CHANGE X VALUE ON NEXT LINE TO MATCH YOUR PARK LOCATION.
G0 X0 Y305 F20000    ; Rapid to the approach position without any current tool.
G60 S0               ; Save this position as the reference point from which to later apply new tool offsets.