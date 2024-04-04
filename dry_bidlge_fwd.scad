$fs = .2;
$fa = .2;
sponge_x = 30;
sponge_y = 57;
sponge_z = 15;
mount_z = 40;
mount_x = 40;
wall_thickness = 2;
fudge = 1;
connect_z = 10;
connect_r = 3.80/2;
connect_thickness = .5;
barb = .2;
barb_z = 3;
difference(){
cube([sponge_x + (2*wall_thickness),
    sponge_y + + ( 2 * wall_thickness),
    sponge_z + wall_thickness]);
translate([wall_thickness, wall_thickness, -fudge]){
    cube([sponge_x,
        sponge_y,
        sponge_z + fudge]);
};
translate([wall_thickness + sponge_x/2,
    wall_thickness + sponge_y/2,fudge]){
        cylinder(r=connect_r - connect_thickness,h = sponge_z + wall_thickness);
    }
}
translate([-(mount_x-wall_thickness),0,0]){
difference(){
cube([mount_x + wall_thickness,
      sponge_y + (2*wall_thickness),
      mount_z + sponge_z + wall_thickness]);
translate([-wall_thickness,-fudge,-fudge]){
cube([mount_x,sponge_y + 2*(fudge + wall_thickness),mount_z + sponge_z + fudge]);
}
}
}
translate([wall_thickness + sponge_x/2,
           wall_thickness + sponge_y/2,
           0]){
difference(){
union(){
cylinder(r=5,h=sponge_z);
translate([0,0,sponge_z + wall_thickness]){
cylinder(r=connect_r,
    h=connect_z);
translate([0,0,connect_z - barb_z]){
cylinder(r1=connect_r+barb,
    r2=connect_r, h = barb_z);
}
}
}
translate([0,0,-fudge]){
cylinder(r=connect_r-connect_thickness, h = (connect_z + sponge_z + wall_thickness + 2*fudge));
}
rotate([90,0,0]){
translate([0,0,-5]){
cylinder(r=1,h=10);
}
}
translate([0,0,2]){
rotate([90,0,90]){
translate([0,0,-5]){
cylinder(r=1,h=10);
}
}
}
}
};