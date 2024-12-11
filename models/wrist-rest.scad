
height = 22;
length = 100;
width = 140;
bezel = 3;

mid_spot = 65;
mid_height = 15;

linear_extrude(width)
difference() {
	polygon([
		[0, 0],
		[0, height],
		[bezel, height],
		[mid_spot, mid_height],
		[length, mid_height],
		[length, 0]
	]);
	polygon([
		[bezel, bezel],
		[bezel, height-bezel],
		[mid_spot, mid_height-bezel],
		[length-bezel, mid_height-bezel],
		[length-bezel, bezel],
	]);
}
