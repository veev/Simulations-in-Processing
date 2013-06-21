//GH - Added ControlP5 GUI Control

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


// Flocking
// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

import controlP5.*; //GUI Library for Sliders
ControlP5 controlP5;

// Click mouse to add boids into the system
Flock flock;
PVector center;
 
//values that will be controlled by sliders 
float separation = 25.0; 
float alignment = 4.0;
float cohesion = 5.0;
float maxspeed = 5.0;
float maxforce = 0.05;

void setup() {
  size(800, 800);
  center = new PVector(width/2,height/2);
  colorMode(RGB,255,255,255,100);
  
  controlP5 = new ControlP5(this);
  //slider arguments:name as string, min, max, default value, x, y, w, h
  controlP5.addSlider("separation", 0, 50, 25, 10, 10, 100, 10);
  controlP5.addSlider("alignment", 0, 10, 4, 10, 30, 100, 10);
  controlP5.addSlider("cohesion", 0, 10, 5, 10, 50, 100, 10);
  controlP5.addSlider("maxspeed", 0, 10, 5, 10, 70, 100, 10);
  controlP5.addSlider("maxforce", 0.0, 0.5, 0.05, 10, 90, 100, 10);
  
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 120; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
}


void draw() {

  background(100); 
  flock.run();

  if (mousePressed) {
    flock.addBoid(new Boid(mouseX,mouseY));
  }
}


void mousePressed() {
}

