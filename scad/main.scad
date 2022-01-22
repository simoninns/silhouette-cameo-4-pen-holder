/************************************************************************

    main.scad
    
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
include <pen_holder.scad>
include <cap.scad>
include <inserts.scad>

// Rendering resolution
$fn=50;

// Select rendering parameters
use_colour = "Colour"; // [Colour, No colour]
for_printing = "Display"; // [Display, Printing]
display_pen_holder = "Yes"; // [Yes, No]
display_cap = "Yes"; // [Yes, No]
display_holder_insert_small = "Yes"; // [Yes, No]
display_holder_insert_medium = "Yes"; // [Yes, No]
display_holder_insert_large = "Yes"; // [Yes, No]

// Render the required items
module main()
{
    crend = (use_colour == "Colour") ? true:false;
    toPrint = (for_printing == "Printing") ? true:false;

    d_pen_holder = (display_pen_holder == "Yes") ? true:false;
    d_cap = (display_cap == "Yes") ? true:false;
    d_holder_insert_small = (display_holder_insert_small == "Yes") ? true:false;
    d_holder_insert_medium = (display_holder_insert_medium == "Yes") ? true:false;
    d_holder_insert_large = (display_holder_insert_large == "Yes") ? true:false;


    if (d_pen_holder) {
        render_pen_holder(crend, toPrint);
    }

    if (d_cap) {
        render_cap(crend, toPrint);
    }

    if (d_holder_insert_small) {
        render_holder_insert_small(crend, toPrint);
    }

    if (d_holder_insert_medium) {
        render_holder_insert_medium(crend, toPrint);
    }

    if (d_holder_insert_large) {
        render_holder_insert_large(crend, toPrint);
    }
}

main();