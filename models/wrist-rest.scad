include <bosl/transforms.scad>
include <bosl/beziers.scad>

$fa = 1;
$fs = 1;

height = 22;
length = 100;
width = 120;
bezel = 2.5;
rounding = 1;

end_height = 16;

top_bez = [
	[0, height],
	[40, end_height],
	[50, end_height],
	[80, end_height],
	[length, end_height]
];

linear_extrude(width)
shell2d(-bezel, or=rounding, ir=rounding, round=rounding, fill=rounding) {
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

