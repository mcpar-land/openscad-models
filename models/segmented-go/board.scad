
line_spacing = 22;
n_lines = 7;

board_length = line_spacing * n_lines;
board_height = 12;
line_thickness = 2;
star_point_thickness = 6;


module bracket_half(diff) {
	circle_radius = 12 + (diff ? 0.5 : 0);
	peg_radius = 6 + (diff ? 0.5 : 0);
	base_width = 32 + (diff ? 1 : 0);
	circle_offset = 14;
	base_height = 4;
	peg_height = 2;
	translate([0,0,diff ? -0.01 : 0]) {
		linear_extrude(base_height + (diff ? 0.01 : 0)) {
			hull() {
				translate([circle_offset, 0])
					circle(circle_radius);
				square([4, base_width], center=true);
			}
		}
	}
	translate([circle_offset, 0, base_height-0.01])
		cylinder(h=peg_height+0.01, r=peg_radius);
}

module bracket() {
	bracket_half(false);
	rotate(180) bracket_half(false);
}


difference() {
	cube([board_length, board_length, board_height]);
		for (i = [0:n_lines-1]) {
			translate([line_spacing * i + (line_spacing/2) - 0.01, board_length/2, board_height])
				cube([line_thickness, board_length + 0.02, line_thickness], center=true);
			translate([board_length/2, line_spacing * i + (line_spacing/2) - 0.01, board_height])
				cube([board_length + 0.02, line_thickness, line_thickness], center=true);
		}

		star_points = [
			[2,2],
			[2,6],
			[4,4],
			[6,2],
			[6,6]
		];

		for (i = star_points) {
			x = i[0]-1.5;
			y = i[1]-1.5;
			translate([line_spacing + line_spacing * x, line_spacing + line_spacing * y, board_height])
				cylinder(h=line_thickness, d=star_point_thickness, center=true);
		}

		// rotation, x translation * board length, y translation * board length
		four_sides = [
			[ 180,   0,   0.5 ],
			[ 90,  0.5, 1   ],
			[ 0, 1,   0.5 ],
			[ 270, 0.5, 0   ]
		];

		for (i = four_sides) {
			rot = i[0];
			x = i[1] * board_length;
			y = i[2] * board_length;

			translate([x,y])
			rotate(rot + 180)
			bracket_half(true);
		}
}

for (i=[1:4]) {
	translate([i*40-20, 200, 0])
	rotate(90)
	bracket();
}
