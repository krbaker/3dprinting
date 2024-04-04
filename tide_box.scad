esp32_x = 39.75;
esp32_y = 31.25;
esp32_z = 8;
barrel_x = 36;
barrel_y = 14.2;
barrel_z = 13;
barrel_d = 7;
wall = 2;

screw_d = 2.4;

$fn = 50;

difference(){
//Body
translate([0,-4,0]){    
cube([esp32_x+ 2*wall,3*wall+barrel_y+esp32_y+4+4,barrel_z - 1 +wall]);
}
//Barrel Jack
translate([esp32_x - barrel_x + wall,wall,wall]){
cube([barrel_x,barrel_y,barrel_z]);
}
//Barrel Jack Hole
translate([esp32_x,wall+(barrel_y/2),wall+6]){
rotate([0,90,0]){
cylinder(d=barrel_d,h=5);
}
//Barrel Jack Leads
}
translate([2,2,6]){
cube([4,3+14.2,10]);
}
//ESP32 Board
translate([2,2+2+14.2,14-8]){
cube([39.75,31.25,9]);
//USB
translate([39,10,-3]){
cube([10,12,12]);
}
}
//LED Channel
translate([(39.75+4)/2 - (17.7/2),3+14.2+31.25,2]){
cube([17.7,4+4,8]);
}
translate([4,-1,-1]){
cylinder(d=screw_d,h=barrel_z+4);
}
translate([esp32_x+ 2*wall - 4,-1,-1]){
cylinder(d=screw_d,h=barrel_z+4);
}
translate([4,3*wall+barrel_y+esp32_y+4-3,-1]){
cylinder(d=screw_d,h=barrel_z+4);
}
translate([esp32_x+ 2*wall - 4,3*wall+barrel_y+esp32_y+4-3,-1]){
cylinder(d=screw_d,h=barrel_z+4);
}
}





//top
translate([50,0,0]){
difference(){
//Body
translate([0,-4,0]){    
cube([esp32_x+ 2*wall,3*wall+barrel_y+esp32_y+4+4,wall]);
}
translate([4,-1,-1]){
cylinder(d=screw_d,h=barrel_z+4);
}
translate([esp32_x+ 2*wall - 4,-1,-1]){
cylinder(d=screw_d,h=barrel_z+4);
}
translate([4,3*wall+barrel_y+esp32_y+4-3,-1]){
cylinder(d=screw_d,h=barrel_z+4);
}
translate([esp32_x+ 2*wall - 4,3*wall+barrel_y+esp32_y+4-3,-1]){
cylinder(d=screw_d,h=barrel_z+4);
}
}
}