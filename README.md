# Silhouette Cameo 4 Pen Holder
## Overview
A 3D printable pen-holder tool for the Silhouette Cameo 4 cutter designed to be as attractive, functional and useful as the original manufacturer's part.

As per the original holder, this version comes with small, medium and large pen-holders and a cap to easily set the correct level for the pen nib.

The whole design is 3D printable with no need for any addition hardware.

Note: This project is GPLv3 open-source. The github repository for the model (containing the complete OpenSCAD project) can be found at https://github.com/simoninns/silhouette-cameo-4-pen-holder

## Printing instructions
The model has been printed and tested on the Prusa MK3S/MMU2S printer using Prusament PETG filament. All parts fit on a 20x20 printing bed.

Note that the inserts are designed to be printed with the knurled end on the print bed with the rest of the parts at an angle.  This ensures that the layers are diagonal to the pressure on the pen (otherwise the part would simply snap as you inserted it).

The original manufacturer's part uses blue for the small insert, white for the medium and grey for the large.  The overall body (and cap) are both white.

### Recommended print settings

Print settings (for Prusa Slicer) are the same for all included parts:

* Material: PETG
* Layer: 0.20mm (Quality)
* Infill: 15%
* Supports: No Supports

## Assembly
Once printed press the cap onto the top of the holder (if it is a little tight, simply put the cap on and off a few times to losen it up).  The pen adapters simply screw in (the thread should be ready-to-go straight off the printer).

## Tool auto-detection
The Cameo 4 uses an automatic tool detection system which is based on the size of a rectangle of aluminium on the back of the tool.  The pen-holder design has a 14x10mm recess for the aluminium.

A Silhouette Studio file is included in the project that can be used to make the required aluminium.  Use 50mm wide aluminium tape (I used tesa proffessional aluminimum tape (strong) which is 50mm x 25m x 50 microns).  Aluminium tape is used in the heating/air con. industry so it's easy to source.

The included file uses the auto-blade with the following settings:

* Blade Depth: 4
* Force: 14
* Passes: 1
* Speed: 5

Simply cut about 150mm of aluminium tape and affix to a cutting board (make sure it's as smooth as possible). Then, after cutting, place 2 pieces (one on top of the other) in the provided recess on the tool.  The Cameo will then auto-detect the pen holder just like the manufacturer's original part.

## Author
The Silhouette Cameo 4 Pen Holder is designed and maintained by Simon Inns.

# Licensing
## OpenSCAD source files - software license (GPLv3)

    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Non-source-code media - Creative Commons license (Creative Commons BY-SA 4.0)
Please see the following link for details: https://creativecommons.org/licenses/by-sa/4.0/

You are free to:

Share - copy and redistribute the material in any medium or format
Adapt - remix, transform, and build upon the material
for any purpose, even commercially.

This license is acceptable for Free Cultural Works.

The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution - You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.

ShareAlike - If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

No additional restrictions - You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.
