# GMS2 - RobotoSkunk's Safezone
A script that adds multi-resolution support in Game Maker Studio 2

The script adjusts the GUI surface and the application_surface to suit the resolution you have set

## Installation
[Go to the folder where the script is located](https://github.com/RobotoSkunk/gms2_safezone/blob/main/src/scripts/rs_safezone/rs_safezone.gml) and add it to your project, then configure the project to support window resizes and keep the aspect ratio (important).

## How to use
Just call the script inside a single object in the step event to start working.
The function returns the aspect ratio of the current resolution.

Additionally, it automatically generates four read-only global variables to use:
* rs_ideal_width - The new width given by the script
* rs_ideal_height - The new height given by the script
* rs_actual_width - The current width of the game window
* rs_actual_height - The current height of the game window

## Bugs
Use sensible aspect ratios because Game Maker will return a surface error if you use dimensions that Game Maker doesn't support.
These errors are very random and there is no concrete way to know when one will come out.
