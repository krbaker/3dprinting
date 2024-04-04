wiredia = 1.291;
use<write.scad>;
difference(){
  cube([100,24,3]);
  rotate([0,180,0]){
    translate([-93,3,-.9]){
      write("N-98713", h=18, t=1);
    }
  }
  translate([7,3,2]){
    write("N-98713", h=18, t=1);
  }
}
difference(){
  translate([-2,0,-3]){
    cube([8,24,6]);
    translate([100-4,0,0]){
      cube([8,24,6]);
    }
  }
  translate([-2,0,-wiredia]){
    cube([2,24,wiredia]);
    translate([0,0,-1.5]){
	   rotate([0,-45,0]){
       cube([2,24,wiredia]);
      }
    }
    translate([100 + 2,0,0]){
      cube([2,24,wiredia]);
      translate([.5,0,0]){
	     rotate([0,45,0]){
         cube([2,24,wiredia]);
        }
      }
    }
  }
  translate([0,0,-wiredia/2]){
    rotate([-90,0,0]){
      cylinder(r=wiredia / 2, h = 30);
      translate([100,0,0]){
        cylinder(r=wiredia / 2, h = 30);
      }
    }
  }
}