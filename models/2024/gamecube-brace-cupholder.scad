include <gamecube-brace.scad>

$fa = 1;
$fs = 1;

cup_diameter = 100;
cup_lip = 4;
cup_height = 60;

cup_od = cup_diameter + cup_lip*2;

translate($gc_center)
translate([0,0,-frame_thickness])
tube(
	h=cup_height+frame_thickness,
	id1=cup_diameter,
	od1=cup_od+10,
	id2=cup_diameter,
	od2=cup_od,
	ichamfer2=cup_lip/2,
	anchor=[0, 0, -1]
);
