$fa = 1;
$fs = 1;

in_to_mm = 2.54 * 10;

height = 100;
diameter = 230; // max print bed size is 256
thickness = 3;
spool_diameter = 30;
slot_width = 15;
slot_height = height * 0.75;

module slot() {
	slot_thick = 10;
	rotate([-90, 0, 0])
	translate([slot_width / -2, height/-2 - 0.01, slot_thick/-2])
	linear_extrude(slot_thick) {
		rect_height = slot_height-(slot_width/2);
		square([slot_width, rect_height]);
		translate([slot_width/2, rect_height])
			circle(d=slot_width);
	}
}

union() {
	difference() {
		cylinder(h=height, d=diameter, center=true);
		translate([0,0,thickness])
			cylinder(h=height, d=diameter-(thickness*2), center=true);
		translate([0, diameter/2, 0])
			slot();
		translate([0, diameter/-2, 0])
			slot();
	}
	cylinder(h=height, d=spool_diameter, center=true);
}

translate([diameter + 10, 0, 0]) {
	cylinder(h=thickness, d=diameter, center=true);
	translate([0,0,thickness])
	difference() {
		cylinder(h=thickness, d=diameter-(thickness*2)-0.5, center=true);
		cylinder(h=thickness+0.01, d=diameter-(thickness*2)-(thickness*2)-0.5, center=true);
	}
}
