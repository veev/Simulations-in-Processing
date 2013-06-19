//Ball Class

class Ball {

  //Declare Variables
  float x;
  float y;
  float targetX;
  float targetY;
  float easing;
  boolean buttonClicked;
  float radius;
  color ballColor;

  //Constructor
  Ball() {
    x = 0;
    y = 0;
    targetX = 0;
    targetY = 0;
    easing = 0.1;
    buttonClicked = false;
    radius = 40;
    ballColor = color(0, 0, 0);
  }

  //Class functions
  void update(float _targetX, float _targetY) {
    targetX = _targetX;
    targetY = _targetY;
    x += (targetX - x) * easing;
    y += (targetY - y) * easing;

    if (buttonClicked) {
      ballColor = color(255, 0, 0);
    } else {
      ballColor = color(0, 0, 0);
    }
  }

  void display() {
    fill(ballColor); 
    ellipse(x, y, radius, radius);
  }

  void toggleButton() {
    buttonClicked = !buttonClicked;
  }


  boolean insideCircle(float mX, float mY) {
    float distance = dist(x, y, mX, mY);
    if (distance < radius) {
      return true;
    }
    else {
      return false;
    }
  }
  
}

