include <bosl2/distributors.scad>
include <bosl2/std.scad>

gc_width = 150;
gc_length = 155;
gc_height = 10;

frame_thickness = 4;

$gc_center = [(gc_width + frame_thickness*2)/2, (gc_length + frame_thickness*2)/2, gc_height+frame_thickness];

difference() {
	union() {
		translate([0, 0, gc_height])
		cube([gc_width + frame_thickness * 2, gc_length + frame_thickness * 2, frame_thickness]);


		for (p = square([1, 1])) {
			x = (gc_width + frame_thickness * 2 - gc_height) * p[0];
			y = (gc_length + frame_thickness * 2 - gc_height) * p[1];

			translate([x, y])
			cube([gc_height, gc_height, gc_height + 0.01]);
		}
	}
	translate([frame_thickness, frame_thickness, -0.01])
	cube([gc_width, gc_length, gc_height + 0.01]);

	translate([$gc_center[0], $gc_center[1], gc_height])
	translate([0, 0, -0.01])
	grid_copies(spacing=10, stagger=true, n=[29,17])
		zrot(180/6)
		cylinder(d=10, h=frame_thickness + 0.02, $fn=6);
}

