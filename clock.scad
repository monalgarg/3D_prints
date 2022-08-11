/*
 * Bauhaus Geometric Print 
 * by Monal Garg
 * created 2022-08-01
 * version v1.0
*/


$fn=100;

radius = 29;
height = 3;
height2 = 5;
height3 = height2 + 1;
outer_edge_width = 2;

cylinder(r=radius, h=height);

module concentric_circle(r1, r2) {
    difference() {
        color("Blue") cylinder(r=r1, h=height2);
        color("Blue") cylinder(r=r2, h=(height2+1));
    }
}

starting_circle_radius = 5;
for (a=[0:2]) {
    outer_circle=starting_circle_radius+a*4;
    small_circle=outer_circle-2;
    concentric_circle(r1=outer_circle, r2=small_circle);
}

// top right 1/4th circles
intermediate_circle = 13;
for (a=[0:4]) {
    outer_circle=intermediate_circle+a*4;
    small_circle=outer_circle-2;
    intersection() {
        cube([radius,radius,height2+1]);
        concentric_circle(r1=outer_circle, r2=small_circle);
    }
}

// top left circle
for (a=[0:3]) {
    shift_y = intermediate_circle + a*4 + 2;
    intersection() {
        color("Blue") translate([-1*radius, shift_y, 0]) cube([radius, 2, height2]);
        cylinder(r=radius, h=height2+1);
    }
}

// bottom right circle
for (a=[0:3]) {
    shift_x = intermediate_circle + a*4 + 2;
    intersection() {
        color("Blue") translate([shift_x, -1*radius, 0]) cube([2, radius, height2]);
        cylinder(r=radius, h=height2+1);
    }
}

// bottom left 1/4th circles
for (a=[0:4]) {
    outer_circle=intermediate_circle+a*4;
    small_circle=outer_circle-2;
    intersection() {
        translate([-2*radius+(intermediate_circle+2), -2*radius+(intermediate_circle+2), 0]) cube([2*radius,2*radius,height2+1]);
        concentric_circle(r1=outer_circle, r2=small_circle);
    }
}

// outer edge
color("Green") difference() {
    cylinder(r=radius+outer_edge_width, h=height3);
    cylinder(r=radius, h=height3+2);
}

// stand
color("Green") translate([0, -radius-outer_edge_width, 0]) cube([radius, outer_edge_width, height3]);
color("Green") translate([radius, -radius-outer_edge_width, 0]) cube([outer_edge_width, radius, height3]);
