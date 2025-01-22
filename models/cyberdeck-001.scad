include <bosl2/std.scad>
include <bosl2/shapes3d.scad>

monitor_width = 147.2; // actually 146.7 but needs give
monitor_height = 79; // actually 78.5 but needs give
monitor_thickness = 16.5; // actually 16 but needs give

keyboard_width = 152;
keyboard_height = 60;
keyboard_thickness = 12;
keyboard_chamfer = 2.25;

thickness = 2.5;
lip = 5;


module monitor() {
	translate([thickness, thickness, thickness])
		cube([monitor_width, monitor_height, monitor_thickness]);
}

module keyboard() {
	translate([0, -keyboard_height, thickness])
		cuboid(
			[keyboard_width, keyboard_height, keyboard_thickness],
			anchor=FRONT+LEFT+BOT,
			chamfer=keyboard_chamfer
		);
}

%monitor();
%keyboard();

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

keyboard_clip_width = 40;
keyboard_clip_gap = 1;

_full_width = monitor_width+thickness*2;
_half_width = _full_width/2;

difference() {
	union() {
		translate([_half_width, 0, 0]) {
			cuboid([
				keyboard_clip_width,
				keyboard_height+thickness,
				keyboard_thickness+thickness-0.01
			], anchor=BACK+BOT);
			cuboid(
				[keyboard_clip_width, keyboard_chamfer, monitor_thickness+thickness*2],
				anchor=BACK+BOT,
				chamfer=keyboard_chamfer,
				edges=[FRONT+TOP]
			);
		}
	}
	keyboard();
}

translate([-lip, 0, 0])
cuboid(
	[
		_half_width + lip - keyboard_clip_width/2 - keyboard_clip_gap,
		keyboard_height,
		thickness,
	],
	anchor=BACK+BOT+LEFT,
	edges=[FWD+LEFT],
	chamfer=10
);

translate([_full_width+lip, 0, 0])
cuboid(
	[
		_half_width + lip - keyboard_clip_width/2 - keyboard_clip_gap,
		keyboard_height,
		thickness,
	],
	anchor=BACK+BOT+RIGHT,
	edges=[FWD+RIGHT],
	chamfer=10
);

module side_wedge() {
	scale([1, -1, 1])
	translate([0,0,thickness])
	wedge([lip, 50, monitor_thickness+thickness]);
	cuboid(
		[lip, lip, monitor_thickness+thickness*2],
		anchor=FRONT+BOT+LEFT,		
		chamfer=keyboard_chamfer,
		edges=[BACK+LEFT]
	);
}

translate([-lip, 0, 0])
	side_wedge();

translate([_full_width+lip, 0, 0])
	scale([-1, 1, 1])
	side_wedge();
