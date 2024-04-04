poe_x = 81;
poe_y = 28.25;
poe_z = 17;

poe_ether_y_offset = .5;
poe_ether_y_width = 18.5;
poe_ether_z_offset = 3.25;
poe_ether_z_height = 14.75;

sonar_x = 45;
sonar_y = 20.35;
sonar_z = 1.5;

sonar_diameter = 16;
sonar_edge = 2;
sonar_plug_width = 12.75;
sonar_plug_height = 15.3;

pump_cable = 3.5;
sensor_cable = 3.5;

wall_thickness = 1.5;
post_diameter = 6;
post_hole = 2.65;

difference(){
// Body
union(){
cube([poe_x + wall_thickness * 2,
      poe_y + sonar_y + wall_thickness * 3,
      sonar_z + wall_thickness]);
// Corner Posts
cylinder(d = post_diameter, h = sonar_z + wall_thickness);
translate([poe_x + wall_thickness * 2, 0, 0]){
cylinder(d = post_diameter, h = sonar_z + wall_thickness);    
}
translate([poe_x + wall_thickness * 2, poe_y + sonar_y + wall_thickness * 3, 0]){
cylinder(d = post_diameter, h = sonar_z + wall_thickness);    
}
translate([0, poe_y + sonar_y + wall_thickness * 3, 0]){
cylinder(d = post_diameter, h = sonar_z + wall_thickness);    
}
}
// Corner Holes
translate([0,0,-1]){
cylinder(d = post_hole, h = sonar_z + wall_thickness + 2);
}
translate([poe_x + wall_thickness * 2, 0, -1]){
cylinder(d = post_hole, h = sonar_z + wall_thickness + 2);    
}
translate([poe_x + wall_thickness * 2, poe_y + sonar_y + wall_thickness * 3, -1]){
cylinder(d = post_hole, h = sonar_z + wall_thickness + 2);    
}
translate([0, poe_y + sonar_y + wall_thickness * 3, -1]){
cylinder(d = post_hole, h = sonar_z + wall_thickness + 2);    
}
}