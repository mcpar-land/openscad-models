$fa = 1;
$fs = 1;

cutoff = 9.5;

module piece() {
	rotate_extrude() {
		difference() {
			hull() {
				circle(d=13);
				translate([3, 0])
					circle(d=10);
				translate([7, 0])
					circle(d=5);
			}
			translate([-100, -50])
				square(100);
			translate([0, cutoff, 0])
				square([80, 10], center=true);
			translate([0, cutoff * -1, 0])
				square([80, 10], center=true);
		}
	}
}

sep = 22;

for (i = [1:1]) {
	for (j = [1:1]) {
		translate([sep*i, sep * j])
			piece();
	}
}
