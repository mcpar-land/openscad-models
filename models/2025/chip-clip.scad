include <bosl2/std.scad>
include <bosl2/shapes2d.scad>

clip_angle = 30;
clip_len = 70;
clip_width = 5;
teeth_count = 10;

module chip_clip_half () {
	rect([clip_len, clip_width], anchor=BOTTOM+LEFT, rounding=[0,0,0,clip_width]);
	translate([clip_len, clip_width]) {
		%right_triangle([teeth_count*2, 10], anchor=BOTTOM+RIGHT);
	}
}

chip_clip_half();
