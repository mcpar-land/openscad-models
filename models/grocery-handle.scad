include <bosl2/std.scad>;
include <bosl2/rounding.scad>;

width = 120;
handle_thickness = 25;
handle_gap = 40;
thickness = 25;


difference() {
	cube([width, handle_thickness*2 + handle_gap, thickness]);
}
