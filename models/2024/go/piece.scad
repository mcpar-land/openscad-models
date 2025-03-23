$fa = 1;
$fs = 1;

piece_diameter = 22;
piece_height = 6.5;
piece_lip_height = 3;
piece_lip_diameter = 18;

piece_row_sep = 4;
piece_guide_width = 4;
piece_guide_height = 0.2;

module piece() {
	translate([0,0,piece_height/2]) {
		cylinder(h=piece_height, d=piece_lip_diameter, center=true);
		cylinder(h=piece_lip_height, d=piece_diameter, center=true);
	}
}

module piece_row(len) {
	for (i = [1:len]) {
		translate([(i-1) * (piece_diameter + piece_row_sep), 0, 0])
		piece();
	}

	translate([0, -piece_guide_width/2, 0])
	cube([(piece_diameter + piece_row_sep)*(len-1), piece_guide_width, piece_guide_height]);
}

n_pieces_x = 8;
n_pieces_y = 2;

for (i = [1:n_pieces_y]) {
	translate([0, (i-1) * (piece_diameter + piece_row_sep), 0])
	piece_row(n_pieces_x);
}
