/*
 * Coasters
 * by Monal Garg
 * created 2022-08-01
 * version v1.0
*/


$fn=100;

radius = 29;
height = 3;
height2 = height*2;
height3 = height2 + 1;
outer_edge_width = 2;
width=2;

module foo() {
    cylinder(r=radius, h=height);

    module concentric_circle(r1, r2) {
        difference() {
            color("Blue") cylinder(r=r1, h=height2);
            color("Blue") cylinder(r=r2, h=(height2+1));
        }
    }

    starting_circle_radius = 5;
    for (a=[0:2]) {
        outer_circle=starting_circle_radius + a*(width*2);
        small_circle=outer_circle-width;
        concentric_circle(r1=outer_circle, r2=small_circle);
    }

    // top right 1/4th circles
    intermediate_circle = 13;
    for (a=[0:4]) {
        outer_circle=intermediate_circle+a*(width*2);
        small_circle=outer_circle-width;
        intersection() {
            cube([radius,radius,height2+1]);
            concentric_circle(r1=outer_circle, r2=small_circle);
        }
    }

    // top left circle
    for (a=[0:3]) {
        shift_y = intermediate_circle + a*(width*2) + width;
        intersection() {
            color("Blue") translate([-1*radius, shift_y, 0]) cube([radius, width, height2]);
            cylinder(r=radius, h=height2+1);
        }
    }

    // bottom right circle
    for (a=[0:3]) {
        shift_x = intermediate_circle + a*(width*2) + width;
        intersection() {
            color("Blue") translate([shift_x, -1*radius, 0]) cube([width, radius, height2]);
            cylinder(r=radius, h=height2+1);
        }
    }

    // bottom left 1/4th circles
    for (a=[0:4]) {
        outer_circle=intermediate_circle + a*(width*2);
        small_circle=outer_circle-width;
        intersection() {
            translate([-2*radius+(intermediate_circle+width), -2*radius+(intermediate_circle+2), 0]) cube([2*radius,2*radius,height2+1]);
            concentric_circle(r1=outer_circle, r2=small_circle);
        }
    }
    
}

module foo2() {
    cylinder(r=radius, h=height);

    module concentric_circle(r1, r2) {
        difference() {
            color("Green") cylinder(r=r1, h=height2);
            color("Green") cylinder(r=r2, h=(height2+1));
        }
    }
    
    starting_circle_radius = 3;
    for (a=[0:3]) {
        outer_circle=starting_circle_radius + a*(width*2);
        small_circle=outer_circle-width;
        if (a==0){
            concentric_circle(r1=outer_circle, r2=0);
        }
        else{
            concentric_circle(r1=outer_circle, r2=small_circle);
        }
    }
    
    // top right 1/4th circles
    intermediate_circle = 15;
    for (a=[0:3]) {
        outer_circle=intermediate_circle+a*(width*2);
        small_circle=outer_circle-width;
        intersection() {
            cube([radius,radius,height2+1]);
            concentric_circle(r1=outer_circle, r2=small_circle);
        }
    }
    
    // top left circle
    for (a=[0:3]) {
        shift_y = intermediate_circle + a*(width*2) + width;
        intersection() {
            color("Green") translate([-1*radius, shift_y, 0]) cube([radius, width, height2]);
            cylinder(r=radius, h=height2+1);
        }
    }
    
    // bottom right circle
    for (a=[0:3]) {
        shift_x = intermediate_circle + a*(width*2) + width;
        intersection() {
            color("Green") translate([shift_x, -1*radius, 0]) cube([width, radius, height2]);
            cylinder(r=radius, h=height2+1);
        }
    }

    // bottom left 1/4th circles
    for (a=[0:3]) {
        outer_circle=intermediate_circle + a*(width*2);
        small_circle=outer_circle-width;
        intersection() {
            translate([-2*radius+(intermediate_circle+width), -2*radius+(intermediate_circle+2), 0]) cube([2*radius,2*radius,height2+1]);
            concentric_circle(r1=outer_circle, r2=small_circle);
        }
    }
}

foo();

translate([70, 0, 0])  foo2();
