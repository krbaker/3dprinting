// Case Height
height = 1.5;
// Wesp Board (turn off to print)
color([.8,.1,.1]){
//cube([75.5,40,1.25]);
}
translate([-2,-2,-2]){
difference(){
union(){
//Outside of box
cube([75.5+4,96+4+5,height]);
//Corner Posts
cylinder(h=height,r=3);
translate([75.5+4,0,0]){
cylinder(h=height,r=3);
}
translate([75.5+4,96+4+5,0]){
cylinder(h=height,r=3);
}
translate([0,96+4+5,0]){
cylinder(h=height,r=3);
}
}
//Holes for corner screws
translate([0,0,-.1]){
cylinder(h=height+2,d=2.65);
translate([75.5+4,0,0]){
cylinder(h=height+2,d=2.65);
}
translate([75.5+4,96+4+5,0]){
cylinder(h=height+2,d=2.65);
}
translate([0,96+4+5,0]){
cylinder(h=height+2,d=2.65);
}
cylinder(h=height+2,d=2.65);
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
translate([65,81+9.5,-1]){
cylinder(h = 4, d=20);
}
translate([31,74,-1]){
cube([9,10,4]);
}
}
}

