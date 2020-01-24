# Changelog

All changes between releases are tracked here.

## [PENDING] rel/jubilee_2.0.1 - Jan 19, 2020 (already in master branch)

- Adjusted the Carriage Back Plate and pulley spacers such that the nominal position of both belts is coplanar, rather than slightly off. Fixes [Issue #14](https://github.com/machineagency/jubilee/issues/14).
- swapped M3 nuts and for heat set inserts int the Carriage Back Plate to add clearance for the aluminum crossbar upgrade.
- Updated the instructions to show how to properly install the composite _Keep Nuts_ into the carbon fiber crossbar. Fixes [Issue #15](https://github.com/machineagency/jubilee/issues/15).


The following parts *must* be reprinted since Release 1.0.0:
- [Carriage Back Plate](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/toolchanger/toolchange_carriage/carriage_back_plate.STL)
- [Belt Clasp](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/belt_clasp.STL)
- [Printed Pulley Spacer](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/printed_pulley_spacer.STL)

## rel/jubilee-2.0 - Jan 15, 2020

### Added
- Jubilee V2, *Cubilee*
- New [Bill of Materials](https://docs.google.com/spreadsheets/d/1pRzBQxVzL9c4T9b1RrKvSjlSwJJhJ7NcbSV6iJUv0X0/edit?usp=sharing). All parts that were added, changed-in-size, or increased in value since the V1 BOM are highlighted in yellow.

### Changed
- Frame was adjusted to accommodate larger tools and a build volume of 300x300x300mm. Size update also fixes issue [#4](https://github.com/machineagency/jubilee/issues/4)
- Dowel pin spacing on the Coupling Plate was modified slightly to more easily lock E3D tool plates
- Back Panel bolt hole pattern now accommodates either a set of Duet2 + Duex5 boards or a set of Duet3 + 2 expansion boards + Raspi 
- Front opening has more clearance for bed plate removal 
- ZYLTech Leadscrews are now 375mm instead of 270mm
- Side Panel Sizes are slightly larger
- Back Panel Size is slightly larger
- Crossbar Size is slightly longer. New [DXF](https://github.com/machineagency/jubilee/blob/dev/jubilee_2.0/fabrication_exports/machined_parts/crossbar/crossbar_6mm_for_400mm_mgn12_rail.DXF)
- Belt lengths are now slightly longer
- X-axis MGN12 rail is now 400mm instead of 350mm
- Z-axis MGN12 rail is now 400mm instead of 300mm
- 3D Printed Feet are now easier to assemble and ~$30 cheaper
- Mounting plates for Z axis motors are now one piece each instead of two.
- All M2 Dowel Pins were replaced with set screws for easier assembly.
- Toolchanger Elastic Lock Actuator was redesigned for ease of assembly. Using a V1 lock will still work though
- The BOM lists the embedded magnet build plate as the default since it fixes issue [#3](https://github.com/machineagency/jubilee/issues/3)

The following parts *must* be reprinted since Release 1.0.0:
- [Front Left Bed Coupling Lift](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/front_left_bed_coupling_lift.STL)
- [Front Right Bed Coupling Lift](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/front_right_bed_coupling_lift.STL)
- [Front Left Z Motor Plate](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/front_left_z_motor_plate.STL)
- [Front Right Z Motor Plate](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/front_right_z_motor_plate.STL)
- [Back Z Motor Plate](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/back_z_motor_plate.STL)
- [Carriage Coupler Plate](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/toolchanger/toolchange_carriage/carriage_coupler_plate.STL)

The following parts have minor changes, but do not need to be reprinted:
- [Left Motor Corner Bracket Spacer](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/left_motor_corner_bracket_spacer.STL)
- [Right Motor Corner Bracket Spacer](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/right_motor_corner_bracket_spacer.STL)
- [Left Double Pulley Corner Bracket](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/left_double_pulley_corner_bracket.STL)
- [Right Double Pulley Corner Bracket](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/right_double_pulley_corner_bracket.STL)
- [Front Left Leadscrew Retainer](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/front_left_leadscrew_retainer.STL)
- [Front Right Leadscrew Retainer](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/front_right_leadscrew_retainer.STL)
- [Back Leadscrew Retainer](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/back_leadscrew_retainer.STL)
- [Back Bed Coupling Lift](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/back_bed_coupling_lift.STL)
- [Front Left Foot](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/front_left_foot.STL)
- [Front Right Foot](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/front_right_foot.STL)
- [Back Left Foot](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/back_left_foot.STL)
- [Back Right Foot](https://github.com/machineagency/jubilee/blob/master/fabrication_exports/3d_printed_parts/frame/back_right_foot.STL)

### Removed
- Delrin Slip Face on toolchanger elastic lock


## [1.0.0] - 2019-09-09

### Added
- Jubilee V1, *the original Jubilee*
- Original [Bill of Materials](https://docs.google.com/spreadsheets/d/1gq5yLxlfPtb3yrGsuXR_ZLhAFGB77CzGvfcWYyYIvT4/edit#gid=0)
