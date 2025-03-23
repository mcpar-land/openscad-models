include <bosl2/std.scad>
include <bosl2/shapes3d.scad>

thickness = 3;
height = 65;
prong_height = 10;
prong_width = 2;
trident_width = 8;

for ( i = [0, 0.33, 0.66] ) {
	rotate([0, 0, 360 * i]) {
		cube([25, thickness, thickness], anchor=[-1, 0, 0]);
		translate([0, 0, thickness/2])
		rotate([0,0, 90])
		prismoid(size1=[thickness, 10], size2=[thickness-1,0], shift=[undef, 4], h=15, anchor=[0, 1, -1]);
	}
}

cube([thickness, thickness, height], anchor=[0, 0, -1]);
rotate([0,0,90])
translate([0,0,height]) {
	prismoid(size1=[thickness,thickness],size2=[thickness,trident_width], h=5);

	for( i = [-1, 0, 1] ) {
		translate([0, (trident_width/2 - prong_width/4) * i, prong_height/2])
		cube([thickness, prong_width/2, 10], anchor=[0, 0, -1]);
	}
}
