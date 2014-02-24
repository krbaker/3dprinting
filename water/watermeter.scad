// if 0 - all parts, if 1 base if 2 ardunio mount
parts = 1;

if (parts != 2){
union(){
  difference(){
    // Main Body
    cylinder(r=50,h=30);
    // Big Hole
    translate([0,0,8]){
      cylinder(r=48.25, h=30);
    }
    translate([0,0,5]){
      intersection(){
        //Cutout the 'notch'
        rotate([0,0,90]){
          translate([-33,0,0]){
            cube([66,100,30]);
          }
        }
      }
    }
    //keep top circumfrance thin
    cylinder(r=45,h=30);
  }
  translate([-47.5,-2.5,0]){
    difference(){
      union(){
        cube([95,5,2]);
        translate([47.5-13,2.5,1]){
          //cube([20,20,2], center = true);
          difference(){
            cube([5,90,2], center = true);
            translate([0,24.2,-1]){
              cylinder(r=1.75,h=2);
            }
            translate([0,-24.2,-1]){
              cylinder(r=1.75,h=2);
            }
         }
         translate([50,0,0]){
           difference(){
             cube([5,60,2],center= true);
             translate([0,8.65,-1]){
               cylinder(r=1.75,h=2);
             }
             translate([0,-18.65,-1]){
               cylinder(r=1.75,h=2);
             }
           }
         }
       }
     }
     translate([47.5-13,2.5,0]){
       translate([4,0,0]){
         //cylinder(r=2.5,h=2);
         translate([0,5.5,0]){
           cylinder(r=1.75,h=2);
         }
       }
       translate([-4,0,0]){
         //cylinder(r=2.5,h=2);
         translate([0,5.5,0]){
           cylinder(r=1.75,h=2);
         }
       }
     }
   }
  }
  translate([-5,47,15 + 8]){
    rotate([-10,0,0]){
      cube([10,1,5]);
    }
  }
  translate([-5,-48,15 + 8]){
    rotate([10,0,0]){
      cube([10,1,5]);
    }
  }
}
}
if (parts != 1){
  difference(){
  union(){
  translate([-47.5,-2.5,-1]){
    difference(){
      union(){
        translate([47.5-13,2.5,1]){
          difference(){
            union(){
				  translate([-2,-27,0]){
                cube([4,54,38]);
              }
				  translate([0,24.2,0]){
                cylinder(r=4,h=50);
              }
              translate([0,-24.2,0]){
                cylinder(r=4,h=50);
              }
            }
            translate([0,24.2,0]){
              cylinder(r=1.75,h=80);
            }
            translate([0,-24.2,0]){
              cylinder(r=1.75,h=80);
            }
         }
         translate([50,0,0]){
           difference(){
             union(){
               translate([-2,-27,0]){
                 cube([4,54,38]);
               }
               translate([0,8.65,0]){
                 cylinder(r=4,h=50);
               }
               translate([0,-18.65,0]){
                 cylinder(r=4,h=50);
               }
             }
             translate([0,8.65,0]){
               cylinder(r=1.75,h=80);
             }
             translate([0,-18.65,0]){
               cylinder(r=1.75,h=80);
             }
           }
         }
         translate([2,23,0]){
           cube([50,4,38]);
         }
         translate([2,-27,0]){
           cube([50,4,38]);
         }
       }
     }
   }
 }
difference(){
translate([10,0,0]){
  rotate([90,0,0]){
    translate([0,2,-27]){
      translate([23/2,0,0]){
        cylinder(r=4, h=5);
      }
      translate([-23/2,0,0]){
        cylinder(r=4, h=5);
      }
      translate([23/2,30,0]){
        cylinder(r=4, h=5);
      }
      translate([-23/2,30,0]){
        cylinder(r=4, h=5);
      }
    }
    translate([0,2,22]){
      translate([23/2,0,0]){
        cylinder(r=4, h=5);
      }
      translate([-23/2,0,0]){
        cylinder(r=4, h=5);
      }
      translate([23/2,30,0]){
        cylinder(r=4, h=5);
      }
      translate([-23/2,30,0]){
        cylinder(r=4, h=5);
      }
    }
  }
}
translate([-50,-50,-2]){
cube([100,100,2]);
}
}
}
translate([10,0,0]){
rotate([90,0,0]){
translate([0,2,-50]){
translate([23/2,0,0]){
cylinder(r=1.75, h=100);
}
translate([-23/2,0,0]){
cylinder(r=1.75, h=100);
}
translate([23/2,30,0]){
cylinder(r=1.75, h=100);
}
translate([-23/2,30,0]){
cylinder(r=1.75, h=100);
}
}
}
}
}
}
