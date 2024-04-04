thickness = 3;
depth = 8;
latch = 5;
arm = 28;
lights = 6;
$fn = 60;
translate([-thickness,0,0]){
cube([70.5 + 2*(thickness),thickness, depth]);
}
translate([-(arm+lights),0,0]){
difference(){
union(){
cube([arm+lights,thickness,depth]);
cylinder(d=lights+thickness,h=depth);
}
translate([0,0,-1]){
cylinder(d=lights,h=depth+2);
translate([0,0,0]){
cube([3,10,depth+2]);
}
}
}
}
translate([0,-9.25 - 3,0]){
difference(){
union(){    
cylinder(d=18.5+3*(thickness),h=depth);
translate([70.5,0,0]){
cylinder(d=18.5+3*(thickness),h=depth);
}
}
translate([0,0,-1]){
cylinder(d=18.5,h=depth+2);
translate([70.5,0,0]){
cylinder(d=18.5,h=depth+2);
}
translate([0,-9.25-(1.5*thickness),0]){
cube([70.5,18.5+3*(thickness), depth + 2]);
}
translate([-latch,-(1.5*thickness + 9.25),0]){
cube([70.5+(2*latch),9.25+(1.5*thickness),depth + 2]);
}
}
}
}