Handling tool changes, wipes, and offsets is done at the scripting level. This choice maximizes Jubilee's compatibility across slicers as changing tools is simply invoked with a **T0** or **T1** command.

## Prerequisites
* connect the tool lock's limit switch connector to the Duet's **E0** port.
* Load these config files onto your SD card respecting the folder structure.

## Dialing in the Parking Post Locations
Note that parking locations for *each* tool are set in three files: **tfreeX.g**, **tpreX.g**, and **tpostX.g**.
It is strongly recommended that you first try to use the hardware adjustments on the physical parking posts to set the location such that it matches those in the config files.
If you cannot adjust the hardware location to match the parking position in hardware, only then should you change the locations in the config files.
The main reasonng for this suggestion is that adusting the locations in hardware is easy (since the posts are adjustable vertically and horizontally) while changing them is software involves changing their values in multiple files, which is subject to error.
