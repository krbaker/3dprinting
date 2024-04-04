module copy_mirror(vec=[0,1,0])
{
    children();
    mirror(vec) children();
}

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
//ramp / hole
translate([width / 2, - (wire_dia / 2) ,-.5]){
copy_mirror([1,0,0]){
translate([width / 2, 0, 0]){
difference(){
translate([-6,-(6 - wire_dia/2),.5]){
cube([10,6,height]);
translate([-20,0,0]){
difference(){    
cube([20,6,height]);
translate([-2,.5,-.5]){
rotate([0,0,-17]){
cube([25,6,height + 1]);
}
}
}
}
}
cylinder(d=wire_dia,h=height + 1, $fn=60);
translate([0,-(wire_dia/2),0]){
cube([10,wire_dia +1,height +1]);
}
}
}
}
}
}

rotate([-90,0,0]){
translate([0,-(text_size + (height-text_size)/2) ,thickness - .5]){
linear_extrude(1)
text("N-XXXXXX-X", size = text_size);
}
}
}