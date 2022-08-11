/*
 * Bauhaus Geometric Print 
 * by Monal Garg
 * created 2022-08-01
 * version v1.0
*/


$fn=100;

radius = 10;
min_height = 2;
max_height = 5;

grid_width = 5;

module complete_circle(x, y, height) {
    translate([x+radius, y+radius, 0]) cylinder(h=height, r=radius);
}

module two_semi_circles_horizontal(x, y, height) {
    difference() {
        translate([x+radius, y, 0]) cylinder(r=radius, h=height);
        translate([x+radius, y-radius, 0]) cube(radius*2, center=true);
    }
    difference() {
        translate([x+radius, y+2*radius, 0]) cylinder(r=radius, h=height);
        translate([x+radius, y+3*radius, 0]) cube(radius*2, center=true);
    }
}

module two_semi_circles_vertical(x, y, height) {
    difference() {
        translate([x, y+radius, 0]) cylinder(r=radius, h=height);
        translate([x-radius, y+radius, 0]) cube(radius*2, center=true);
    }
    difference() {
        translate([x+2*radius, y+radius, 0]) cylinder(r=radius, h=height);
        translate([x+3*radius, y+radius, 0]) cube(radius*2, center=true);
    }
}

/* 
 * We will give coordinates for each cell as the top left corner 
 * coordinate. Top left most of the print is set to [0,0,0]. 
 * 0 = circle 
 * 1 = horizonal
 * 2 = vertical
*/
design = [1,1,2,1,2,1,2,2,1,2,0,1,2,1,1,2,2,1,2,0];
height_rand_vect=rands(min_height, max_height, len(design));

for (a=[0:len(design)]) {
    type = design[a];
    
    x = (a%(grid_width-1)) * 2*radius;
    y = floor(a/(grid_width-1)) * 2*radius;
    height = height_rand_vect[a];
    if (type == 0) complete_circle(y, x, height);
    else if (type == 1) two_semi_circles_horizontal(y, x, height);
    else if (type == 2) two_semi_circles_vertical(y, x, height);
}