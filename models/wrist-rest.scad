include <bosl/transforms.scad>
include <bosl/beziers.scad>

$fa = 1;
$fs = 1;

height = 22;
length = 100;
width = 120;
bezel = 1.5;

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
		bez_point(top_bez, 0.25),
		bez_point(top_bez, 0.5),
		bez_point(top_bez, 0.75),
		[length, end_height],
		[length, 0],
	]);
}
