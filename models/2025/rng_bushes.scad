include <bosl2/std.scad>
include <bosl2/shapes2d.scad>

// $fn = 200;

module rng_bushes(
	seed = 17,
	height = 60,
	radius = 25,
	min_bush_radius = 5,
	max_bush_radius = 10,
	n = 2500,
) {

	x = rands(radius * -1, radius, n, seed);
	y = rands(radius * -1, radius, n, seed+1);
	z = rands(0, height, n, seed + 10);
	sizes = rands(min_bush_radius , max_bush_radius+1, n, seed+2);

	points = [ for (i = [0 : n-1]) [x[i], y[i], z[i], sizes[i]] ];

	intersection() {
	
		union() {
			for(point = points) {
				z = min(0, height - point[2], height - point[3]);
				translate([point[0], point[1], z])
					sphere(point[3]);
			}
		}

		linear_extrude(height) {
			hexagon(ir=radius);
		}
	}

}

rng_bushes();
