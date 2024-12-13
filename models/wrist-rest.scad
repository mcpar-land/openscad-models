include <bosl/transforms.scad>
include <bosl/beziers.scad>

$fa = 1;
$fs = 1;

height = 22;
length = 100;
width = 120;
bezel = 2.5;

end_height = 16;

top_bez = [
	[0, height],
	[35, 12],
	[length, end_height]
];

linear_extrude(width)
shell2d(-bezel, or=bezel*2, ir=bezel, round=bezel*2, fill=bezel) {
	polygon([
		[0, 0],
		[0, height],
		bez_point(top_bez, 0.125),
		bez_point(top_bez, 0.25),
		bez_point(top_bez, 0.375),
		bez_point(top_bez, 0.5),
		bez_point(top_bez, 0.625),
		bez_point(top_bez, 0.75),
		bez_point(top_bez, 0.875),
		[length, end_height],
		[length, 0],
	]);
}

b2 = bezel * 2;

translate([0, (bezel+0.1), 0])
rotate([90, 0, 0])
grid2d(spacing=6, stagger=true, in_poly=[
	[bezel * 2 + 2, bezel],
	[bezel * 2 + 2, width - bezel],
	[length - (bezel * 2), width - bezel],
	[length - (bezel * 2), bezel]
])
	zrot(180/6) cylinder(d=5, h=bezel+0.2, $fn=6);
