in_to_mm = 25.8;
width = 67;
height = 65;
depth = 52;
back_thickness = 2;
block = depth/2;
hole_size = (1/4) * in_to_mm;
wall_thickness = 1;
holes = 4;
hole_spacing = width / holes;
slope = -atan(height / (depth + hole_size));

difference(){
union(){
cube([width,height,back_thickness]);
cube([width,block,block/2]);
}
translate([wall_thickness,wall_thickness,-1]){
cube([width - 2*wall_thickness, block - 2*wall_thickness, block / 2 - wall_thickness]);
}
translate([hole_spacing / 2,0,0]){
for (h = [0: holes - 1]){ 
translate([h * hole_spacing,0,0]){
rotate([slope,0,0]){
cylinder(d = hole_size, h = 101, $fn=100);
}
}
}
}
}
intersection(){
cube([width,block,block/2]);
translate([hole_spacing / 2,0,0]){
for (h = [0: holes - 1]){ 
translate([h * hole_spacing,0,0]){
rotate([slope,0,0]){
difference(){
cylinder(d = hole_size + 2* wall_thickness, h = 100, $fn=100);    
cylinder(d = hole_size, h = 101, $fn=100);
}
}
}
}
}
}