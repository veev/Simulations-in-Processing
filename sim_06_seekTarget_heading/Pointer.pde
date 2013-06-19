//Pointer Class

class Pointer {

  //Declare Variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxForce; //maximum steering force
  float maxSpeed; //maximum speed

  //Constructor
  Pointer() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,0);
    //acceleration is (0,0), it changes due to forces added to it
    acceleration = new PVector(0,0);
    maxForce = 0.5;
    maxSpeed = 8;
  }

  //Class functions
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    //reset acceleration to zero each frame
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
   //if you want to account for mass: acc = force / mass
    acceleration.add(force); 
  }
  
  //Steering Force towards target
  void seekTarget(PVector target) {
   PVector desired = PVector.sub(target, location); // like targetX - x
   float d = desired.mag(); //find the length of the desired vector
   
   //scale with arbitrary damping within 100 pixels - like our easing value
   if (d < 100) {
     float m = map(d, 0, 100, 0, maxSpeed);
     desired.setMag(m); //sets the length to the new mapped value
   } else {
     desired.setMag(maxSpeed); 
   }
   
   //Steering Force = Desired - Velocity
   PVector steer = PVector.sub(desired, velocity);
   steer.limit(maxForce);
   applyForce(steer);
    
  }

  void display() {
    //find the angle of the velocity vector
    float theta = velocity.heading2D();
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(theta);
    fill(0); 
    rect(0, 0, 40, 10);
    popMatrix();
  }
  
}

