include <bosl2/std.scad>
include <bosl2/shapes2d.scad>
use <rng_bushes.scad>

module rng_bushes_frame(
	radius=25,
	width=10,
	depth=2,
	height=10,
) {
	difference() {
		linear_extrude(height)
			hexagon(ir=radius);
		if (depth > 0) {
			translate([0, 0, height-depth])
				linear_extrude(depth+0.01)
				hexagon(ir=radius-width);
		}
	}
}

// rng_bushes_frame();
rng_bushes_frame(100, height=20, depth=10);
