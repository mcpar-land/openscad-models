in_to_mm = 2.54 * 10;

$fa = 1;
$fs = 1;

thickness = 0.33 * in_to_mm;
shelf_thickness = 1.5 * in_to_mm; // thickness of an ikea kallax shelf
length_lower = 3 * 10; // non negotiable with the kallax door insert
lip_radius = 1 * in_to_mm;
hole_pos = 0.57;

module round_corner(r, pos) {
	intersection() {
		square([r, r]);
		translate(
			pos == 1 ? [0, 0] :
			pos == 2 ? [0, r] : 
			pos == 3 ? [r, r] :
			pos == 4 ? [r, 0] :
			[0, 0]
		)
			circle(r);
	}
}

linear_extrude(0.5 * in_to_mm) {
	difference() {
		round_corner(lip_radius, 3);
		translate([lip_radius * hole_pos, lip_radius * hole_pos])
			circle(6);
	}
	translate([lip_radius-thickness, lip_radius])
		square([thickness, length_lower]);
	translate([lip_radius-thickness, lip_radius+length_lower])
		round_corner(thickness, 4);
	translate([lip_radius, lip_radius+length_lower])
		square([shelf_thickness, thickness]);
	translate([lip_radius+shelf_thickness, lip_radius+length_lower])
		round_corner(thickness, 1);
	translate([lip_radius + shelf_thickness, lip_radius + thickness])
		square([thickness, length_lower - thickness]);
	translate([lip_radius + shelf_thickness, lip_radius])
		round_corner(thickness, 2);
}
