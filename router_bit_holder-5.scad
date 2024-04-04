in_to_mm = 25.8;
width = 134;
height = 64.5;
depth = 52;
back_thickness = 1.5;
block = depth/2;
hole_size = 12.9;
wall_thickness = 1;
holes = 4;
hole_spacing = width / holes;
slope = -atan(height / (depth + hole_size));
rounding = 11;

difference(){
union(){
difference(){
cube([width,height,back_thickness]);
translate([rounding,height - rounding,-1]){
difference(){
translate([-(rounding +1),0,0]){
cube([rounding +1 , rounding + 1, 10]);
}
cylinder(r=rounding,h=10, $fn=100);
}
}
translate([width - rounding,height - rounding,-1]){
difference(){
cube([rounding +1 , rounding + 1, 10]);
cylinder(r=rounding,h=10, $fn=100);
}
}
}
cube([width,block - 5,block/2 +4]);
}
translate([0,0,-1]){
cylinder(r=2,h=height);
translate([width,0,0]){
cylinder(r=2,h=height);
}
}
translate([wall_thickness,wall_thickness,-1]){
difference(){
cube([width - 2*wall_thickness, block - 2*wall_thickness - 5, (block / 2 - wall_thickness) + 4]);
translate([0,0,-1]){
cylinder(r=2,h=height);
translate([width - ( 2 * wall_thickness ) ,0,0]){
cylinder(r=2,h=height);
}
}
}
}
translate([hole_spacing / 2,0,0]){
for (h = [0: holes - 1]){ 
translate([h * hole_spacing,0,0]){
rotate([slope,0,0]){
cylinder(d = hole_size, h = 101, $fn=100);
translate([0,0,14]){
cylinder(d1 = hole_size -2 , d2 = (hole_size * 3) -2, h = 16, $fn=100);
}    
}
}
}
}
}
intersection(){
cube([width,block - 5,block/2 + 4] );
translate([hole_spacing / 2,0,0]){
difference(){
union(){
for (h = [0: holes - 1]){ 
translate([h * hole_spacing,0,0]){
rotate([slope,0,0]){
cylinder(d = hole_size + 2* wall_thickness, h = 100, $fn=100);    
translate([0,0,14]){
cylinder(d1 = hole_size, d2 = hole_size * 3 , h = 16, $fn=100);
}    
}
}
}
}
for (h = [0: holes - 1]){ 
translate([h * hole_spacing,0,0]){
rotate([slope,0,0]){
cylinder(d = hole_size, h = 101, $fn=100);
translate([0,0,14]){
cylinder(d1 = hole_size -2 , d2 = (hole_size * 3) -2, h = 16, $fn=100);
}    
}
}
}
}
}
}