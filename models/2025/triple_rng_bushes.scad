include <bosl2/std.scad>
include <bosl2/shapes2d.scad>
use <rng_bushes.scad>
use <rng_bushes_frame.scad>

printing_offset = 100;

module rng_bush_vase(height=10,seed) {
	bush_height = 5;
	radius = 25;
	wall_width = 4;
	bush_sink = 2;
	color("gray")
		rng_bushes_frame(radius=radius, depth=bush_height+bush_sink, width=wall_width, height=height);
	color("white")
	translate([0, 0, height-bush_height-bush_sink + printing_offset])
		rng_bushes(seed=seed, radius=radius-wall_width, height=bush_height, n=50);
}

rng_bush_vase(height=20, seed=10);
translate([0,50,0])
	rng_bush_vase(height=40, seed=11);
rotate(60)
	translate([0,50,0])
	rng_bush_vase(height=60, seed=12);
