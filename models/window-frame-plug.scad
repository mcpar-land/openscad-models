include <bosl2/std.scad>
include <bosl2/shapes2d.scad>
include <bosl2/shapes3d.scad>

gap_l = 138;
gap_m = 173;
gap_r = 136;

latch_width = 76.5;

lip_height = 6;

canyon_width = 12;

module tetris_l(width, has_grip=true) {
	up(lip_height)
		cube([canyon_width, width, 100], anchor=TOP+FRONT+LEFT);
	if (has_grip) {
	right(canyon_width-0.01)
		cube([20, width+0.01, lip_height]);
	}
}

s = 20 + canyon_width;

xdistribute(spacing=10, sizes=[s,s,s,s,s,s,s]) {

	tetris_l(latch_width/2);

	union() {
		tetris_l(gap_l - latch_width/2);
		back(gap_l-latch_width/2)
			tetris_l(latch_width/2, has_grip=false);
	}

	union() {
		tetris_l(latch_width/2, has_grip=false);
		back(latch_width/2)
			tetris_l(gap_m/2-latch_width/4);
	}

	tetris_l(latch_width/2);

	union() {
		tetris_l(gap_m/2-latch_width/4);
		back(gap_m/2-latch_width/4)
			tetris_l(latch_width/2, has_grip=false);
	}

	union() {
		tetris_l(latch_width/2, has_grip=false);
		back(latch_width/2)
			tetris_l(gap_r-latch_width/2);
	}
	
	tetris_l(latch_width/2);
}

// color("red")
// 	tetris_l(latch_width/2);

// color("orange")
// back(latch_width/2) {
// 	tetris_l(gap_l - latch_width/2);
// 	back(gap_l-latch_width/2)
// 		tetris_l(latch_width/2, has_grip=false);
// }

// color("red")
// back(gap_l + latch_width/2) {
// 	tetris_l(latch_width/2, has_grip=false);
// 	back(latch_width/2)
// 		tetris_l(gap_m/2-latch_width/4);
// }

// color("orange")
// 	back(gap_l + latch_width + gap_m/2-latch_width/4)
// 	tetris_l(latch_width/2);

// color("red")
// back(gap_l+latch_width+gap_m/2+latch_width/4) {
// 	tetris_l(gap_m/2-latch_width/4);
// 	back(gap_m/2-latch_width/4)
// 		tetris_l(latch_width/2, has_grip=false);
// }

// color("orange")
// back(gap_l+latch_width+gap_m+latch_width/2) {
// 	tetris_l(latch_width/2, has_grip=false);
// 	back(latch_width/2)
// 		tetris_l(gap_r-latch_width/2);
// }

// color("red")
// 	back(gap_l+latch_width+gap_m+latch_width+gap_r-latch_width/2)
// 	tetris_l(latch_width/2);


module window() {
	window_width = gap_l + latch_width + gap_m + latch_width + gap_r;
	cube([0.01, window_width, 100], anchor=FRONT+CENTER + TOP);

	move([canyon_width, 0, 0])
		cube([30, window_width, 100], anchor=FRONT+LEFT+TOP);

	move([canyon_width, gap_l, 0])
		cube([30, latch_width, 10]);

	move([0, gap_l, lip_height])
		cube([canyon_width, latch_width, 4]);

	move([canyon_width, gap_l+latch_width+gap_m, 0])
		cube([30, latch_width, 10]);

	move([0, gap_l+latch_width+gap_m, lip_height])
		cube([canyon_width, latch_width, 4]);
}

%window();
