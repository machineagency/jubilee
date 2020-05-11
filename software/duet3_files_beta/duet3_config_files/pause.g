; Resume macro file
G1 R1 X0 Y0 Z2 F5000 ; go to 5mm above position of the last print move
G1 R1 X0 Y0 Z0 ; go back to the last print move
M83 ; relative extruder moves
G1 E3 F3600 ; extrude 3mm of filament