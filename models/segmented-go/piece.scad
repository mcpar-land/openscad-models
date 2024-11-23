$fa = 1;
$fs = 1;

cutoff = 9.5;

module cross_section() {
	polygon([
		[0.0,  3.5],
		[7.0,  3.5],
		[10.0,  2.7],
		[11.5, 1.5],
		[12.5, 0.2],
		[12.5, 0],
		[0, 0],
	]);
}


// translate([0,0, 10])
rotate_extrude(angle=1) {
	difference() {
		hull() {
			cross_section();
			mirror([0,1,0])
			cross_section();
		}
		translate([-100, -50])
			square(100);
		translate([0, cutoff, 0])
			square([80, 10], center=true);
		translate([0, cutoff * -1, 0])
			square([80, 10], center=true);
	}
}
