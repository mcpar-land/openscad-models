monitor_width = 147.2; // actually 146.7 but needs give
monitor_height = 79; // actually 78.5 but needs give
monitor_thickness = 16.5; // actually 16 but needs give

keyboard_width = 152;
keyboard_height = 59;
keyboard_thickness = 12;

thickness = 2.5;
lip = 5;


module monitor() {
	translate([thickness, thickness, thickness])
		cube([monitor_width, monitor_height, monitor_thickness]);
}

module keyboard() {
	cube([keyboard_width, keyboard_height, keyboard_thickness]);
}

%monitor();

difference() {
	union() {

		cube([
			monitor_width + thickness * 2,
			thickness + lip,
			monitor_thickness + thickness * 2,
		]);

		cube([
			thickness + lip,
			monitor_height + thickness * 2,
			monitor_thickness + thickness * 2,
		]);

		translate([thickness + monitor_width - lip, 0, 0])
			cube([
				thickness + lip,
				monitor_height + thickness * 2,
				monitor_thickness + thickness * 2,
			]);
	

	}
	monitor();
	translate([thickness, thickness, thickness])
		translate([monitor_width-thickness, lip, -thickness-0.01])
		cube([10, monitor_height-lip*2, monitor_thickness/2 + thickness]);
}

module handle_polygon() {
	trapezoid_factor = 20;
	pi_height = 30;
	trapezoid_width = monitor_height + thickness * 2;
	translate([0, -trapezoid_width/2])
	polygon([
		[0, 0],
		[pi_height, trapezoid_factor],
		[pi_height, trapezoid_width-trapezoid_factor],
		[0, trapezoid_width],
	]);
}

module handle() {
	scale_f = 0.825;
	translate([0, (monitor_height+thickness*2)/2 ])
	rotate([0, 90])
	difference() {
		linear_extrude(lip+thickness)
			handle_polygon();
		translate([-0.01, 0, -0.01])
		linear_extrude(lip+thickness + 0.02)
			scale([scale_f, scale_f])
			handle_polygon();
	}
}

handle();
translate([monitor_width +thickness -  lip, 0, 0])
	handle();

// keyboard();
