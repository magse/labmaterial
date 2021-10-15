

include <BOSL/constants.scad>
use <BOSL/threading.scad>
include <BOSL/constants.scad>
use <BOSL/shapes.scad>


module dishsupport(D=35,H=10,depth=1.9,t=1.6,eps=0.001) {
    
    W=0.8*D;
    L=1.8*D;

    union() {
        difference() {
            translate([0,0,0.5*H]) cube([L,W,H],center=true);
            translate([0,0,-eps]) tube(h=depth,or1=0.5*D+0.2,or2=0.5*D,ir1=0.5*D-t-0.2,ir2=0.5*D-t,$fn=144);
            mirror([0,0,0]) for(n=[0.45*L:-0.05*L:0.3*L]) translate([n,0.52*W,0]) cylinder(d=0.04*L,h=4*H,center=true,$fn=36);
            mirror([1,0,0]) for(n=[0.45*L:-0.05*L:0.3*L]) translate([n,0.52*W,0]) cylinder(d=0.04*L,h=4*H,center=true,$fn=36);
            mirror([0,1,0]) for(n=[0.45*L:-0.05*L:0.3*L]) translate([n,0.52*W,0]) cylinder(d=0.04*L,h=4*H,center=true,$fn=36);
            mirror([1,0,0]) mirror([0,1,0]) for(n=[0.45*L:-0.05*L:0.3*L]) translate([n,0.52*W,0]) cylinder(d=0.04*L,h=4*H,center=true,$fn=36);
            translate([0,0,H]) cylinder(d1=0.8*D,d2=D,h=2,center=true,$fn=144);
            cylinder(d=0.4*D,h=4*H,center=true,$fn=144);
            translate([0,+0.5*W,0]) rotate([55,0,0]) cube([0.6*D,14,8],center=true);
            translate([0,-0.5*W,0]) rotate([-55,0,0]) cube([0.6*D,14,8],center=true);
        }   
        translate([0,0,0.5*H-0.5]) acme_threaded_nut(od=0.5*D,id=1/4*25.4,h=H-1,pitch=1/28*25.4,slop=0.2,$fn=144); 
    }
}

dishsupport();
