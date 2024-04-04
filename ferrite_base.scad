$fn=60;
antenna_length = 204;
antenna_diameter = 17.1;
base_width = 18;
corner_size = base_width/cos(60);
base_length = antenna_length + (2 * corner_size);
base_height = 4;
antenna_clip_height = 4;
antenna_clip_thickness = 4;
base_center_x = base_length/2;
antenna_clip_split = 150;
antenna_clip_od = antenna_diameter + (antenna_clip_thickness * 2);
antenna_retention = 3;
interlock_diameter = 6;
interlock_neck = 4;
interlock_offset = 5;
interlock_tolerance = .1;
screw_tap = 2.7;
screw_free = 3.1;
screw_seat = 6;
amp_screw_width = 25;
amp_screw_height = 39;
amp_screw_boarder = 4;
amp_height=48;

difference(){
union(){
cube([base_length,base_width,base_height]);
translate([base_center_x,0,base_height]){
translate([antenna_clip_split/2 - antenna_clip_thickness/2,0,0]){
cube([antenna_clip_thickness,base_width,antenna_clip_height+antenna_clip_thickness]);
translate([0,base_width/2,antenna_clip_height+(antenna_clip_od/2)]){
difference(){
rotate([0,90,0]){
difference(){
cylinder(h=antenna_clip_thickness, d=antenna_clip_od);
translate([0,0,-1]){
cylinder(h=antenna_clip_thickness+2, d=antenna_diameter);
}
}
}
translate([-1,-(antenna_clip_od/2),antenna_retention]){
cube([antenna_clip_thickness + 2,antenna_clip_od,antenna_clip_od/2]);
}
}
}
}
translate([-(antenna_clip_split/2 + antenna_clip_thickness/2),0,0]){
cube([antenna_clip_thickness,base_width,antenna_clip_height+antenna_clip_thickness]);
translate([0,base_width/2,antenna_clip_height+(antenna_clip_od/2)]){
difference(){
rotate([0,90,0]){
difference(){
cylinder(h=antenna_clip_thickness, d=antenna_clip_od);
translate([0,0,-1]){
cylinder(h=antenna_clip_thickness+2, d=antenna_diameter);
}
}
}
translate([-1,-(antenna_clip_od/2),antenna_retention]){
cube([antenna_clip_thickness + 2,antenna_clip_od,antenna_clip_od/2]);
}
}
}
}
}
rotate([0,0,30]){
translate([amp_screw_boarder,corner_size/2 - amp_screw_width/2,0]){
cylinder(h=base_height+2,d=screw_seat);
translate([amp_screw_height,0,0]){
cylinder(h=base_height+2,d=screw_seat);
}
}
cube([amp_height,corner_size/2,base_height]);
translate([corner_size/2-interlock_neck/2-interlock_offset,corner_size/2,0]){
cube([interlock_neck,interlock_neck+interlock_diameter/2,base_height]);
translate([interlock_neck/2,interlock_neck+interlock_diameter/2,0]){
cylinder(h=base_height, d = interlock_diameter);
}
}
}
translate([base_length,0,0]){
rotate([0,0,60]){
cube([corner_size/2,amp_height,base_height]);
translate([corner_size/2 - amp_screw_width/2,amp_screw_boarder,0]){
cylinder(h=base_height+2,d=screw_seat);
translate([0,amp_screw_height,0]){
cylinder(h=base_height+2,d=screw_seat);
}
}
translate([corner_size/2,corner_size/2-interlock_neck/2+interlock_offset,0]){
cube([interlock_neck+interlock_diameter/2,interlock_neck,base_height]);
translate([interlock_neck+interlock_diameter/2,interlock_neck/2,0]){
cylinder(h=base_height, d = interlock_diameter);
}
}
}
}
}
// Interlocks
rotate([0,0,30]){
translate([amp_screw_boarder,corner_size/2 - amp_screw_width/2,-1]){
cylinder(h=base_height+4,d=screw_tap);
translate([amp_screw_height,0,0]){
cylinder(h=base_height+4,d=screw_tap);
}
}
translate([corner_size/2 - interlock_neck/2 + interlock_offset,corner_size/2-(interlock_neck+interlock_diameter/2),-1]){
cube([interlock_neck,interlock_neck+interlock_diameter,base_height + 2]);
translate([interlock_neck/2,0,0]){
cylinder(h=base_height + 2, d = interlock_diameter);
}
}
}
translate([base_length,0,0]){
rotate([0,0,60]){
translate([corner_size/2 - amp_screw_width/2,amp_screw_boarder,-1]){
cylinder(h=base_height+4,d=screw_tap);
translate([0,amp_screw_height,0]){
cylinder(h=base_height+4,d=screw_tap);
}
}
translate([corner_size/2 - (interlock_neck+interlock_diameter/2),corner_size/2 - interlock_neck/2 - interlock_offset,-1]){
cube([interlock_neck+interlock_diameter,interlock_neck,base_height + 2]);
translate([0,interlock_neck/2,0]){
cylinder(h=base_height + 2, d = interlock_diameter);
}
}
}
}
translate([base_center_x,base_width/2,-.01]){
translate([25-base_length/2,0,0]){
cylinder(h=base_height + .02, d1=4, d2=5);
}
translate([-25+base_length/2,0,0]){
cylinder(h=base_height + .02, d1=4, d2=5);
}
}
}