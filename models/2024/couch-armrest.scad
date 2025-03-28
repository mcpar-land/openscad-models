include <bosl/transforms.scad>
include <bosl/beziers.scad>

module hex_filled_surface(width, height, thickness, lip_thickness=2, hex_size=5, hex_spacing=1) {
	poly = [
		[0, 0],
		[0, height],
		[width, height],
		[width, 0]
	];
	poly_hex = [
		[-hex_size/2,-hex_size/2],
		[-hex_size/2,height+hex_size/2],
		[width+hex_size/2,height+hex_size/2],
		[width+hex_size/2, -hex_size/2],
	];

	difference() {
		linear_extrude(thickness)
			polygon(poly);
		translate([0,0,-0.1])
		grid2d(spacing=hex_size-1+hex_spacing, stagger=true, in_poly=poly_hex)
			zrot(180/6) cylinder(d=hex_size, h=thickness+0.2, $fn=6);
	}

linear_extrude(thickness)
	shell2d(-lip_thickness) polygon(poly);
}

thickness = 6;
hex_size = 10;

hex_filled_surface(250/2, 256, thickness, lip_thickness=thickness, hex_size=hex_size);
translate([0,0,thickness])
rotate([-90,0,0])
	hex_filled_surface(250/2, 50, thickness, lip_thickness=thickness, hex_size=hex_size);
translate([0,256-thickness,thickness])
rotate([-90,0,0])
	hex_filled_surface(250/2, 50, thickness, lip_thickness=thickness, hex_size=hex_size);
