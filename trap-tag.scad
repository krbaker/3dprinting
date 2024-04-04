wire_dia = 4;
width = 118.10 - wire_dia;
thickness = 3;
height = 34;
overhang = .25;
text_size = 15.5;
difference(){
    union(){
translate([-overhang,0,0]){
    //main body
cube([width + overhang * 2,thickness,height]);
}
//ramp part far
translate([width,0,0]){
 mirror(){
translate([0,-5,0]){
rotate([0,0,15]){
cube([19.3,thickness,height]);
translate([1,0,0]){
cube([10,5,height]);
}
}
}
}
}
//ramp part near
translate([0,-5,0]){
rotate([0,0,15]){
cube([19.3,thickness,height]);
translate([1,0,0]){
cube([10,5,height]);
}
}
}
}
translate([1,-(wire_dia/2),-.5]){
cylinder(d=wire_dia,h=height + 1, $fn=60);
translate([-1.75,-2.45,0]){
rotate([0,0,12]){
cube([2, 4, height +1 ]);
}
}
translate([width-1,0,0]){
cylinder(d=wire_dia,h=height + 1, $fn=60);
translate([-.8,-1.9,0]){
rotate([0,0,-12]){
cube([2, 4, height +1 ]);
}
}
}
}

rotate([-90,0,0]){
translate([0,-(text_size + (height-text_size)/2) ,thickness - .5]){
linear_extrude(1)
text("N-798713-0", size = text_size);
}
}
}