difference(){
  cube ([20,40,3]); // block like original
  // sklight mount holes
  translate([10,20,0]){
    cylinder(h = 50, r = 5);
    translate([0,-16,0]){cylinder(h = 50, r = 2);}
    translate([0,16,0]){cylinder(h = 50, r = 2);}
    translate([0,9,1.5]){cube([20,4,1.5]);}
    translate([0,-13,1.5]){cube([20,4,1.5]);}
  }
}