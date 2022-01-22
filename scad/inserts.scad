/************************************************************************

    inserts.scad
    
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
use <BOSL/threading.scad>

// Local includes
include <colour_scheme.scad>

module holder_insert_base()
{
    move([0,0,3]) trapezoidal_threaded_rod(d=16, l=7, pitch=1.2, thread_angle=30, internal=false, $fn=32);
    move([0,0,-3.75 - 4]) cyl(h=14, d=14.75, chamfer1=0.25); // Top
    move([0,0,-0.5]) cyl(h=1, d=16, chamfer1=0.5); // Top lip

    // Knurled top outer
    for(rota=[0: 360/32: 360]) { // for(variable = [start : increment : end])
        rotate([0,0,rota]) move([7.25,0,-7]) cyl(h=14, d=1, chamfer=0.25); // Top
    }
}

module holder_insert_small()
{
    difference() {
        union() {
            difference() {
                union() {
                    holder_insert_base();

                    // Top
                    move([0,0,7.75]) cyl(h=16, d=14, chamfer2=1); // Top
                }

                move([0,0,4]) cyl(h=25, d=8.5); // Top minimum diameter
                move([0,0,3.25 - 2]) cyl(h=26, d=12, chamfer2=1); // Main minimum diameter

                // Split up the top so it can contract
                for(rota=[0: 360/8: 360]) {
                    rotate([0,0,rota]) move([0,0,13.5]) cuboid([1.5,20,10]);
                }
            }

            // Knurled top inner
            for(rota=[0: 360/8: 360]) { // for(variable = [start : increment : end])
                rotate([0,0,rota + (360/16)]) move([5.75,0,0]) {
                    cyl(h=30, d=1); // Top
                    move([0.5,0,0]) cuboid([1,1,30]);
                }
            }
        }

    // Cut a 20 degree angle from the base
    move([0,0,-15]) rotate([0,15,0]) cyl(h=10,d=25);
    }
}

module holder_insert_medium()
{
    difference() {
        union() {
            difference() {
                union() {
                    holder_insert_base();

                    // Top
                    move([0,0,7.75]) cyl(h=16, d=14, chamfer2=1); // Top
                }

                move([0,0,4]) cyl(h=25, d=10); // Top minimum diameter
                move([0,0,3.25 - 2]) cyl(h=26, d=12, chamfer2=1); // Main minimum diameter

                // Split up the top so it can contract
                for(rota=[0: 360/8: 360]) {
                    rotate([0,0,rota]) move([0,0,13.5]) cuboid([1.5,20,10]);
                }
            }

            // Knurled top inner
            for(rota=[0: 360/8: 360]) { // for(variable = [start : increment : end])
                rotate([0,0,rota + (360/16)]) move([6.25,0,0]) cyl(h=30, d=1); // Top
            }
        }

    // Cut a 20 degree angle from the base
    move([0,0,-15]) rotate([0,15,0]) cyl(h=10,d=25);
    }
}

module holder_insert_large()
{
    difference() {
        union() {
            difference() {
                union() {
                    holder_insert_base();

                    // Top
                    move([0,0,7.75]) cyl(h=16, d=14, chamfer2=1); // Top
                }

                move([0,0,4]) cyl(h=25, d=11.5); // Top minimum diameter
                move([0,0,3.25 - 2]) cyl(h=26, d=12, chamfer2=1); // Main minimum diameter

                // Split up the top so it can contract
                for(rota=[0: 360/8: 360]) {
                    rotate([0,0,rota]) move([0,0,13.5]) cuboid([1.5,20,10]);
                }
            }
        }

    // Cut a 20 degree angle from the base
    move([0,0,-15]) rotate([0,15,0]) cyl(h=10,d=25);
    }
}

// Blue, small holder
module render_holder_insert_small(crend, toPrint)
{
    if (crend) {
        color(c_blue()) {
            if (toPrint) move([0,0,9]) rotate([0,-15,0]) holder_insert_small();
            else holder_insert_small();
        }
    } else {
        if (toPrint) move([0,0,9]) rotate([0,-15,0]) holder_insert_small();
            else holder_insert_small();
    }
}    

// White, medium holder
module render_holder_insert_medium(crend, toPrint)
{
    if (crend) {
        color(c_white()) {
            if (toPrint) move([0,0,9]) rotate([0,-15,0]) holder_insert_medium();
            else holder_insert_medium();
        }
    } else {
        if (toPrint) move([0,0,9]) rotate([0,-15,0]) holder_insert_medium();
        else holder_insert_medium();
    }
}

// Grey, large holder
module render_holder_insert_large(crend, toPrint)
{
    if (crend) {
        color(c_grey()) {
            if (toPrint) move([0,0,9]) rotate([0,-15,0]) holder_insert_large();
            else holder_insert_large();
        }
    } else {
        if (toPrint) move([0,0,9]) rotate([0,-15,0]) holder_insert_large();
        else holder_insert_large();
    }
}    