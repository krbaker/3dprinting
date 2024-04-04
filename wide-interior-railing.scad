thickness = 3;
depth = 8;
latch = 5;
arm = 28;
lights = 6;
width = 136.9;
cap_angle = 3;
cap_length = sqrt(2*(cap_angle*cap_angle));
clip_radius = 18.85/2;
clip_diameter = 2* clip_radius;
clip_bulge = 2;
round_rect = 4.1;
$fn = 60;
// Top Connector
translate([-thickness,0,0]){
  cube([width + 2*(thickness),thickness, depth]);
}
// End Top Connector

// Light Arm & Loop
translate([-(arm+lights),0,0]){
difference(){
union(){
cube([arm+lights,thickness,depth]);
cylinder(d=lights+thickness,h=depth);
}
translate([0,0,-1]){
cylinder(d=lights,h=depth+2);
translate([0,0,0]){
cube([3,10,depth+2]);
}
}
}
}
// End Light Arm & Loop


// Railing Clips
translate([0,-(round_rect),0]){
difference(){
union(){    
    cylinder(r=round_rect+thickness,h=depth);
    translate([width,0,0]){
      cylinder(r=round_rect+thickness,h=depth);
    }
    translate([0,-(clip_diameter - (2*round_rect)),0]){
      cylinder(r=round_rect+thickness,h=depth);
    }
    translate([width,-(clip_diameter - (2*round_rect)),0]){
      cylinder(r=round_rect+thickness,h=depth);
    }
    translate([-(round_rect+thickness),-clip_diameter+2*(round_rect),0]){
      cube([width+(2*round_rect)+(2*thickness),clip_diameter-2*(round_rect),depth]);
    }
}
translate([0,0,-1]){
//  translate([-clip_bulge,0,0]){
//  cylinder(d=clip_diameter,h=depth+2);
//  }
//  translate([width + clip_bulge,0,0]){
//    cylinder(d=clip_diameter,h=depth+2);
//  }
  translate([0,-clip_diameter+round_rect-thickness,0]){
    cube([width,clip_diameter+thickness, depth + 2]);
  }
  translate([-round_rect,-clip_diameter+2*(round_rect),0]){
    cube([width+(2*round_rect),clip_diameter-2*(round_rect),depth + 2]);
  }
  // Cap Angle Cuts
  translate([0,0,0]){
    cylinder(r=round_rect,h=depth+2);
    //rotate([0,0,45]){
    //  cube([cap_length,cap_length,10]);
    //}
  }
  translate([width,0,0]){
    cylinder(r=round_rect,h=depth+2);
    //rotate([0,0,45]){
    //  cube([cap_length,cap_length,10]);
    //}
  }
  translate([0,-(clip_diameter - (2*round_rect)),0]){
    cylinder(r=round_rect,h=depth+2);
  }
  translate([width,-(clip_diameter - (2*round_rect)),0]){
    cylinder(r=round_rect,h=depth+2);
  }
  
  // End Cap Angle Cuts
}
}
}
// End Railing Clips