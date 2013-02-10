widths = [68.25,85.5];
max_width = 85.5;
bottom_width = max_width + 25.5;
middle = bottom_width / 2;
difference() {
  cube ([100,bottom_width ,5]);

  for ( w = widths ){
    for ( y = [ middle + (w/2) - 7 + 12.25,
                middle + (w/2) - 17 + 12.25, 
                middle - (w/2) + 7 - 12.25, 
                middle - (w/2) + 17 - 12.25] ) {
      translate([35,y,0]){
        cylinder(h=5, r=2);
		  translate([0,0,2.5]){
          cylinder(h=2.5, r=3.5);
        }
        translate([30,0,0]){
          cylinder(h=5, r=2);
			 translate([0,0,2.5]){
            cylinder(h=2.5, r=3.5);
          }
        }
      }
    }
  }
  translate([10,2.5,0]){
    cube ([20,bottom_width - 5,5]);
	 translate([0,-2.5,2.5]){
      cube ([20,bottom_width,2.5]);
    }
  }
  translate([2.5,2.5,0]){
    cube ([20,middle - 12.5,5]);
  }
  translate([2.5,middle + 10,0]){
    cube ([20,middle - 12.5,5]);
  }
  translate([40,2.5,0]){
    cube ([20,bottom_width - 5,5]);
	 translate([0,-2.5,2.5]){
      cube ([20,bottom_width,2.5]);
    }
  }
  translate([70,2.5,0]){
    cube ([27.5,bottom_width - 5,5]);
	 translate([0,-2.5,2.5]){
      cube ([20,bottom_width,2.5]);
    }
  }


  translate([5,middle - 5,0]){
    cylinder(h=5, r=2);
	 translate([0,0,2.5]){
      cylinder(h=2.5, r=3.5);
    }
    translate([0,10,0]){
      cylinder(h=5, r=2);
      translate([0,0,2.5]){
        cylinder(h=2.5, r=3.5);
      }
    }
  }
  
}
translate([10,middle - 1.25,0]){
  cube([90,2.5,2.5]);
}

for ( m = [[[1,0,0,0],
               [0,1,0,0],
					[0,0,1,0],
					[0,0,0,1]],
           [[cos(90),-sin(90),0,bottom_width - 10],
               [sin(90),cos(90),0,0],
					[0,0,1,0],
					[0,0,0,1]],
           [[cos(180),-sin(180),0,bottom_width - 11],
               [sin(180),cos(180),0,100 + 11],
					[0,0,1,0],
					[0,0,0,1]],
           [[cos(270),-sin(270),0],
               [sin(270),cos(270),0,100 + 11],
					[0,0,1,0],
					[0,0,0,1]]]
    ){
multmatrix( m= m ){
  polyhedron(
    points=[ [2.5,2.5,0],   //0 origin
             [2.5,15,0],   //1 out y low
             [15,2.5,0],   //2 out x low
             [2.5,2.5,2.5], //3 tip
             [2.5,15,1], //4 out y high
             [15,2.5,1] ], //5 out x high
    triangles=[ [4,2,5], [4,1,2], [3,4,5], [2,1,0],
					 [3,5,2], [1,4,0], [0,4,3], [0,3,2]  ]
  );
}
}