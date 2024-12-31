include <bosl2/std.scad>
include <bosl2/shapes3d.scad>
include <bosl2/joiners.scad>

$fa = 1;
$fs = 1;

diameter = 80;
thickness = 5;
hole_size = 30;
cross_size = 4;
ledge_width = 10;


clip_length = 10;
clip_width = 10;
clip_thickness = 2;

module clip(type, depth) {
	rabbit_clip(
		type=type,
		length=clip_length,
		width=clip_width,
		snap=1,
		thickness=1,
		depth=depth,
		lock=true
	);
}

module half_dome() {
	difference() {
		sphere(d=diameter);
		difference() {
			sphere(d=diameter-thickness);
			translate([0, diameter/2, 0])
			cube([diameter, ledge_width, diameter], center=true);
			translate([0, -diameter/2, 0])
			cube([diameter, ledge_width, diameter], center=true);
		}
		union() {
			difference() {
				cylinder(h=diameter, d=hole_size, center=true);
				cube([cross_size, hole_size, diameter], center=true);
			}
		}
		cylinder(d=diameter, h=diameter/2);
		translate([0, diameter/2-3, 0])
			clip(type="socket", depth=clip_thickness+0.1);
		translate([0, -(diameter/2-3), 0])
			clip(type="socket", depth=clip_thickness+0.1);
	}
}

module bowl_and_clip() {
	xdistribute(sizes=[diameter, clip_width]) {
		rotate([0,180,0])
			half_dome();
		clip(type="double", depth=clip_thickness);
	}
}

ydistribute(sizes=[diameter, diameter, diameter/2]) {
	bowl_and_clip();
	bowl_and_clip();
	octahedron(size=diameter/2);
}
