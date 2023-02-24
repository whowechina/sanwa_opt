// big: works for ITR8402 optical sensor
//bias = 0.35;
//leg = 11.8;

// small: works for ITR1203 optical sensor
bias = 0.2;
leg = 7.8;

difference() {
  union() {
    click_ring();
    led_tube();
    translate([-5,0,3]) limiter();
    translate([5,0,3]) limiter(180);
    screws();
    mark();
  }
  led_hole();
}

module mark() { 
  color("green") hull() {
    translate([4.3,7.5,0]) sphere(d=1.15,$fn=32);
    translate([4.3,6.5,-3]) sphere(d=1,$fn=32);
  }

  color("green") hull() {
    translate([-4.3,7.5,0]) sphere(d=1.15,$fn=32);
    translate([-4.3,6.5,-3]) sphere(d=1,$fn=32);
  }
}

module click_ring() {
  difference() {
    translate([0,0,1.5]) {
      color("red") cylinder(d=18.50,h=3,center=true,$fn=256);
      color("brown") translate([0,0,0.2]) hull() {
        cylinder(d=18.50,h=0.9,center=true,$fn=256);
        cylinder(d=18.70,h=0.8,center=true,$fn=256);
        cylinder(d=19.00,h=0.6,center=true,$fn=256);
        cylinder(d=19.35,h=0.4,center=true,$fn=256);
        cylinder(d=19.60,h=0.2,center=true,$fn=256);
      }
    }
    color("gray") cube([7.4,50,20], center=true);
  }
  
  color("coral") cylinder(d=14.55,h=3,$fn=256);
}

module led_tube() {
  color("pink") cylinder(d=12.5,h=14,$fn=256);
}

module led_hole() {
  color("plum") translate([0,0,-1]) cylinder(d=10.7,h=30,$fn=128);
}

module limiter(angle) {
  color("silver") rotate([0,-90,angle]) hull() {
    translate([1.5,0,0]) resize([1,3.1,3.7]) cylinder(d=10,h=10,$fn=32);
    translate([0,0,0]) resize([1,3.2,4]) cylinder(d=10,h=10,$fn=32);
  }
}

module screw(angle) {
  difference() {
    color("cyan") hull() {
      rotate([0,0,angle]) translate([-0.75,-0.75,leg-5]) cylinder(d=3.8,h=8,$fn=32);
      translate([0,bias,0]) rotate([0,0,angle]) cylinder(d=4,h=leg-4,$fn=32);
    }
    color("gray") translate([0,bias,-0.1]) rotate([0,0,angle]) cylinder(d=1.6,h=8.5,$fn=32);
  }
}

module screws() {
  translate([5.8,5.8,-leg]) screw(0);
  translate([5.8,-5.8,-leg]) screw(-90);
  translate([-5.8,5.8,-leg]) screw(90);
  translate([-5.8,-5.8,-leg]) screw(180);
}