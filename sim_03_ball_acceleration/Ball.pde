//Ball Class

class Ball {

  //Declare Variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float radius;

  //Constructor
  Ball() {
    //position ball somewhere randomly onscreen
    location = new PVector(random(width), random(height));
    //control the speed via acceleration now, set velocity to (0,0)
    velocity = new PVector(0, 0);
    //make the acceleration small, since it will be added to itself each frame
    acceleration = new PVector(-0.001, 0.01);
    maxSpeed = 8;
    radius = random(20, 60); //more like diameter
  }
  
  void update() {
    //add acceleration to velocity
    velocity.add(acceleration);
    //limit velocity to maxSpeed
    //velocity.limit(maxSpeed);
    //add velocity to location
    location.add(velocity);
  }

  void checkEdges() {
    //sometimes we still have to access the x and y values of the PVector separately
    if (location.x > width - (radius/2) || location.x < 0 +(radius/2)) {
      velocity.x *= -1; //change the direction
    } 

    if (location.y > height - (radius/2) || location.y < 0 + (radius/2)) {
      velocity.y *= -1; //change the direction
    }
  }

  void display() {
    fill(0);
    ellipse(location.x, location.y, radius, radius);
  }
}

