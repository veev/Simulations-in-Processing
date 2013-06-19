//Ball Class

class Ball {

  //Declare Variables
  PVector location;
  //float x;
  //float y;
  PVector velocity;
  //float xSpeed;
  //float ySpeed;
  float radius;

  //Constructor
  Ball() {
    //position ball somewhere randomly onscreen
    location = new PVector(random(0, width), random(0, height));
    //x = random(0, width);
    //y = random(0, height);
    velocity = new PVector(random(1, 2), random(2, 3));
    //xSpeed = random(1, 2);
    //ySpeed = random(2, 3);
    radius = random(20, 60); //more like diameter
  }
  
  void update() {
    location.add(velocity);
    //x += xSpeed;
    //y += ySpeed;
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

