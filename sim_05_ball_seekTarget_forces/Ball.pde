//Ball Class

class Ball {

  //Declare Variables
  PVector location;
  //float x;
  //float y;
  PVector velocity;
  PVector acceleration;
  //float targetX;
  //float targetY;
  //float easing;
  float maxForce; //maximum steering force
  float maxSpeed; //maximum speed
  boolean buttonClicked;
  float radius;
  color ballColor;

  //Constructor
  Ball() {
    location = new PVector(random(width), random(height));
    //x = 0;
    //y = 0;
    velocity = new PVector(0,0);
    //acceleration is (0,0), it changes due to forces added to it
    acceleration = new PVector(0,0);
    //targetX = 0;
    //targetY = 0;
    //easing = 0.1;
    maxForce = 0.5;
    maxSpeed = 8;
    buttonClicked = false;
    radius = 40;
    ballColor = color(0, 0, 0);
  }

  //Class functions
  void update() {
    //targetX = _targetX;
    //targetY = _targetY;
    //x += (targetX - x) * easing;
    //y += (targetY - y) * easing;
    
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    //reset acceleration to zero each frame
    acceleration.mult(0);

    if (buttonClicked) {
      ballColor = color(255, 0, 0);
    } else {
      ballColor = color(0, 0, 0);
    }
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
    fill(ballColor); 
    ellipse(location.x, location.y, radius, radius);
  }

  void toggleButton() {
    buttonClicked = !buttonClicked;
  }


  boolean insideCircle(PVector mouse) {
    float distance = dist(location.x, location.y, mouse.x, mouse.y);
    if (distance < radius) {
      return true;
    }
    else {
      return false;
    }
  }
  
}

