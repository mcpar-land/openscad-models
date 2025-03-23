include <../../vendor/unionRoundMask.scad>


 unionRoundMask(r=1.5, detail=25, q=70) {
	cube([10,10,2], center=true);
	translate([0, 6, -5])
	rotate([20,-10,0])
		cylinder(25, 1, 1, $fn=12);
	// translate([0, 0, 1.5])
	// 	cube([1.5, 10, 3], center=true);
	// rotate(90)
	// 	translate([0,0,1.5])
	// 	cube([3, 10, 3], center=true);
}
