monitor_width = 147.2; // actually 146.7 but needs give
monitor_height = 79; // actually 78.5 but needs give
monitor_thickness = 16.5; // actually 16 but needs give

keyboard_width = 152;
keyboard_height = 59;
keyboard_thickness = 12;

thickness = 2.5;
lip = 6;

module monitor() {
	cube([monitor_width, monitor_height, monitor_thickness]);
}

module keyboard() {
	cube([keyboard_width, keyboard_height, keyboard_thickness]);
}

%monitor();

difference() {
	union() {
		positions = [
			[ -thickness,        -thickness,         -thickness            ],
			[ monitor_width-lip, -thickness,         -thickness            ],
			[ monitor_width-lip, monitor_height-lip, -thickness            ],
			[ -thickness,        monitor_height-lip, -thickness            ],
			[ -thickness,        -thickness,         monitor_thickness-lip ],
			[ monitor_width-lip, -thickness,         monitor_thickness-lip ],
			[ monitor_width-lip, monitor_height-lip, monitor_thickness-lip ],
			[ -thickness,        monitor_height-lip, monitor_thickness-lip ],
		];
		for (i = positions) {
			translate(i)
			cube(thickness+lip);
		}

		translate([-thickness, -thickness, -thickness])
			cube([
				monitor_width + thickness * 2,
				thickness,
				monitor_thickness + thickness * 2,
			]);

		translate([-thickness, -thickness, -thickness])
			cube([
				thickness,
				monitor_height + thickness * 2,
				monitor_thickness + thickness * 2,
			]);

		translate([monitor_width, -thickness, -thickness])
			cube([
				thickness,
				monitor_height + thickness * 2,
				monitor_thickness + thickness * 2,
			]);

	}
	monitor();
	translate([monitor_width-thickness, lip, -thickness-0.01])
		cube([10, monitor_height-lip*2, monitor_thickness/2 + thickness]);
}

// keyboard();
