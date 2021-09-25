# Changelog

All changes between releases are tracked here.

## TODO:
- Update CCP-04 --> CCP-05
  - added space in the center
- Update Twist Lock spacer to be easier to print

## Upcoming: rel/jubilee 2.2.2 - eta: July 2021
- Remodeled Adjustable Parking Post. Both dowel pin height and width are now adjustable.
  - minimum dowel pin spacing can now be as thin as 35mm.
- Added Hard Stop on Nema14 Stepper to prevent it from twisting when locking tools.
- Added Tool Interface Diagram to help show spatial constraints when designing custom tools.
- Added Diagrams for Duet 3 Mini Wire Harnesses with lengths and connectors
- Added preliminary SuperSlicer Config
  - Note that this config alters the machine jerk settings to produce good quality prints at high speeds.
- primary working branch renamed from *master* to *main*
- Added X-axis Limit Switch Hardstop
- Added Z-axis Hard Stops to prevent permanent machine damage in the case of a failed/misconfigured Z limit switch.
  - 3-point bed leveling needs to start very close to level now, but a broken Z limit switch will no longer warp the crossbar or bed plate. Note that the three Z-axis linear rails must be 400mm long. small adjustments need to be made to the assembly if the rails are actually 395mm (HIWIN).
- Moved the "Control Point" down to 2mm below the Z limit switch trigger position. (G31 in the config.) This change adds clearance to ensure that travel moves with not tools when z=0 do not shear the limit switch.
- T8x4 leadscrews are now the default in the BOM

### Shopping List Changes
- Fastener Sheet
  - +1 M3, 16mm screw (for the X-axis limit switch hardstop)
  - -1 M3, 10mm screw (swapped out for the 16mm one)
  - +2 M3 Heat Set Inserts
  - +2 M3 set screws, 10mm long
  - T8x4 Leadscrews changed to default. T8x2 Leadscrews changed to alternate.

## rel/jubilee 2.2.1 - Apr 21, 2021
- Updated Electronics Back Panel!
  - Back Panel supports hole patterns for (1) Duet 3 Mini + 3HC, (2) Duet 2 + Duex5, and (3) Duet 3 + 2 3HC's
  - Removed Tool Wiring Cable feedthrough holes. Tool wiring can be routed under the machine.
- Updated Default BMG Tool:
  - Flipped Wedge Plate Orientation in the Default BMG Tool. This orientation makes for a stiffer back plate.
  - Updated Default BMG Tool Fan Shroud to @edthesped's "Cappuccino" fan shroud. Uses 5015 fans instead of 4020 fans.
  - Added 2mm slot width to Cappuccino fan for extra vertical adjustment.
  - Added second Cappuccino fan model with wider slot for [Mechatronics 5015 fans](https://www.mechatronics.com/pdf/B5015.pdf)
  - Added pics to BMG Tool instructions from @msds. Fixes [#107](https://github.com/machineagency/jubilee/issues/107) and [#143](https://github.com/machineagency/jubilee/issues/143)
- Tool Template Updates:
  - Added Tool Wings to the Tool Template (2 variants in Solidworks, STEP, and STL)
  - Flipped Wedge Plate Orientation in the Tool Template Model. Preliminary tests show that this shape makes the tool plate much more resilient to creep.
- Merged [PR from Olby](https://github.com/machineagency/jubilee/pull/179) which updates the Duet3 Wiring Diagram to be in sync with the config files.
- The four M3 12mm screws on the front carriage have been swapped for the four M3 10mm screws on the back Z axis. Screw count did not change.



## rel/jubilee 2.2.0 - Dec 2, 2020
- More Permissive License!
  - Jubilee is licensed under Creative Commons 4.0 International License
  - Dropping the former "Share-Alike" restriction
- Massive Frame Assembly Instruction Overhaul
  - All M5 Drop-in T Nuts have been replaced with M5 Stamped Slide-in T Nuts. The former do not always seat properly into the extrusion when they are being installed.
  - Frame assembly instructions have been totally revamped to pre-load Slide-in T Nuts during assembly.
  - All M3 Slide-in T Nuts (used for connecting MGN12 rail to the 2020 extrusions) have been replaced with [Stamped M3 Slide In T-Nuts](https://www.aliexpress.com/item/32803077280.html) which are consistently better quality from Aliexpress
  - The process of squaring the outer frame makes better use of the Machinist Blocks, which means...
  - The 8x outer_frame_squaring_plate.STLs are no longer needed.
- Leadscrew Retainers are no longer needed. They have been removed from the assembly instructions.
  - As is, they were overconstraining the z axis screws.

### Config/Macro Changes
- Adding a RepRapFirmware 3+ Config Files for Duet2 + Duex5 boards
- Adding Safety and "tool-loaded" Checks to homing macros before executing a homing move. -- [contributed by @ProbiusSC](https://github.com/machineagency/jubilee/pull/133)
- bed.g
  - disabling mesh compensation at the beginning and re-enabling at the end. This is a precaution in case bed.g is called as a standalone macro. homez.g already disables mesh compensation before calling bed.g.

### Changes to Printed Parts
- [BZP-04](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/back_z_motor_plate.STL)
  - Added 1mm of height to where motor attaches to be consistent with the other two Z Motor Plates
- [LZP-04](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/front_left_z_motor_plate.STL)
  - Opened up M5 Screw Holes to 5.8mm to prevent collision of Slide-In TNut with Inside Corner Bracket 
- [RZP-04](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/front_right_z_motor_plate.STL)
  - Opened up M5 Screw Holes to 5.8mm to prevent collision of Slide-In TNut with Inside Corner Bracket 


### Shopping List Changes
- Fastener Sheet
  - All fasteners have been pulled into a separate tab.
  - All fasteners are now available as a single purchase from Filastruder
- M5 Stamped TNuts Introduced
  - These replace all M5 Drop-In TNuts
- Stamped TNut Backing Springs
- Keenovo Silicone Heated Pad Part Number Substitute
  - Replaced original Bed Heater with the one that includes a built-in 150C thermal cutoff for $3 more.
- Default BMG Extruder Shopping List
  - [Metal Tool Plates](https://shop.guildtek.com/index.php?main_page=product_info&cPath=1&products_id=4) available from Guildtek are now the default. These do not warp like the plastic ones do. Fixes [Issue #26](https://github.com/machineagency/jubilee/issues/26).
  

## rel/jubilee 2.1.2 - Sept 29, 2020
- Injection Molded Delrin Wedge Plates are now the standard for designing tool plates. Fixes [Issue #43](https://github.com/machineagency/jubilee/issues/43)
  - added injection molding specs sheet and STEP file with draft angles.
- Logo added to a [folder](https://github.com/machineagency/jubilee/tree/master/logo) in the main repository, courtesy of @troll on Discord
- Side and Back Panels for the frame are now available in HDPE from Filastruder. They are line items in the BOM.
- The Carriage Pulley now has an extra square nut to better resist plastic fatigue when screwed onto the Twist Lock.
- Added DXFs of Side and Back Panels to the [machineable parts folder](https://github.com/machineagency/jubilee/tree/master/frame/fabrication_exports/machined_parts/panels). These variants are router-friendly with the inclusion of Dogbone Fillets on inside corners for machining with up to a 3.175mm (1/8th in.) diameter endmill.
- Parking Post Part Number Corrected. The XX in PPBXX-04 and THXX-04 now reflect the dowel pin center-to-center distance.
  - PPB47-04 and TH47-04 regenerated, which are the correct parking post files for the pen tool.
  - PPB55-05 and TH55-05 created, which are the correct parking post files for the default extruder.
- Parking Post geometry updated for stiffness. It now uses a dovetail feature inspired by @Mr. Hobbit on Discord.
  - M3 8mm screws have been replaced with M3 10mm screws.
  - Instructions updated to reflect the new parking post geometry.
  
## Default Extruder Changes
- Replaced Delrin Compression Flexure with O-Rings. These are easier to source than a custom laser-cut Delrin part, but the old Delrin piece is still a viable option.
  - O-Rings should get a teeny bit of grease. (The same stuff as the leadscrews will work.)
- Tool Wings stick out an extra 5mm. The "pre-park" position has been backed off to 295mm in Y in the tool change macros to account for the extra distance. Overall build volume is unchanged.
  
### Config/Macro Changes
- config.g machine XY origin adjusted to reflect the documentation. (It was off by a couple mm.) Fixes [Issue #88](https://github.com/machineagency/jubilee/issues/88)
- XY Motor current has been increased to 2263mA. This is 80% of the peak current limit. (Note that LDO motor current limits are listed as *root mean square* not *peak* current values in the datasheet, so the *peak* current limit is 2829mA.)
- Tool Change Macros have been rewritten for more general use cases.
  - Tool Change Macros restore the Z height before pulling out the tool. This prevents tools from crashing into the bed when changing from a short to a tall tool.

### Changes to Printed Parts
- Carriage Pulley, [CPL-02](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchange_carriage/carriage_pulley.STL)

### Shopping List Changes
- Online Metals is now no longer a required supplier for frame components.
  - Side panel raw material has been replaced with three already-machined side panels from Filastruder.
- Carriage Pulley Assembly
  - -1 M3, 8mm set screw
  - +1 M3, 10mm set screw
  - +1 M3 Square Nut
- Default Extruder
  - +4 5mm ID, 9mm OD O-rings
- Parking Post
  - -2 M3, 8mm Buttonhead Screws
  - +2 M3, 10mm Buttonhead Screws
  
## rel/jubilee 2.1.1 - June 27, 2020

- REL Changes/Updates
  - Fixed Pulley tab is now slightly shorter to prevent rubbing on the back panel
  - Base Plate now accommodates a 3.0 or 3.2mm back panel
  - Base Plate motor distance to the back panel has been moved back 1mm for extra clearance for the Fixed Pulley tab.
  - Wire Rope Exit Holes are slightly wider on the base plate.
- Carriage Changes
  - Carriage Center Plate has four holes on the bottom to adjust the screws on the MGN12 Carriage without removing the front and back plates.
  - Wire Rope Exit Holes are slightly wider on SGC-02.
- Feet are now 46mm tall to accommodate heat sinks.
- Z-axis motors now use proper thrust bearings instead of two ring shims.
- Power Supply holder has one fewer fastener and more fastener hole clearance such that it can be screwed on with the socket installed


### Changes to Printed Parts
- [CCP-04](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchange_carriage/carriage_center_plate.STL)
- [z Thrust Bearing Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/z_thrust_bearing_spacer.STL)
- [SGC-02](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchange_carriage/spring_guide_capture.STL)
- [PSH-02](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/psu_socket_holder.STL)

- Taller Feet
  - [FLF-05](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/front_left_foot.STL)
  - [FRF-05](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/front_right_foot.STL)
  - [BLF-05](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/back_left_foot.STL)
  - [BRF-05](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/back_right_foot.STL)

- REL Parts
  - StepperOnline [Motor Clip](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchanger_locking_mechanism/stepper_online/lock_actuator_motor_clip.STL)
  - StepperOnline Base Plate [RLB-10S](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchanger_locking_mechanism/stepper_online/lock_actuator_base_plate.STL)
  - LDO [Motor Clip](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchanger_locking_mechanism/lock_actuator_motor_clip.STL)
  - LDO Base Plate [RLB-10](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchanger_locking_mechanism/lock_actuator_base_plate.STL)
  - [Fixed Pulley](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchanger_locking_mechanism/fixed_half_pulley.STL)

### Shopping List Changes
- -1 M5 Drop-in T Nut
- -1 M5 8mm Buttonhead Screw
- +3 5.08mm ID thrust bearings for Z axis
- -6 M5, 10mm OD Shim

## rel/jubilee 2.1.0 - May 29, 2020 

- The toolchanger now uses either an LDO Motor or the original StepperOnline motor. You must print the motor clip and base plate pertaining to the motor you have.
- The Remote Elastic Lock now uses an actual spring instead of cut spring guide
    - 1000 were made in China and distributed to various Jubilee part resellers
- The frame now uses metal motor plates by default
    - These are both stiffer and serve as motor heatsinks
- The shopping list no longer features the embedded mag plate as the default and instead lists a plain plate with a high-temp magnetic sticky sheet.
- The bed plate has additional holes for:
    - a replaceable thermal fuse
	- a spring-steel cable chain
- The fan shroud screw holes for the Default Tool Plate have been lowered a couple mm.
- The Default Tool Plate has a small chamfer to improve printability (This change removes the effect of elephant's foot.)
- Added Frame Wiring Diagram and Default Extruder Tool Wiring Diagram
- Z-axis motors now have two stacked shims instead of one to reduce wear on the coupler
- Remote Elastic Lock redesign and compatible with both StepperOnline and LDO motor options
- Wiring Diagram
  - fixing toolchanger motor wiring color
  - changing Duex5 power wire gauge from 16 AWG to 16-20 AWG

### Changes to Printed Parts
- Printed Pulley Spacer can now be clipped in after-the-fact to ensure shims were installed correctly beforehand.
- Twist Lock Spacer outer diameter reduced for better printability across a range of printers
- Carriage Center Plate now has heat set inserts
- Z-axis motor plates
    - now have a chamfer on the bottom surface for better printability across a range of printers. (This change removes the effect of elephant's foot.)
	- Cutout for vertical extrusions has also been shrunk such that it can act as a locating feature.
    - offset added between the motor and the plate such that the leadscrews don't "bottom out" inside the coupler
- Z Motor Spacer height adjustment to accommodate for Z-axis motor plate change
- Feet are now 5mm taller to make space for optional heatsinks
- Added thumb handle to the Remote Elastic Lock

### Shopping List Changes
- +1 Subtle Design Mag Sheet
- +1 plain cast tool build plate
- -1 embedded magnet cast tool build plate
- +1 Motor Plate Set
- +4 M4 Shoulder Screw, 16mm long, 5mm diameter
- -4 M4 Shoulder Screw, 12mm long, 5mm diameter
- +12 M3 buttonhead screws, 12mm long; -12 M3 buttonhead screws, 10mm long 
- +1 Remote Elastic Lock Hub
- +1 Remote Elastic Lock Extension Spring
- +1 longer sleeve bearing, -1 old length sleeve bearing
- +1 M3 Set Screw, 5mm long for Remote Elastic Lock Hub
- +10 M3 Tapered Heat Set Inserts, 22 total
- -2 M5 Buttonhead Screw, 14mm long
- -0.0625in Delrin plate. No longer necessary with the new Remote Elastic Lock

### Updating from 2.0.2 to 2.1.0

#### Major Improvements
- double up Z Axis Shim.
- If your shim rings on the XY motion system had a 10mm outer diameter, swap them for shim rings with a 7 or 8mm outer diameter.

#### Negligible Improvements
- Replace Z Motor Plates and Z Motor Spacers.
- Replace Carriage Center Plate
- Replace Carriage Back Plate
- Replace Remote Elastic Lock. (Don't actually do this unless you haven't assembled it yet.)

## Hotfix to Jubilee 2.0.2 - May 18, 2020
If your are using printed corner plates, not the Delrin plates, and they do not fit with your pulley stackup, reprint these updated versions. This version is slightly more forgiving adding 0.2mm of tolerance in the Z dimension.
- LXR-03 [Left Crossbar Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/left_crossbar_pulley_reinforcement_plate.STL) has a smaller diameter offset face to not interfere with the pulleys. Also: chamfer for easier shoulder screw insertion
- RXR-03 [Right Crossbar Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_crossbar_pulley_reinforcement_plate.STL)  has a smaller diameter offset face to not interfere with the pulley. Also: chamfer for easier shoulder screw insertion
- LCR-03 [Left Corner Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/left_corner_pulley_reinforcement_plate.STL) has a smaller diameter offset face to not interfere with the pulley. Also: chamfer for easier shoulder screw insertion
- RCR-03 [Right Corner Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_corner_pulley_reinforcement_plate.STL) has a smaller diameter offset face to not interfere with the upper pulley. Also: chamfer for easier shoulder screw insertion

## Hotfix to Jubilee 2.0.2 - April 27, 2020
If your are using printed corner plates, not the Delrin plates, reprint them:
- LXR-02 [Left Crossbar Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/left_crossbar_pulley_reinforcement_plate.STL) has a smaller diameter offset face to not interfere with the pulleys. Also: chamfer for easier shoulder screw insertion
- RXR-02 [Right Crossbar Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_crossbar_pulley_reinforcement_plate.STL)  has a smaller diameter offset face to not interfere with the pulley. Also: chamfer for easier shoulder screw insertion
- LCR-02 [Left Corner Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/left_corner_pulley_reinforcement_plate.STL) has a smaller diameter offset face to not interfere with the pulley. Also: chamfer for easier shoulder screw insertion
- RCR-02 [Right Corner Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_corner_pulley_reinforcement_plate.STL) has a smaller diameter offset face to not interfere with the upper pulley. Also: chamfer for easier shoulder screw insertion


## rel/jubilee_2.0.2 - Apr 11, 2020

### Major Fixes/Updates from Jubilee 2.0.1
- The frame is now Gates Pulley Compatible.
    - Either Genuine Gates pulleys or generic pulleys can be dropped into the machine. Note that Gates Pulleys are slightly taller, so shims and washers have been called out in the instructions to handle the height differences. Several printed parts have been adjusted, and they are called out below.
- All Delrin Corner Plates are now 3D printed except the Cinch Plates. (You can still use the laser-cut ones, but you may need to add shim.)
    - This is to to handle intercompatibility with Gates/Generic pulleys. The Gates pulleys require taller shoulder screws, so I've opted for thickening these parts instead of adding shim.
- Metal Motor Plate Changes
    - Both Motor Plates now have a counterbore feature to accommodate the thicker motor spacer. This change was driven by the geometry changes to make the Gates pulleys a drop-in replacement.
- Printed Motor Plate changes
    - slot for the stepper motor is now 11.4mm in radius to accomodate coarse 3D printer tolerances. Fixes [issue #68](https://github.com/machineagency/jubilee/issues/68)
    - Printed Right Motor Plate now has a deeper counterbore feature
- CAD Model Changes
    - CAD model now displays the aluminum crossbar instead of the 6mm carbon fiber one. The carbon fiber crossbar is preserved as a reference in another configuration.
	- All M5 Low Profile screw models were replaced with buttonheads, which is what the shopping list specifies.
	- Solidworks Model Zip file has been replaced with all components in their original folder structure. No longer requires using Git-LFS, which had bandwidth limits.
	- Front Left and Front Right MGN12 Rails attach to the 2020 extrusion with 5 screw, not 4 screws, to be conisistent with the back Z rail. Fixes [Issue #72](https://github.com/machineagency/jubilee/issues/72)
- Z Axis Assembly Changes
    - Spacing between dowel pins is now consistent on all three bed couplers. Fixes [Issue #59](https://github.com/machineagency/jubilee/issues/59)
    - All three printed components that couple the bed to the frame have heat-set inserts
	- Bed springs now connect with a bent solder terminal lug
    - Spring Stock for the bed springs has been replaced with proper 15mm springs
    - Overall, adding springs to the bed is now much easier to assemble and remove.
- Carriage Changes
    - added a spacer inside the carriage center plate on the Twist Lock Assembly to remove axial force on the carriage pulley (performance improvement) Addresses [Issue #58](https://github.com/machineagency/jubilee/issues/58)
	- replaced M3 16mm Flathead screws with Buttonhead screws (reduces unique part count)
	- Twist lock has been bumped forward 0.2mm to improve compatibility with picking up E3D tool plates
	- Carriage Back Plate has a Zip Tie tab for better Z axis cable management
	- Carriage Center Plate now has enough space to accomodate a variant of the current limit switch (PN: D2HW-C202MR), which has flying leads.
- Default Tool/Extruder Changes
    - Wedge Plate Geometry has been bumped forward ~0.35mm to change twist lock "logking" position to be slightly less than 180 degrees.
	- Screw holes for the fan shround have been bumped down slightly.
- Electronics Back Panel Changes
    - M5 panel mounting screws have been scooched over a few mm to make space for installation with the XY motors installed
	- cutout has been added in the corner to make room for the 3D Printed PSU Socket
	- Pocket for Bed wires has been relocated upwards in prep for a cable chain on the bed
	- Bed SSR has been relocated upwards in prep for a cable chain on the bed
- 120v Side Panel Changes
    - PSU cutout has been removed and replaced with a printed part. This change makes the power inlet socket much easier to swap for alternates.
	- The four M5 Screw holes in the corner have been scooched in 5mm
- Ethernet Side Panel Changes
	- Four M5 Screw holes in the corner have been scooched in 5mm
- Updated instructions for
    - toolchanger carriage assembly
    - bed plate
	- double pulley corner plates
	- left and right motor corner plates (and upgrade)
	- Z axis assembly. New instructions for bent terminal lugs.
	- heat set insert list
	- default extruder. Fixes [Issue #70](https://github.com/machineagency/jubilee/issues/70)

### Shopping List Changes
- The 2.0.1 Y axis limit switch (Part Num: D2HW-BL201H) has been reverted to the original switch from 2.0 (Part Num: D2HW-C201H).
    - The original Right Motor Plate Spacer was too short to fully embed the Y axis switch, but resizing for the Gates pulley option added enough space to add the original switch in. Overall, reducing the unique part count makes the project easier to order and assemble.
- Shoulder Screws are now sourced from [Filastruder](https://www.filastruder.com/collections/railcore/products/shoulder-screws-bolts?variant=17989593104455), which is slightly cheaper than McMaster-Carr.
- All six 20mm long, 5mm diameter shoulder screws have been replaced with 25mm long versions.
- The three Bed Retension Springs are now a stock part from [Aliexpress](https://aliexpress.com/item/33043988987.html?spm=a2g0s.9042311.0.0.447133edZMsmcq). (Order the 15mm version.)
    - 2.0.1 (and before) had instructions for making your own springs out of spring stock. This was a TON of extra work for a part you can just buy.
- Bed Retension Clips are now a different type of Terminal Lug
    - The three Keystone [7328](https://www.digikey.com/product-detail/en/keystone-electronics/7328/36-7328-ND/316697) Terminal Lugs on the bed and the three M2 set screws have been replaced by six [4000](https://www.digikey.com/product-detail/en/keystone-electronics/4000/36-4000-ND/316071) Terminal Lugs, which are much easier to bend around the spring.
- three more M3 heat set inserts
- pack of washers for generic pulleys.
- The Belleville disc spring is no longer required and has been removed
- The four M3, 16mm Flathead screws on the Carriage Front Plate have been replaced with four M3 12mm long Buttonhead screws.
- Previous Power Inlet Socket from Amazon (ASIN: B07C184P7L) now has two alternates listed from Digikey (Part Num: CCM2178-ND‎) and Mouser (Part Num: 446-084.01001.00-RSI).
    - The alternates are twin fused to account for a short-to-ground failure mode in a Hot-Hot 220V configuration (rare, but possible in some countries). They are set to become the primary power inlet sockets in a future revision.


### Config File Changes
- In **config.g**, the machine's XY Origin has been adjusted to be relative to the carriage's ZProbe location when no tools are present. See the [Frame Layout](https://github.com/machineagency/jubilee/wiki/Frame-Layout) for diagrams.
    - *bed.g* has been adjusted to reflect the new "ZProbe-Centric" origin
    - **tfreeX.g**, **tpreX.g**, and **tpostX.g** have had their parking post locations adjusted to reflect the new "ZProbe-Centric" XY origin.
    - tools are now released 1m behind where they are picked up. This is such that they can be pushed in Y first to contact the tool balls before locking them. This is a workaround until we get nice slippy Delrin replacement plates.
    - **tool_lock.g** now includes a slight 0.5mm push forward while engaging the twist lock.

### Updating from 2.0.1 to 2.0.2
If you would like to have the future option of updating to genuine Gates pulleys, the following part **must** be reprinted
- 4x [Printed Pulley Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/printed_pulley_spacer.STL)
- RMS-05 [Right Motor Plate Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_motor_corner_bracket_spacer.STL)
- RMP-03 [Right Motor Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_motor_plate.STL)
- CPB-03 [Carriage Back Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchange_carriage/carriage_back_plate.STL)
- 2x [Belt Clasp](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/belt_clasp.STL)
- LXR-01 [Left Crossbar Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/left_crossbar_pulley_reinforcement_plate.STL) (New!)
- RXR-01 [Right Crossbar Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_crossbar_pulley_reinforcement_plate.STL) (New!)
- LCR-01 [Left Corner Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/left_corner_pulley_reinforcement_plate.STL) (New!)
- RCR-01 [Right Corner Pulley Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_corner_pulley_reinforcement_plate.STL) (New!)
- 2x LMR-01 [Motor Reinforcement Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/motor_reinforcement_plate.STL) (New!)

The following parts were added/tweaked to better accomodate E3D tool plates
- TLS-01 [Twist Lock Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchange_carriage/twist_lock_spacer.STL) (New!)
- [Wedge Plate](https://github.com/machineagency/jubilee/blob/master/tools/jubilee_tools/tools/base_tool/fabrication_exports/wedge_plate.STL) 

The following parts were added/tweaked for ease of sourcing parts or assembly:
- FXP-09 [Fixed Half Pulley](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchanger_locking_mechanism/fixed_half_pulley.STL)
    - The hole for the 16mm long M3 screw is now slightly larger to make it easier to screw in.
- BBC-04 [Back Bed Coupler](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/back_bed_coupling_lift.STL)
    - has a threaded heat-set insert
- LBC-04 [Front Left Bed Coupler](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/front_left_bed_coupling_lift.STL)
    - has a threaded heat-set insert
- RBC-04 [Front Right Bed Coupler](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/front_right_bed_coupling_lift.STL)
    - has a threaded heat-set insert
- PSH-01 [PSU Socket Holder](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/psu_socket_holder.STL) (New!)
    - This part to replace the acrylic cutout, which was brittle and prone to cracking. It's also easier to modify a 3D printed part for slightly different sized PSU sockets. 
	
The following parts were tweaked for aesthetics:
- LMS-04 [Left Motor Plate Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/left_motor_corner_bracket_spacer.STL)

## rel/jubilee_2.0.1 - Mar 10, 2020

### Major Fixes/Updates from 2.0
- The [Aluminum Crossbar](https://www.mandalaroseworks.com/jubilee/crossbar) is now available from Mandala Rose Works for $80. It is now the default in the BOM. Should you choose to upgrade from the carbon fiber crossbar, you will need to:
    - Print the latest [Right Motor Plate Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_motor_corner_bracket_spacer.STL)
    - Print the [X Limit Trigger](https://github.com/machineagency/jubilee/blob/master/frame/upgrades/aluminum_crossbar/fabrication_exports/stls/x_limit_trigger.STL)
    - purchase 1x M3, 10mm standoff from [McMaster-Carr](https://www.mcmaster.com/95947a006)
    - purchase 1x M3, 16mm buttonhead screw from [McMaster-Carr](https://www.mcmaster.com/92095a184) or [Bolt Depot](https://www.boltdepot.com/Product-Details.aspx?product=7222)
    - purchase 1x D2HW-BL201H from [Digikey](https://www.digikey.com/products/en?keywords=D2HW-BL201H)
    - Optional: replace the sixteen M3, 12mm buttonhead screws for bolting in the rail with M3, 10mm screws instead
- Adjusted Parking Post for the default extruder such that the tool doesn't twist while being picked up. Updated [assembly instructions](https://github.com/machineagency/jubilee/blob/master/tools/jubilee_tools/tool_posts/configurable_tool_post/assembly_instructions/parking_post_assembly_instructions.pdf)
- Adjusted the Carriage Back Plate and pulley spacers such that the nominal position of both belts is coplanar, rather than slightly off. Fixes [Issue #14](https://github.com/machineagency/jubilee/issues/14).
- swapped M3 nuts and for heat set inserts int the Carriage Back Plate to add clearance for the aluminum crossbar upgrade.
- Updated the instructions to show how to properly install the composite _Keep Nuts_ into the carbon fiber crossbar. Fixes [Issue #15](https://github.com/machineagency/jubilee/issues/15).
- Re-exported latest STL files for Extruder Tool
- Added an "Upgrades" folder for alternate frame components
- Tweaked direct drive extruder to fix compatibility issue when assembling for a V6 hotend.
- Adding Heatsinks to default extruder BOM for the stepper motors as they can get hot enough to warp the tool plates

The following parts *must* be reprinted since rel/jubilee-1.0:
- CPB-02 [Carriage Back Plate](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/toolchanger/toolchange_carriage/carriage_back_plate.STL)
- [Belt Clasp](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/belt_clasp.STL)
- PPS-02 [Printed Pulley Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/printed_pulley_spacer.STL)
- PPB47-03 [Parking Post Base](https://github.com/machineagency/jubilee/blob/master/tools/jubilee_tools/tool_posts/configurable_tool_post/fabrication_exports/parking_post_base_47mm.STL)
- TH47-03 [Tool Holder](https://github.com/machineagency/jubilee/blob/master/tools/jubilee_tools/tool_posts/configurable_tool_post/fabrication_exports/tool_holder_47mm.STL)

The following parts were tweaked, but do not need to be reprinted if you have already assembled your machine.
- LMS-03 [Left Motor Plate Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/left_motor_corner_bracket_spacer.STL) has a bumper feature to make the y rails easier to install in a consistent spot.
- RMS-04 [Right Motor Plate Spacer](https://github.com/machineagency/jubilee/blob/master/frame/fabrication_exports/3d_printed_parts/frame/right_motor_corner_bracket_spacer.STL) has a bumper feature to make the y rails easier to install in a consistent spot.

### Minor Fixes/Tweaks
- Most printed parts now have part numbers with the revision id on them. This feature is useful for identifying what version of a part you have to decide whether you need to upgrade to a newer revision in the future
- Fixed old V1-related graphics in Remote Elastic Lock Instructions. Some photos are still out of date, but the whole is useable in its current state.
- Reorganized file structure to clearly separate tools from frame
- M3 Drop-in T nuts have been replaced with M3 Slide-in T nuts, which are cheaper and less of a hassle to install.
- Y axis limit switch was moved forward by 0.2mm to ensure that it clicks even on poorly printed parts.

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
