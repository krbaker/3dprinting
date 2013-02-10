difference(){
  translate([14,0,0]){
    cube([96,20,7.5]);
  }
  translate([100,0,0]){
  cube([10,20,5]);
  }
  translate([105,5,5]){
    cylinder(r= 2, h = 10);
  }
  translate([105,15,5]){
    cylinder(r= 2, h = 10);
  }
  translate([14,2,1]){
    cube([82,16,10]);
  }
  for( i = [0 : 4] ){
  translate([i * 20 + 6,10,0]){
    cylinder(r= 8, h = 1);
  }
  }
}
difference(){
translate([0,-20,0]){
cube([4,60,10]);
}
translate([0,7,1]){
cube([14,6,10]);
}
}
difference(){
translate([4,-20,0]){
cube([6,60,2.5]);
}
translate([0,7,1]){
cube([14,6,10]);
}
}
difference(){
translate([10,-20,0]){
cube([4,60,10]);
}
translate([0,7,1]){
cube([14,6,10]);
}
}
translate([25,0,0]){
cube([2,20,7.5]);
}