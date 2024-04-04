include <Roundedcube.scad>;

$fn=60;

//Card Sizes
card_width=63.5;
card_height=89;
card_thickness=.32;
cards=60;
extra=10;
corner_radius=3;

//Structure
bottom_thickness=2;
bottom_width=11;
card_frame_thickness=4;
external_radius=2;
external_corner_radius=7;

//Consts
render_offset=1; //used to offset parts to ensure clarity of zero size lines

//Computed Values
overall_width=card_frame_thickness * 2 + card_width;
overall_height=card_frame_thickness * 2 + card_height;
cards_thickness=(card_thickness*cards)+extra;
overall_thickness=bottom_thickness+cards_thickness;

module corner_cut(radius = 1, height = 1, rotation = [0,0,0]){ 
    rotate(rotation){
        difference(){
            translate([-1,-1,-1]){
                cube([radius+1, radius+1, height+2]);
            }
            translate([radius,radius,-2]){
                cylinder(r = radius, h = height+4);
            }
        }
    }
}


difference(){
  roundedcube([overall_width,overall_height,overall_thickness], false, external_radius);
  //Bottom Cutout
  translate([bottom_width,bottom_width,-render_offset]){
    roundedcube([overall_width - 2 * bottom_width,overall_height - 2 * bottom_width,bottom_thickness + 2*render_offset],
      false, external_radius);
  }
  //Card Cutout
  translate([card_frame_thickness,card_frame_thickness,bottom_thickness]){
    roundedcube([card_width,card_height,overall_thickness + 10], false, corner_radius, "zmax");
  }
  //Side_Cuts
  translate([bottom_width,-corner_radius,bottom_thickness]){
    roundedcube([overall_width - 2 * bottom_width, overall_height + 2 * corner_radius, cards_thickness], false, corner_radius, "zmin");
  }
  translate([-corner_radius,bottom_width,bottom_thickness]){
    roundedcube([overall_width + 2 * corner_radius , overall_height - 2 * bottom_width, cards_thickness], false, corner_radius, "zmin");
  }
  //Extra rounded cuts to fit box
  corner_cut(radius = external_corner_radius, height = overall_thickness);
  translate([overall_width,0,0]){
    corner_cut(radius = external_corner_radius, height = overall_thickness,rotation = [0,0,90]);
  }
  translate([overall_width,overall_height,0]){
    corner_cut(radius = external_corner_radius, height = overall_thickness,rotation = [0,0,180]);
  }
  translate([0,overall_height,0]){
    corner_cut(radius = external_corner_radius, height = overall_thickness,rotation = [0,0,-90]);
  }

}


