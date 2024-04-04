/*
    Parametric 3D print Rugged box
    https://remoteqth.com/3d-ic-705-rugged-box.php
 -------------------------------------------------------------------
     How to export .stl
     After open change inputs parameters
      - set arangeForPrint to 1
     and press F5 for preview
     .STL export press F6 and F7 (or menu /Design/Export as STL...)

     How to export .dxf for lasercuter front panel
      - set enableBOTinside to 1
      - set arangeForPrint to 1
      - set DXFexport to 1
     - render [F6]
     - menu File/Export/ExportDXF

     ----------------- Input parameters ---------------------------------*/
/* [Box Size] */
// inner width (mm)
width = 120; 

// inner length (mm)
depth = 100;        

// [>3.5] box thickness (mm)
thickness = 3.5;            

// lid height - must be larger than 4x thickness
heightTOP = 20;

// bottom height - must be larger than 7x thickness
heightBOT = 30;  

/* [Bolt Size] */
// M3 bolt length in mm
boltLength = 30;         

// calculated by boltLength, do not change
widthCLIP = boltLength/2-0.6;       

// calculate by boltLength, do not change
widthCLIPsupport = boltLength/4;       

// diameter in mm of the bolt hole (conical holes for screw without nuts) - must be smaller than thickness variable
diameterCLIP = 3;  

/* [Optional] */
//Gasket thickness (mm) 
heightjoins=2;

// for clips on both sides [0:1]
disableHINGE = 0; // [0:1]

// enable mounting posts in lid [0:1]
enableTOPinside = 0; // [0:1]

// enable mounting posts in bottom [0:1]
enableBOTinside = 0; // [0:1]

// Render for print layout [0:1]
arangeForPrint  = 0; // [0:1]

// Render for DXF export [0:1]
DXFexport = 0; // [0:1]

// For preview only [0:220]
openingAngle = 120; // [0:220]   

// Include text on top and bottom [0:1]
includetext  = 0; // [0:1]

// Include SealingTrowel [0:1]
includesealing = 0; // [0:1]



FrontPanelEmbedmentDepthTop = 8+27;
FrontPanelEmbedmentDepthBot = 2+0;
FrontPanelScrewDia = 3+0;

module TOPinside(){
    fourSupport(FrontPanelScrewDia,heightTOP-FrontPanelEmbedmentDepthTop);      // screw dia, height
}

module BOTinside(){
        fourSupport(FrontPanelScrewDia,heightBOT-FrontPanelEmbedmentDepthBot);      // screw dia, height
}

//-------------------------------------------------------------------

if(arangeForPrint==1){

    if(DXFexport==1&&enableBOTinside==1){
        // panel
        projection(cut=true) translate([0,0,-FrontPanelEmbedmentDepthBot/2])
            difference(){
                layer(width,depth,thickness*4-0.4, thickness*4-0.4, FrontPanelEmbedmentDepthBot, thickness);
                translate([width/2-2*thickness,-depth/2+2*thickness,-0.1]) cylinder(h=FrontPanelEmbedmentDepthBot+0.2, d=FrontPanelScrewDia+0.2, center=false, $fn=60);
                translate([-width/2+2*thickness,-depth/2+2*thickness,-0.1]) cylinder(h=FrontPanelEmbedmentDepthBot+0.2, d=FrontPanelScrewDia+0.2, center=false, $fn=60);
                translate([width/2-2*thickness,depth/2-2*thickness,-0.1]) cylinder(h=FrontPanelEmbedmentDepthBot+0.2, d=FrontPanelScrewDia+0.2, center=false, $fn=60);
                translate([-width/2+2*thickness,depth/2-2*thickness,-0.1]) cylinder(h=FrontPanelEmbedmentDepthBot+0.2, d=FrontPanelScrewDia+0.2, center=false, $fn=60);
            }

    }else{
       
    if(includesealing ==1){
        translate([-width/2-5*thickness-10,0,0]) SealingTrowel();
    }
    
        translate([width/2+5*thickness,0,0]) rotate([0,0,-90]) rotate([0,90,0]) translate([-width*0.25-widthCLIP/2,-depth/2-2.5*thickness+1.125*diameterCLIP,-thickness-heightBOT+5.0*thickness+(1.25*diameterCLIP)/2])
        clip(width,depth,heightBOT,thickness, 0.5);
    
        translate([width/2+5*thickness,15*thickness,0]) rotate([0,0,-90]) rotate([0,90,0]) translate([-width*0.25-widthCLIP/2,-depth/2-2.5*thickness+1.125*diameterCLIP,-thickness-heightBOT+5.0*thickness+(1.25*diameterCLIP)/2])
        clip(width,depth,heightBOT,thickness, 0.5);

        if(disableHINGE ==1){
            translate([0,-30*thickness,0]){
                translate([width/2+5*thickness,0,0]) rotate([0,0,-90]) rotate([0,90,0]) translate([-width*0.25-widthCLIP/2,-depth/2-2.5*thickness+1.125*diameterCLIP,-thickness-heightBOT+5.0*thickness+(1.25*diameterCLIP)/2])
                clip(width,depth,heightBOT,thickness, 0.5);

                translate([width/2+5*thickness,15*thickness,0]) rotate([0,0,-90]) rotate([0,90,0]) translate([-width*0.25-widthCLIP/2,-depth/2-2.5*thickness+1.125*diameterCLIP,-thickness-heightBOT+5.0*thickness+(1.25*diameterCLIP)/2])
                clip(width,depth,heightBOT,thickness, 0.5);
            }
        }
    
        translate([0,-depth-10*thickness,0])
        box(width,depth,heightTOP,thickness,1);

        box(width,depth,heightBOT,thickness,0);
    }

}else{
    difference(){
        union(){
            if(enableBOTinside==1){
                // panel
        %    translate([0,depth/2+3.5*thickness,-FrontPanelEmbedmentDepthBot])
                difference(){
                    layer(width,depth,thickness*4-0.4, thickness*4-0.4, FrontPanelEmbedmentDepthBot, thickness);
                    translate([width/2-2*thickness,-depth/2+2*thickness,-0.1]) cylinder(h=FrontPanelEmbedmentDepthBot+0.2, d=FrontPanelScrewDia+0.2, center=false, $fn=60);
                    translate([-width/2+2*thickness,-depth/2+2*thickness,-0.1]) cylinder(h=FrontPanelEmbedmentDepthBot+0.2, d=FrontPanelScrewDia+0.2, center=false, $fn=60);
                    translate([width/2-2*thickness,depth/2-2*thickness,-0.1]) cylinder(h=FrontPanelEmbedmentDepthBot+0.2, d=FrontPanelScrewDia+0.2, center=false, $fn=60);
                    translate([-width/2+2*thickness,depth/2-2*thickness,-0.1]) cylinder(h=FrontPanelEmbedmentDepthBot+0.2, d=FrontPanelScrewDia+0.2, center=false, $fn=60);
                }
            }
%        
        if(includesealing ==1){
            translate([width/2+1.0*thickness, depth/2+2*thickness,0]) rotate([60,0,0]) SealingTrowel();
        }

            rotate([openingAngle,0,0]) translate([0,depth/2+3.5*thickness,-thickness-heightBOT]) clip(width,depth,heightBOT,thickness, 0.5);
            rotate([openingAngle,0,0]) translate([-width/2,depth/2+3.5*thickness,-thickness-heightBOT]) clip(width,depth,heightBOT,thickness, 0.5);
            if(disableHINGE ==1){
                 rotate([openingAngle,0,0]) translate([0,depth/2+3.5*thickness,-thickness-heightBOT]) mirror([0,1,0]) clip(width,depth,heightBOT,thickness, 0.5);
                 rotate([openingAngle,0,0]) translate([-width/2,depth/2+3.5*thickness,-thickness-heightBOT]) mirror([0,1,0]) clip(width,depth,heightBOT,thickness, 0.5);
            }
            rotate([openingAngle,0,0]) translate([0,depth/2+3.5*thickness,-thickness-heightBOT]) 
            translate([0,0,2*thickness+heightTOP+heightBOT+0]) mirror([0,0,1])
            box(width,depth,heightTOP,thickness,1);
            translate([0,depth/2+3.5*thickness,-thickness-heightBOT]) box(width,depth,heightBOT,thickness,0);
        }
        // -1/2
//        translate([-width,depth/2,-heightBOT-2*thickness]) cube([width*2, depth*2, (heightTOP+heightBOT)*2]);
    }
}

module SealingTrowel(){
    hull(){
        translate([0,20,0]) cylinder(h=4, d=20, $fn=60);
        translate([-5,0,0]) cube([10, 1, 2],center=false);
    }
    rotate([-90,0,0])
//#    translate([width/2+1.0*thickness, depth/2+2*thickness,0])
    translate([0,-0.5,-thickness])
    difference(){
        intersection() {
            hull(){
                translate([0, thickness, 0]) cylinder(h=1*thickness, d1=thickness*0.5, d2=thickness*1, center=false, $fn=30);
                translate([0, -thickness, 0]) cylinder(h=1*thickness, d1=thickness*0.5, d2=thickness*1, center=false, $fn=30);
            }
            cube([thickness*1.5, 1, thickness*3],center=true);
        }
        cube([thickness*1.5, 1.1, thickness+0.1*2],center=true);
    }
}    
    
module clip(XX,YY,ZZ,WALL,hump){
    difference(){
        union(){
            translate([XX*0.25,YY/2+2*WALL,WALL+ZZ+3.5*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP, d=3.5*diameterCLIP, center=true, $fn=160);
            hull(){
                translate([XX*0.25, YY/2+2*WALL+1.125*diameterCLIP, WALL+ZZ+3.5*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP, d=1.25*diameterCLIP, center=true, $fn=60);
                translate([XX*0.25, YY/2+2*WALL+1.125*diameterCLIP, WALL+ZZ-3.0*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP, d=1.25*diameterCLIP, center=true, $fn=60);
            }
            hull(){
                translate([XX*0.25, YY/2+2*WALL+1.125*diameterCLIP, WALL+ZZ-3.0*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP, d=1.25*diameterCLIP, center=true, $fn=60);
                translate([XX*0.25, YY/2+2.5*WALL+1.125*diameterCLIP, WALL+ZZ-5.0*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP, d=1.25*diameterCLIP, center=true, $fn=60);
            }
            translate([XX*0.25,YY/2+2*WALL,WALL+ZZ-3.0*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP, d=3.5*diameterCLIP, center=true, $fn=160);
        }
        // -
        translate([XX*0.25,YY/2+2*WALL,WALL+ZZ+3.5*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP+0.4, center=true, $fn=60);
        hull(){
            translate([XX*0.25,YY/2+2*WALL,WALL+ZZ]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP, center=true, $fn=60);
            translate([XX*0.25,YY/2+2*WALL,WALL+ZZ-3.0*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP, center=true, $fn=60);
        }
        hull(){
            translate([XX*0.25,YY/2+2*WALL-3.5/6*diameterCLIP,WALL+ZZ-3.0*WALL+hump]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP, center=true, $fn=60);         
            translate([XX*0.25,YY/2+2*WALL,WALL+ZZ-3.0*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP, center=true, $fn=60);
        }
        hull(){
            translate([XX*0.25,YY/2+2*WALL-3.5/6*diameterCLIP,WALL+ZZ-3.0*WALL+hump]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP, center=true, $fn=60);         
            translate([XX*0.25,YY/2+2*WALL-3.5/2*diameterCLIP,WALL+ZZ-3.0*WALL-hump]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP, center=true, $fn=60);         
        }
        hull(){
            translate([XX*0.25,YY/2+2*WALL-3.5/2*diameterCLIP,WALL+ZZ-3.0*WALL-hump-diameterCLIP/2]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP, center=true, $fn=60);         
            translate([XX*0.25,YY/2+2*WALL-3.5/2*diameterCLIP,WALL+ZZ-3.0*WALL-hump-diameterCLIP]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=diameterCLIP, center=true, $fn=60);         
        }
        translate([XX*0.25,YY/2+2*WALL-3.5/2*diameterCLIP,WALL+ZZ-3.0*WALL+3.5/2*diameterCLIP]) rotate([0,90,0]) cylinder(h=widthCLIP+0.4, d=3.5*diameterCLIP, center=true, $fn=60);
    }
}

module box(XX,YY,ZZ,WALL,TOP){
    // outside
    difference(){
        union(){
            translate([0,0,WALL+ZZ-2*WALL])  layer(XX,YY,WALL*8, WALL*8, 2*WALL, WALL);
            translate([0,0,WALL+ZZ-3*WALL])  layer(XX,YY,WALL*6, WALL*8, WALL, WALL);
            translate([0,0,WALL])  layer(XX,YY,WALL*6, WALL*6, ZZ-3*WALL, WALL);
            translate([0,0,0])  layer(XX,YY,WALL*4, WALL*4+2*WALL, WALL, WALL);
            // clip support YY
            hull(){
                translate([0,0.25*YY,WALL+ZZ/2]) cube([XX+4*WALL,2*WALL,ZZ], center=true);
                translate([0,0.25*YY,WALL/2]) cube([XX+2*WALL,2*WALL,WALL], center=true);
            }
            hull(){
                translate([0,-0.25*YY,WALL+ZZ/2]) cube([XX+4*WALL,2*WALL,ZZ], center=true);
                translate([0,-0.25*YY,WALL/2]) cube([XX+2*WALL,2*WALL,WALL], center=true);
            }
            // clip support XX
            translate([XX*0.25+widthCLIP/2+widthCLIPsupport/2+0.3,0,0]) clipSupport(YY,ZZ,WALL,TOP,widthCLIPsupport,0);
            translate([XX*0.25-widthCLIP/2-widthCLIPsupport/2-0.3,0,0]) clipSupport(YY,ZZ,WALL,TOP,widthCLIPsupport,1);
                if(TOP==1 &&disableHINGE==0 ){
                    translate([XX*0.25,0,0]) difference(){
                        hull(){
                            translate([0,-YY/2-3.5*WALL-0*diameterCLIP,WALL+ZZ]) rotate([0,90,0]) cylinder(h=widthCLIP, d=3*WALL, center=true, $fn=60);
                            translate([0,-YY/2-2*WALL,WALL+ZZ-WALL]) cube([widthCLIP,0.1,2*WALL], center=true);
//                            translate([0,-YY/2,WALL+ZZ-3.5*WALL]) cube([widthCLIP+0.4,2*WALL,WALL], center=true);
                        }
                        translate([0,-YY/2-3.5*WALL-0*diameterCLIP,WALL+ZZ]) rotate([0,90,0]) cylinder(h=widthCLIP+1, d=diameterCLIP+0.2, center=true, $fn=30);
                    }
                    translate([-XX*0.25,0,0]) difference(){
                        hull(){
                            translate([0,-YY/2-3.5*WALL-0*diameterCLIP,WALL+ZZ]) rotate([0,90,0]) cylinder(h=widthCLIP, d=3*WALL, center=true, $fn=60);
                            translate([0,-YY/2-2*WALL,WALL+ZZ-WALL]) cube([widthCLIP,0.1,2*WALL], center=true);
//                            translate([0,-YY/2,WALL+ZZ-3.5*WALL]) cube([widthCLIP+0.4,2*WALL,WALL], center=true);
                        }
                        translate([0,-YY/2-3.5*WALL-0*diameterCLIP,WALL+ZZ]) rotate([0,90,0]) cylinder(h=widthCLIP+1, d=diameterCLIP+0.2, center=true, $fn=30);
                    }
                }
            translate([-XX*0.25+widthCLIP/2+widthCLIPsupport/2+0.3,0,0]) clipSupport(YY,ZZ,WALL,TOP,widthCLIPsupport,2);
            translate([-XX*0.25-widthCLIP/2-widthCLIPsupport/2-0.3,0,0]) clipSupport(YY,ZZ,WALL,TOP,widthCLIPsupport,0);
        }
        // - inside
        if(TOP==0){
            difference(){
                translate([0,0,WALL+ZZ-1.0*WALL])  layer(XX,YY,WALL*6.5, WALL*7, 1*WALL+0.1, WALL);
                translate([0,0,WALL+ZZ-1.0*WALL])  layer(XX,YY,WALL*5.5, WALL*5, 1*WALL+0.1, WALL);
            }
        }else{
            translate([XX*0.25,YY/2+2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP+0.6, d=3.5*diameterCLIP+2, center=true, $fn=60);
            translate([-XX*0.25,YY/2+2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP+0.6, d=3.5*diameterCLIP+2, center=true, $fn=60);
            if(disableHINGE==1){
                translate([XX*0.25,-YY/2-2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP+0.6, d=3.5*diameterCLIP+2, center=true, $fn=60);
                translate([-XX*0.25,-YY/2-2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=widthCLIP+0.6, d=3.5*diameterCLIP+2, center=true, $fn=60);
            }
        }
        translate([0,0,WALL])  layer(XX,YY,WALL*4, WALL*4, ZZ+1, WALL);
        rotate([0,0,180]) translate([0,0,0.85*WALL]){
            linear_extrude(height = 3, center = false, convexity = 5, twist = -0, slices = 20, scale = 1.0) {
         
 if(includetext == 1){                
     text(str(width,"x",depth,"x",heightTOP+heightBOT,"|",thickness," mm"), font = "Sans Uralic:style=Bold", halign="center", size=width/16);
 } //end if text
            }
        }

        }
        if(TOP==1){
            difference(){
                translate([0,0,WALL+ZZ])  layer(XX,YY,WALL*7, WALL*6.5, 0.5*WALL, WALL);
                translate([0,0,WALL+ZZ-0.01])  layer(XX,YY,WALL*5, WALL*5.5, 0.5*WALL+0.02, WALL);
            }
            if(enableTOPinside==1){
                TOPinside();
            }
        }else{
            if(enableBOTinside==1){
                BOTinside();
            }
        }
}

module clipSupport(YY,ZZ,WALL,TOP,WIDTH,HOLEPOS){
    difference(){
        union(){
            hull(){
                translate([0,YY/2+2*WALL,WALL+ZZ-1.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH, d=3*WALL, center=true, $fn=60);
                if(disableHINGE==1){
                    translate([0,-YY/2-2*WALL,WALL+ZZ-1.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH, d=3*WALL, center=true, $fn=60);
                }
                if(TOP==1){
                    translate([0,YY/2+2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH, d=3*WALL, center=true, $fn=60);
                    if(disableHINGE==1){
                        translate([0,-YY/2-2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH, d=3*WALL, center=true, $fn=60);
                    }
                }else{
                    translate([0,YY/2+2*WALL,WALL+ZZ-3*WALL]) rotate([0,90,0]) cylinder(h=WIDTH, d=3*WALL, center=true, $fn=60);
                    if(disableHINGE==1){
                        translate([0,-YY/2-2*WALL,WALL+ZZ-3*WALL]) rotate([0,90,0]) cylinder(h=WIDTH, d=3*WALL, center=true, $fn=60);
                    }
                }
                if(TOP==0){
                    translate([0,0,WALL+ZZ-6*WALL]) cube([WIDTH,YY+4*WALL,1], center=true);
                }else{
                    if(heightTOP>6.1*WALL){
                        translate([0,0,WALL+ZZ-6*WALL]) cube([WIDTH,YY+4*WALL,1], center=true);
                    }else{
                        if(disableHINGE==1){
                            translate([0,0,0.5]) cube([WIDTH,YY+4*WALL,1], center=true);
                        }else{
                            translate([0,0.5*WALL,0.5]) cube([WIDTH,YY+3*WALL,1], center=true);
                        }
                    }
                }
            }
            if(TOP==0 &&disableHINGE==0 ){
                hull(){
                    translate([0,-YY/2-3.5*WALL-0*diameterCLIP,WALL+ZZ]) rotate([0,90,0]) cylinder(h=WIDTH, d=3*WALL, center=true, $fn=60);
                    translate([0,-YY/2-2*WALL,WALL+ZZ-1.5*WALL]) cube([WIDTH,0.1,3*WALL], center=true);
                }
            }
            hull(){
                translate([0,0,WALL+ZZ/2]) cube([WIDTH,YY+4*WALL,ZZ], center=true);
                translate([0,0,WALL/2]) cube([WIDTH,YY+2*WALL,WALL], center=true);
            }
        }
        // -
        if(TOP==1){
            // HOLEPOS defines the orientation conical holes for screw without nuts
            if(HOLEPOS==1){
                translate([0,YY/2+2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d1=diameterCLIP-0.4, d2=diameterCLIP+0.2, center=true, $fn=30);
                if(disableHINGE==1){
                    translate([0,-YY/2-2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d1=diameterCLIP-0.4, d2=diameterCLIP+0.2, center=true, $fn=30);
                }
            }else if(HOLEPOS==2){
                translate([0,YY/2+2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d2=diameterCLIP-0.4, d1=diameterCLIP+0.2, center=true, $fn=30);
                if(disableHINGE==1){
                    translate([0,-YY/2-2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d2=diameterCLIP-0.4, d1=diameterCLIP+0.2, center=true, $fn=30);
                }
            }else{
                translate([0,YY/2+2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d=diameterCLIP+0.2, center=true, $fn=30);
                if(disableHINGE==1){
                    translate([0,-YY/2-2*WALL,WALL+ZZ-3.5*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d=diameterCLIP+0.2, center=true, $fn=30);
                }
            }
        }else{
            if(HOLEPOS==1){
                translate([0,YY/2+2*WALL,WALL+ZZ-3*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d1=diameterCLIP-0.4, d2=diameterCLIP+0.2, center=true, $fn=30);
                if(disableHINGE==1){
                    translate([0,-YY/2-2*WALL,WALL+ZZ-3*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d1=diameterCLIP-0.4, d2=diameterCLIP+0.2, center=true, $fn=30);
                }
            }else if(HOLEPOS==2){
                translate([0,YY/2+2*WALL,WALL+ZZ-3*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d2=diameterCLIP-0.4, d1=diameterCLIP+0.2, center=true, $fn=30);
                if(disableHINGE==1){
                    translate([0,-YY/2-2*WALL,WALL+ZZ-3*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d2=diameterCLIP-0.4, d1=diameterCLIP+0.2, center=true, $fn=30);
                }
            }else{
                translate([0,YY/2+2*WALL,WALL+ZZ-3*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d=diameterCLIP+0.2, center=true, $fn=30);
                if(disableHINGE==1){
                    translate([0,-YY/2-2*WALL,WALL+ZZ-3*WALL]) rotate([0,90,0]) cylinder(h=WIDTH+1, d=diameterCLIP+0.2, center=true, $fn=30);
                }
            }
        }
        if(HOLEPOS==1 &&disableHINGE==0 ){
            translate([0,-YY/2-3.5*WALL-0*diameterCLIP,WALL+ZZ]) rotate([0,90,0]) cylinder(h=WIDTH+1, d1=diameterCLIP-0.4, d2=diameterCLIP+0.2, center=true, $fn=30);
        }else if(HOLEPOS==2){
            translate([0,-YY/2-3.5*WALL-0*diameterCLIP,WALL+ZZ]) rotate([0,90,0]) cylinder(h=WIDTH+1, d2=diameterCLIP-0.4, d1=diameterCLIP+0.2, center=true, $fn=30);
        }else{
            translate([0,-YY/2-3.5*WALL-0*diameterCLIP,WALL+ZZ]) rotate([0,90,0]) cylinder(h=WIDTH+1, d=diameterCLIP+0.2, center=true, $fn=30);
        }
    }
}

module layer(XX,YY,D1,D2,ZZ,WALL){
    hull(){
        translate([XX/2-2*WALL,YY/2-2*WALL,0]) cylinder(h=ZZ, d1=D1, d2=D2, center=false, $fn=60);
        translate([-XX/2+2*WALL,YY/2-2*WALL,0]) cylinder(h=ZZ, d1=D1, d2=D2, center=false, $fn=60);
        translate([XX/2-2*WALL,-YY/2+2*WALL,0]) cylinder(h=ZZ, d1=D1, d2=D2, center=false, $fn=60);
        translate([-XX/2+2*WALL,-YY/2+2*WALL,0]) cylinder(h=ZZ, d1=D1, d2=D2, center=false, $fn=60);
    }
}

module fourSupport(SCREWDIA,ZZ){
    difference(){
        // four support
        union(){
            difference(){
                union(){
                    hull(){
                        translate([width/2-2*thickness,depth/2-2*thickness,thickness]) cylinder(h=ZZ, d=3*thickness, center=false, $fn=60);
                        translate([width/2-1*thickness,depth/2-1*thickness,thickness]) cylinder(h=ZZ, d=3*thickness, center=false, $fn=60);
                    }
                    hull(){
                        translate([width/2-2*thickness,-depth/2+2*thickness,thickness]) cylinder(h=ZZ, d=3*thickness, center=false, $fn=60);
                        translate([width/2-1*thickness,-depth/2+1*thickness,thickness]) cylinder(h=ZZ, d=3*thickness, center=false, $fn=60);
                    }
                    hull(){
                        translate([-width/2+2*thickness,depth/2-2*thickness,thickness]) cylinder(h=ZZ, d=3*thickness, center=false, $fn=60);
                        translate([-width/2+1*thickness,depth/2-1*thickness,thickness]) cylinder(h=ZZ, d=3*thickness, center=false, $fn=60);
                    }
                    hull(){
                        translate([-width/2+2*thickness,-depth/2+2*thickness,thickness]) cylinder(h=ZZ, d=3*thickness, center=false, $fn=60);
                        translate([-width/2+1*thickness,-depth/2+1*thickness,thickness]) cylinder(h=ZZ, d=3*thickness, center=false, $fn=60);
                    }
                }
                translate([width/2-2*thickness,depth/2-2*thickness,thickness+0.1]) cylinder(h=ZZ, d=SCREWDIA-0.3, center=false, $fn=60);
                    translate([width/2-2*thickness,depth/2-2*thickness,thickness+ZZ-4.9]) cylinder(h=5, d1=SCREWDIA-0.3, d2=SCREWDIA+0.2, center=false, $fn=60);
                translate([width/2-2*thickness,-depth/2+2*thickness,thickness+0.1]) cylinder(h=ZZ, d=SCREWDIA-0.3, center=false, $fn=60);
                    translate([width/2-2*thickness,-depth/2+2*thickness,thickness+0.1]) cylinder(h=5, d1=SCREWDIA-0.3, d2=SCREWDIA+0.2, center=false, $fn=60);
                translate([-width/2+2*thickness,depth/2-2*thickness,thickness+0.1]) cylinder(h=ZZ, d=SCREWDIA-0.3, center=false, $fn=60);
                    translate([-width/2+2*thickness,depth/2-2*thickness,thickness+0.1]) cylinder(h=5, d1=SCREWDIA-0.3, d2=SCREWDIA+0.2, center=false, $fn=60);
                translate([-width/2+2*thickness,-depth/2+2*thickness,thickness+0.1]) cylinder(h=ZZ, d=SCREWDIA-0.3, center=false, $fn=60);
                    translate([-width/2+2*thickness,-depth/2+2*thickness,thickness+0.1]) cylinder(h=5, d1=SCREWDIA-0.3, d2=SCREWDIA+0.2, center=false, $fn=60);
            }
    }

        difference(){
            translate([0,0,thickness+heightBOT-1.0*thickness])  layer(width,depth,thickness*6.5, thickness*7, 1*thickness+0.1, thickness);
            translate([0,0,thickness+heightBOT-1.0*thickness])  layer(width,depth,thickness*5.5, thickness*5, 1*thickness+0.1, thickness);
            }            
        // bevel support
            A=width/2-3*thickness;
            B=depth/2-3*thickness;
            C=sqrt( pow(A,2) + pow(B,2) );
            D=width/2-0.5*thickness;
            E=depth/2-0.5*thickness;
            F=sqrt( pow(D,2) + pow(E,2) );
            translate([0,0,thickness]) cylinder(h=ZZ+0.1,d1=2*F,d2=2*C, $fn=400);
    }
        // center support
        difference(){
            translate([-5,depth/2,thickness+ZZ]) rotate([180,0,0]) cube([10,thickness,10],center=false);
            translate([-6,depth/2-thickness,thickness+ZZ]) rotate([180+20,0,0]) cube([12,thickness*1.5,12],center=false);
        }
        mirror([0,1,0]) difference(){
            translate([-5,depth/2,thickness+ZZ]) rotate([180,0,0]) cube([10,thickness,10],center=false);
            translate([-6,depth/2-thickness,thickness+ZZ]) rotate([180+20,0,0]) cube([12,thickness*1.5,12],center=false);
        }

}
//Joins 
p1=[0,0,0];
p2=[13,10,0];
p3=[11,-11,0];
s=8;
distance1 = width-19;
distance2 = depth-2.6;
Sizejoins=2.2;





module Joins(j){
for(i=[0:1/200:1]){
    union(){
    translate (p1*(1-i)+p2*i+i*p3*(1-i)+p1*(1-i))
    circle(d=Sizejoins,$fn=s);}}}
    module complete (js){
    Joins();
    translate(p2)
    circle(d=Sizejoins,$fn=s);
    hull(){
    translate(p1)
    circle(d=Sizejoins,$fn=s);
        translate(p1+[-distance1,0,0])
    circle(d=Sizejoins,$fn=s);}
   translate([-distance1,0,0])
    mirror([1,0,0])
    Joins();
    
    translate([0,10,0]+[0,distance2,0])
    mirror([0,1,0]){
    Joins();
    translate(p2)
    circle(d=Sizejoins,$fn=s);
    hull(){
    translate(p1)
    circle(d=Sizejoins,$fn=s);
        translate(p1+[-distance1,0,0])
    circle(d=Sizejoins,$fn=s);}
   translate([-distance1,0,0])
    mirror([1,0,0])
    Joins();}
    
    hull(){
    translate(p2)
    circle(d=Sizejoins,$fn=s);
        translate(p2+[0,distance2-10,0])
    circle(d=Sizejoins,$fn=s);
        
    }
    translate([-distance1-26,0,0])
    hull(){
    translate(p2)
    circle(d=Sizejoins,$fn=s);
        translate(p2+[0,distance2-10,0])
    circle(d=Sizejoins,$fn=s);
        
    }
}
translate([0,0,-3])
if(arangeForPrint==0){
    color("red")
linear_extrude(height=heightjoins,slices=20)
translate([distance1-distance1/2,8.5,0])
color("red")
complete();}
translate([0,-100,-3])
if(arangeForPrint==1){
linear_extrude(height=heightjoins,slices=20)
translate([distance1+distance1,0,0])
complete();}
