arm_angle = 70;
arm_rotation = 90 - arm_angle;
distance_between_gears = 51;
top = 0;
difference(){
  union (){
    difference(){
      union(){
        cube ([26,50,3]); // block like original
	     translate([13,25,0]){cylinder(h = 7, r = 10);} //bushing
        translate([0,0,0]){cube([52,94,3]);} // arm to stepper
      }
      // sklight mount holes
      translate([13,25,0]){
        cylinder(h = 50, r = 5);
        translate([0,-16,0]){cylinder(h = 50, r = 1.6 + (top * 2));}
        translate([0,16,0]){cylinder(h = 50, r = 1.6 + (top * 2));}
      }
      // taper arm to stepper
      translate([-20,50,0]){
        rotate([0,0,-11]){
          cube ([20,90,10]);
        }
      }
      // taper arm to stepper
      translate([26,0,0]){
        rotate([0,0,-26]){
          cube ([30,90,10]);
        }
      }
    }
    difference(){
      // Block for stepper gear
      translate([13,25,0]){
        rotate([0,0,arm_angle]){
          translate([distance_between_gears,0,0]){
            rotate([0,0,arm_rotation]){
              translate([-21.15,-21.15,0]){
                cube([42.3,42.3,27]);
              }     
            }
          }
        }
      }
      translate([13,25,0]){cylinder(h = 20, r = 44);}
    }
  }
  //stepper bolts
  translate([13,25,0]){
    rotate([0,0,arm_angle]){
      translate([distance_between_gears,0,0]){
          rotate([0,0,arm_rotation]){
              translate([15.5,15.5,0]){
                cylinder(h=50, r=1.6);
                if ( top == 0 ){
                  cylinder(h=23, r=3);
                }
              }
              translate([15.5,-15.5,0]){
                cylinder(h=50, r=1.6);
                if ( top == 0 ){
                  cylinder(h=23, r=3);
                }
              }
              translate([-15.5,-15.5,0]){
                cylinder(h=50, r=1.6);
                if ( top == 0 ){
                  cylinder(h=23, r=3);
                }
              }
              translate([-15.5,15.5,0]){
                cylinder(h=50, r=1.6);
                if ( top == 0 ){
                  cylinder(h=23, r=3);
                }
              }            
         }
     }
   }
 }
 //lop of build up if top
 if (top == 1){
   translate([0,0,3]){
     cube([100,100,50]);
   }
 }
 //Hole for stepper gear
 translate([13,25,(1 - top) * 3]){
   rotate([0,0,arm_angle]){
      translate([distance_between_gears,0,0]){
        rotate([0,0,arm_rotation]){
          cylinder(h=50, r = 17);
        }
      }
   }
 }
}

