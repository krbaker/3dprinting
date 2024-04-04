in_to_mm = 25.8;
width = 67;
height = 65;
depth = 52;
back_thickness = 1.5;
block = depth/2;
hole_size = 6.8;
wall_thickness = 1;
holes = 4;
hole_spacing = width / holes;
slope = -atan(height / (depth + hole_size));

difference(){
union(){
cube([width,height,back_thickness]);
cube([width,block - 5,block/2]);
}
translate([wall_thickness,wall_thickness,-1]){
cube([width - 2*wall_thickness, block - 2*wall_thickness - 5, block / 2 - wall_thickness]);
}
translate([hole_spacing / 2,0,0]){
for (h = [0: holes - 1]){ 
translate([h * hole_spacing,0,0]){
rotate([slope,0,0]){
cylinder(d = hole_size, h = 101, $fn=100);
translate([0,0,10]){
cylinder(d1 = hole_size -2 , d2 = (hole_size * 3) -2, h = 16, $fn=100);
}    
}
}
}
}
}
intersection(){
cube([width,block - 5,block/2]);
translate([hole_spacing / 2,0,0]){
for (h = [0: holes - 1]){ 
translate([h * hole_spacing,0,0]){
rotate([slope,0,0]){
difference(){
union(){
cylinder(d = hole_size + 2* wall_thickness, h = 100, $fn=100);    
translate([0,0,10]){
cylinder(d1 = hole_size, d2 = hole_size * 3 , h = 16, $fn=100);
}    
}
cylinder(d = hole_size, h = 101, $fn=100);
translate([0,0,10]){
cylinder(d1 = hole_size -2 , d2 = (hole_size * 3) -2, h = 16, $fn=100);
}    
}
}
}
}
}
}