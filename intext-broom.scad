thickness = 3;
depth = 8;
latch = 5;
arm = 28;
lights = 6;
//handle = 28.25; (broom w/rubber handle)
handle = 24.9;
$fn = 60;
// This is the arm/accessory section
translate([-(arm+lights),-thickness,0]){
//union(){
cube([arm+lights,2*thickness,depth]);
rotate([90,0,0]){
translate([-handle/2,depth/2,-2*thickness]){
difference(){
cylinder(d=handle+3*thickness, h= 2*thickness);
translate([0,0,-.5]){
cylinder(d=handle,h=2*thickness+1);
}

translate([-(handle+thickness+3),-(handle+thickness)/2,-.5]){
//cube([handle+thickness,handle+thickness,2*thickness+1]);
translate([(handle+thickness)/2,(handle+thickness)/2,0]){
rotate([0,0,45]){
translate([-(handle+thickness)/2,-(handle+thickness)/2,0]){
cube([handle+thickness,handle+thickness,2*thickness+1]);
}
}
}
}
}
}
}
//cylinder(d=lights+thickness,h=depth);
//}
//translate([0,0,-1]){
//cylinder(d=lights,h=depth+2);
//translate([0,0,0]){
//cube([3,10,depth+2]);
//}
//}
}

// This is the railing clip section
// This is top of clip
translate([-thickness,0,0]){
cube([70.5 + 2*(thickness),thickness, depth]);
}
// This is side arms of the clip
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