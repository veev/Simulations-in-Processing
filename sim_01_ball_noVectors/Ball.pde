//Ball Class

class Ball {

  //Declare Variables
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float radius;

  //Constructor
  Ball() {
    //position ball somewhere randomly onscreen
    x = random(0, width);
    y = random(0, height); 
    xSpeed = random(1, 2);
    ySpeed = random(2, 3);
    radius = random(20, 60); //more like diameter
  }
  
  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  void checkEdges() {
    if (x > width - (radius/2) || x < 0 + (radius/2)) {
      xSpeed *= -1; //change the direction
    } 

    if (y > height - (radius/2) || y < 0 + (radius/2)) {
      ySpeed *= -1;
    }
  }

  void display() {
    fill(0);
    ellipse(x, y, radius, radius);
  }
}

