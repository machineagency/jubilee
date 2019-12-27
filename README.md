**Update:** Jubilee is about to undergo a major release in early January! To get a sense of V2 before it's fully released, have a look at the [upcoming release branch](https://github.com/machineagency/jubilee/tree/dev/jubilee_2.0) and new [V2 Bill of Materials](https://docs.google.com/spreadsheets/d/1pRzBQxVzL9c4T9b1RrKvSjlSwJJhJ7NcbSV6iJUv0X0/edit#gid=0). Finally, to get a sense of what's different between V2 and V1, have a look at the [Changelog](https://github.com/machineagency/jubilee/blob/dev/jubilee_2.0/CHANGELOG.md).

Jubilee
=======

Jubilee is an open-source, extensible multi-tool motion platform capable of running GCode for non-loadbearing automation applications.

![Jubilee](/pics/jubilee-professional-headshot-brightened.jpg)

Out-of-the-box, Jubilee is configured for multimaterial 3D printing and multicolor pen plotting, but we've had success with light liquid-handling and image stitching applications too.

## Build your own Jubilee

The best way to get started is to thumb through the [**Assembly Instructions**](https://github.com/machineagency/jubilee/wiki/Assembly-Instructions) and [**Bill of Materials**][bom] first.

Then head over to the [**Wiki**](https://github.com/machineagency/jubilee/wiki) to start gathering tools and deciding which parts to buy and which parts to make.

## Repository Contents

* **[/cads](/cads)** holds variants of the native design files.
* **[/fabrication_exports](/fabrication_exports)** contains files in formats ready for 3D printing, laser cutting, or quoting an external vendor to make for you.
* **[/software](/software)** holds both the Duet config files and profile settings for common slicer packages.
* **[/assembly_instructions](/assembly_instructions)** contains PDFs that will take you step-by-step to assembling all the parts in the BOM and fabrication exports to create your own Jubilee

## Support

Have questions? Building your own Jubilee? **[Join the Discord!][discord]**

## Contributing

Jubilee is meant to be extended by the community. If you are interested in contributing, there are a number of ways to get involved:

* Review the **[open issues](https://github.com/machineagency/jubilee/issues)**
* Have a new tool to add to the repository? Read our [contributing]() guidlelines and create a [pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)
* **[Join the Discord!][discord]**


## Who are we?
Jubilee was designed with love by [Joshua Vasquez](http://www.doublejumpelectric.com/) of [Machine Agency](http://depts.washington.edu/machines/) at the University of Washington.

### Press and Outside Resources

Read more about the history of Jubilee on [Hackaday](https://hackaday.com/2019/11/14/jubilee-a-toolchanging-homage-to-3d-printer-hackers-everywhere/)

### Open Source
Jubilee is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License][cc-by] (CC BY-SA 3.0).
[![CC BY 3.0][cc-by-image]][cc-by]

[bom]: https://docs.google.com/spreadsheets/d/1gq5yLxlfPtb3yrGsuXR_ZLhAFGB77CzGvfcWYyYIvT4/edit#gid=0
[cc-by]: https://creativecommons.org/licenses/by-sa/3.0/
[cc-by-image]: https://i.creativecommons.org/l/by-sa/3.0/88x31.png
[discord]: https://discord.gg/XkphRqb
[wiki]: https://github.com/machineagency/jubilee/wiki
