// Wesp Board (turn off to print)
color([.8,.1,.1]){
//cube([75.5,40,1.25]);
}
translate([-2,-2,-2]){
difference(){
union(){
//Outside of box
cube([75.5+4,96+4+5,22.75+2]);
//Corner Posts
cylinder(h=22.75+2,r=3);
translate([75.5+4,0,0]){
cylinder(h=22.75+2,r=3);
}
translate([75.5+4,96+4+5,0]){
cylinder(h=22.75+2,r=3);
}
translate([0,96+4+5,0]){
cylinder(h=22.75+2,r=3);
}
}
translate([2,2,2]){
//Wesp Hole
cube([75.5,40,23]);
translate([0,42,0]){
//SmartMeasure Hole
cube([75.5,59,23]);
}
translate([-3,16.65,1.25+3]){
cube([21.25,17.75,14.5]);
}
translate([75.5-45+1,39,3]){
//Cable Hole
cube([11.25,8,5]);
}
}
//Holes for corner screws
translate([0,0,-.1]){
cylinder(h=23+2,d=2.65);
translate([75.5+4,0,0]){
cylinder(h=23+2,d=2.65);
}
translate([75.5+4,96+4+5,0]){
cylinder(h=23+2,d=2.65);
}
translate([0,96+4+5,0]){
cylinder(h=23+2,d=2.65);
}
cylinder(h=23+2,d=2.65);
}
//Ventiliation
for (i = [5 : 5 : 60]){translate([i,-1,20]){
        rotate([0,45,0]){
            cube([20,10,2]);
        }
    }
}
//less stick
translate([-.5,0,0]){
for (x = [10 : 10 : 70]){
    for (y = [7.5 : 10 : 100]){
        translate([x,y,-.1]){
            cylinder(h = .3, r = 3);
        }
    } 
}
}
}
}

//Feet for wesp32
translate([3,3,0]){
difference(){
cylinder(h=3,r=3);
cylinder(h=4,d=2.65);
}
translate([0,34,0]){
difference(){
cylinder(h=3,r=3);
cylinder(h=4,d=2.65);
}
}
translate([75.5-6,34,0]){
difference(){
cylinder(h=3,r=3);
cylinder(h=4,d=2.65);
}
}
translate([75.5-6,0,0]){
difference(){
cylinder(h=3,r=3);
cylinder(h=4,d=2.65);
}
}
}
//Smartmeasure Board (turn off to print)
translate([25.25,45,0]){
color([.8,.1,.1]){
translate([0,0,3]){
//cube([50.25,56,1.25]);
}
}
// Feet for smartmeasure
translate([2.5,44.5,0]){
difference(){
cylinder(h=3,r=2);
cylinder(h=4,d=1.7);
}
}
translate([46,25,0]){
difference(){
cylinder(h=3,r=2);
cylinder(h=4,d=1.7);
}
}
translate([41,12,0]){
difference(){
cylinder(h=3,r=2);
cylinder(h=4,d=1.7);
}
}
translate([30,4,0]){
difference(){
cylinder(h=3,r=2);
cylinder(h=4,d=1.7);
}
}
}

