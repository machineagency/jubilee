Jubilee V2
=======

Jubilee is an open-source, extensible multi-tool motion platform capable of running GCode for non-loadbearing automation applications.

![Jubilee](/frame/pics/jubilee_v2.png)

Out-of-the-box, Jubilee is configured for multimaterial 3D printing and multicolor pen plotting, but we've had success with light liquid-handling and image stitching applications too.

While this repository contains all the design-related content needed to build a Jubilee, we suggest using the [**Wiki**](https://github.com/machineagency/jubilee/wiki) to help navigate through these files.

## Build your own Jubilee

The best way to get started is to thumb through the [**Assembly Instructions**](https://github.com/machineagency/jubilee/wiki/Assembly-Instructions) and [**Bill of Materials**][bom] first.

Then head over to the [**Wiki**](https://github.com/machineagency/jubilee/wiki) to start gathering tools and deciding which parts to buy and which parts to make.

## Repository Contents
The Repository is broken into threee main chunks:
* **frame** contains all design content related to the Jubilee frame
* **tools** contains all design content related to custom tools and tools to help assemble and tune Jubilee
* **software** holds both the Duet config files and profile settings for common slicer packages

inside these folders, you'll usually find a folder structure that looks like this:
* **assembly\_instructions** contains PDFs to take you step-by-step through sub-assemblies of the project.
* **cads** contains raw design files in two formats
    * **Solidworks**
    * **STEP**
* **fabrication\_exports** contains STLs, DXFs, and other files used to fabricate pieces of Jubilee

## Support

Have questions? Building your own Jubilee? **[Join the Discord!][discord]**

## Contributing

Jubilee is meant to be extended by the community. If you are interested in contributing, there are a number of ways to get involved:

* Review, comment, or add to the **[open issues](https://github.com/machineagency/jubilee/issues)**
* Have a new tool to add to the repository? Read our [contributing]() guidlelines and create a [pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)
* **[Join the Discord!][discord]**


## Who are we?
Jubilee was designed with love by [Joshua Vasquez](http://www.doublejumpelectric.com/) of [Machine Agency](http://depts.washington.edu/machines/) at the University of Washington.

### Press and Outside Resources

Read more about the history of Jubilee on [Hackaday](https://hackaday.com/2019/11/14/jubilee-a-toolchanging-homage-to-3d-printer-hackers-everywhere/), or, for the patient, check out this (1hr) [talk](https://www.youtube.com/watch?v=7fz2UHHxe5o&t=119s) given in Jan 2020.

### Open Source
Jubilee is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License][cc-by] (CC BY-SA 3.0).
[![CC BY 3.0][cc-by-image]][cc-by]

[bom]: https://docs.google.com/spreadsheets/d/1pRzBQxVzL9c4T9b1RrKvSjlSwJJhJ7NcbSV6iJUv0X0/edit#gid=0
[cc-by]: https://creativecommons.org/licenses/by-sa/3.0/
[cc-by-image]: https://i.creativecommons.org/l/by-sa/3.0/88x31.png
[discord]: https://discord.gg/XkphRqb
[wiki]: https://github.com/machineagency/jubilee/wiki
