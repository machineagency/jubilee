; Home y, x, z, and Toolchanger Lock axes

G91 G1 Z5 F800 S2           ; Lift z so we don't crash
M98 P"homeu.g"              ; Home u first In case a tool is currently active
M98 P"homey.g"
M98 P"homex.g"
M98 P"homez.g"
