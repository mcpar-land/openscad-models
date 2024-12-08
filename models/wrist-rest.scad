
height = 22;
length = 100;
width = 140;
bezel = 5;

// rotate([90, 0, 0])
linear_extrude(width)
difference() {
	polygon([
		[0 , 0],
		[0, height],
		[bezel, height],
		[length, bezel],
		[length, 0],
	]);
	polygon([
		[bezel, bezel],
		[bezel, height - bezel],
		[length - bezel * bezel, bezel],
	]);
}
