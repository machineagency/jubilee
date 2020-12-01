; Home y, x, z, and Toolchanger Lock axes

G91 G1 Z5 F800 H2           ; Lift z so we don't crash
M98 P"homeu.g"              ; X and Z require U to be homed first in case a tool is currently active
M98 P"homey.g"
M98 P"homex.g"
M98 P"homez.g"
