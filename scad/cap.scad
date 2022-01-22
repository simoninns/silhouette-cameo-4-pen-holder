/************************************************************************

    cap.scad
    
    Silhouette Cameo 4 Pen Holder
    Copyright (C) 2022 Simon Inns
    
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
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

// Local includes
include <colour_scheme.scad>

module cap()
{
    move([0,0,4]) {
        difference() {
            cyl(h=8, d=10, chamfer2=0.75);
            move([0,0,-8 + 6.5]) cyl(h=8, d=8, chamfer2=0.25); // 6.5mm deep

            // Knurled top outer
            for(rota=[0: 360/16: 360]) { // for(variable = [start : increment : end])
                rotate([0,0,rota]) move([5.25,0,3.25 - 4.5]) cyl(h=7, d=0.75, chamfer2=0.25); // Top
            }
        }
    }
}

module render_cap(crend, toPrint)
{
    if (crend) {
        color(c_white()) {
            if (toPrint) move([0,0,8]) rotate([180,0,0]) cap();
                else move([0,0,46]) cap();
        }
    } else {
        if (toPrint) move([0,0,8]) rotate([180,0,0]) cap();
        else move([0,0,46]) cap();
    }
}