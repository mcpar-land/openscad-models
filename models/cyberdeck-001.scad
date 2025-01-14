monitor_width = 146.7;
monitor_height = 78.5;
monitor_thickness = 16;

keyboard_width = 152;
keyboard_height = 59;
keyboard_thickness = 12;

thickness = 2;
lip = 4;

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
			monitor_width + thickness*2,
			(thickness+lip)/2,
			(thickness+lip)/2,
		]);

		translate([-thickness, -thickness, -thickness])
		cube([
			(thickness+lip)/2,
			monitor_height + thickness*2,
			(thickness+lip)/2,
		]);

		translate([monitor_width-thickness/2, -thickness, -thickness])
		cube([
			(thickness+lip)/2,
			monitor_height + thickness*2,
			(thickness+lip)/2,
		]);

		translate([-thickness, -thickness, monitor_thickness-thickness/2])
		cube([
			monitor_width + thickness*2,
			(thickness+lip)/2,
			(thickness+lip)/2,
		]);

		translate([-thickness, -thickness, monitor_thickness-thickness/2])
		cube([
			(thickness+lip)/2,
			monitor_height + thickness*2,
			(thickness+lip)/2,
		]);

		translate([monitor_width-thickness/2, -thickness, monitor_thickness-thickness/2])
		cube([
			(thickness+lip)/2,
			monitor_height + thickness*2,
			(thickness+lip)/2,
		]);

		n_bars = 6;
		for (i = [1:n_bars]) {
			frac = monitor_width/n_bars;
			translate([frac*i - frac/2, -thickness, 0])
			cube([
				lip,
				lip,
				monitor_thickness,
			]);
		}
	}
	monitor();
}

// keyboard();
