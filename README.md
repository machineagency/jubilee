Jubilee
=======

Jubilee is an open-source, extensible multi-tool motion platform capable of running GCode for non-loadbearing automation applications.

![Jubilee](/pics/jubilee-professional-headshot-brightened.jpg)

Out-of-the-box, Jubilee is configured for multimaterial 3D printing and multicolor pen plotting, but we've had success with light liquid-handling and image stitching applications too.

Read more about the history of Jubilee on [Hackaday](https://hackaday.com/2019/11/14/jubilee-a-toolchanging-homage-to-3d-printer-hackers-everywhere/)

## Repository contents

* **[/cads](/cads)** holds variants of the native design files.
* **[/fabrication_exports](/fabrication_exports)** contains files in formats ready for 3D printing, laser cutting, or quoting an external vendor to make for you.
* **[/software](/software)** holds both the Duet config files and profile settings for common slicer packages.
* **[/assembly_instructions](/assembly_instructions)** contains PDFs that will take you step-by-step to assembling all the parts in the BOM and fabrication exports to create your own Jubilee

## Build your own Jubilee

[**Assembly Instructions**](https://github.com/machineagency/jubilee/wiki/Assembly-Instructions)

[**Bill of Materials**][bom]

##### Quickstart for Multimaterial 3D Printing:

1. Budget: **$1600** for the Frame and **$200** per extruder tool
1. Order: all parts in the [Bill of Materials][bom]
1. Print and laser-cut all parts in the [/fabrication_exports](/fabrication_exports) folder (_NOTE: Laser-cut parts are also [available for purchase](https://www.seemecnc.com/products/jubilee-laser-cut-delrin-piece-kit) as a kit_)

## Support

Have questions? Building your own Jubilee? **[Join our Discord!][discord]**

## Contributing to this project

Jubilee is meant to be extended by the community.   If you are interested in contributing, there are a number of ways to get involved:

* Review the **[open issues](https://github.com/machineagency/jubilee/issues)**
* Have a new tool to add to the repository? Read our [contributing]() guidlelines and create a [pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)
* **[Join our Discord!][discord]**

## Who are we?
Jubilee was designed with love by [Joshua Vasquez](http://www.doublejumpelectric.com/) of the [Machine Agency](http://depts.washington.edu/machines/) at the University of Washington.

### Open source

[![CC BY 3.0][cc-by-image]][cc-by]

Jubilee is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License][cc-by] (CC BY-SA 3.0).


[bom]: https://docs.google.com/spreadsheets/d/1gq5yLxlfPtb3yrGsuXR_ZLhAFGB77CzGvfcWYyYIvT4/edit#gid=0
[cc-by]: https://creativecommons.org/licenses/by-sa/3.0/
[cc-by-image]: https://i.creativecommons.org/l/by-sa/3.0/88x31.png
[discord]: https://discord.gg/XkphRqb
[wiki]: https://github.com/machineagency/jubilee/wiki
