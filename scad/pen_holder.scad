/************************************************************************

    pen_holder.scad
    
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

module insertion_guide()
{
    // Insert guides
    move([0,7.75,27]) hull() {
        move([0,0,0]) cuboid([1,1,10], chamfer=0.2);
        move([0,-0.5,5 + 3]) cuboid([1.25 / 2,1.5 / 2,0.5]);
    }
}

module tool_lock()
{
    difference() {
        union() {
            move([0,0,2.5]) {
                move([+5.25,0,21.5 - 4]) cuboid([1.25, 20, 2.1]);
                move([-5.25,0,21.5 - 4]) cuboid([1.25, 20, 2.1]);
            }

            move([0,0,17]) tube(h=2, od=20, , id=17, center=false);
        }

        move([0,0,17]) cuboid([6.5, 20, 6]);
        move([+10.5,0,17]) cuboid([6.5, 20, 6]);
        move([-10.5,0,17]) cuboid([6.5, 20, 6]);

        move([0,0,18]) cyl(h=6, d=17, center=false);
        move([0,7,19]) cuboid([20, 10, 6]);
    }
}

module holder_body()
{
    // Base of holder
    difference() {
        union() {
            move([0,19/4,7]) cuboid([19,19/2,14], chamfer=0.25, edges=EDGES_TOP+EDGES_BOTTOM+EDGES_BACK);
            cyl(h=22.5, d=19, center=false, chamfer=0.25);
            cyl(h=14, d=17, center=false);
        }

        move([0,9.75,14/2]) cuboid([14,1,10], edges=EDGES_TOP); // Alu marker recess
        tool_lock();
    }

    // Main Shaft
    move([0,0,21.5]) cyl(h=17, d=15.5, center=false, chamfer=0.25); // main shaft

    move([0,0,38]) cyl(h=8, d=14, center=false, chamfer=0.25);
    move([0,0,46 - 1]) cyl(h=5, d=8, center=false, chamfer=0.25); // tip

    // Insertion guides
    move([+1.25 + 0.125,0,0]) insertion_guide();
    move([-1.25 - 0.125,0,0]) insertion_guide();
}

module inner_profile()
{
    // Tip
    hull() {
        move([0,0,17]) cyl(h=51, d=12);
        move([0,0,44.5]) cyl(h=2, d=6);
    }

    // Mid section
    move([0,0,21 - 2]) cyl(h=70, d=6);
    hull() {
        move([0,0,4]) cyl(h=10, d=15.5);
        move([0,0,10+5.5]) cyl(h=1, d=12);
    }
}

module render_pen_holder(crend, toPrint)
{
    if (crend) {
        color(c_white()) {
            difference() {
                holder_body();
                inner_profile();
                move([0,0,3]) trapezoidal_threaded_rod(d=16, l=7, pitch=1.2, thread_angle=30, internal=true, $fn=32);
            }
        }
    } else {
        difference() {
            holder_body();
            inner_profile();

            //move([-10,0,25]) cuboid([20,20,60]); // TEST: show part cross section
            move([0,0,3]) trapezoidal_threaded_rod(d=16, l=7, pitch=1.2, thread_angle=30, internal=true, $fn=32);
        }
    }
}
