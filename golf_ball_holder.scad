// rounded cube
// Set to 0.01 for higher definition curves (renders slower)
$fn = 50;

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true);
						}
					}
				}
			}
		}
	}
}
// golf ball holder

ball_size = 42.5; // diameter of balls
pencil_size = 7.675; // diamter of pencils
tee_size = 4.925; // diameter of tee holes
spacing = 7; // mm between balls
depth = 2; // pencil and tee base thickness
balls = 5; // number of ball spots
radius = 2.5; // corner radius
ball_depth = .25; //portion of the ball that is in the stand
pencil_cheat_in = 4; // pull pencils towards balls
base_thickness = 10; // extra height needed for pencils

// compute size of stand
length = (balls * (ball_size + spacing)) + (2 * radius) + pencil_size + (2 * pencil_cheat_in);
width = ball_size + (2 * spacing) + (2 * radius);
thickness = (ball_size * ball_depth) + depth + base_thickness;

// compute ball divets
ball_y = (width / 2);
ball_z = thickness + (ball_size/2) - (ball_size * ball_depth);
ball_x_start = (ball_size/2) + radius + spacing + pencil_cheat_in;
ball_centers = ball_size + spacing;


difference(){
// base
roundedcube([length,width,thickness],false,radius,"all");
// ball divets
translate([ball_x_start,ball_y,ball_z]){
for ( i = [0:1:balls-1] ){
translate([ball_centers * i,0,0]){
sphere(d=ball_size);
}
}
}
// pencils
pencil_height = depth;
pencil_spacing = ball_centers;
pencil_front_row_y = radius + (pencil_size / 2) + pencil_cheat_in;
pencil_back_row_y = width - (radius + (pencil_size/2)) - pencil_cheat_in;
pencil_back_row_x = ball_x_start - (ball_centers / 2);
pencil_front_row_x = pencil_back_row_x + pencil_spacing;


// front row
translate([pencil_front_row_x, pencil_front_row_y, pencil_height]){
    for ( i = [0:1:(balls - 2)] ){
    translate([i * pencil_spacing,0,0]){
    cylinder(d = pencil_size, h = thickness);
    }
    }
}
// back row
translate([pencil_back_row_x, pencil_back_row_y, pencil_height]){
    for ( i = [0:1:balls] ){
    translate([i * pencil_spacing,0,0]){
    cylinder(d = pencil_size, h = thickness);
    }
    }
}
// tees
tee_spacing = ball_centers;
tee_height = depth;
tee_y = ball_y;
tee_start_x = ball_x_start + (ball_centers/2);

translate([tee_start_x,ball_y,tee_height]){
for ( i = [0:1:(balls - 2)]){
translate([tee_spacing * i,0,0]){
cylinder(d = tee_size, h = thickness);
}
}
}
}