; called when a print is cancelled after a pause.
T-1     ; Park any active tool.
M140 S0 ; Turn off the bed heater.
M84 S600 ; Disable motors after 10 mins of inactivity
