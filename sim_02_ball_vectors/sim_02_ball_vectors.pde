//Define a Ball object called 'myBall'
Ball myBall;

void setup() {
  size(400, 400);
  //Instantiate myBall object
  myBall = new Ball();
}

void draw() {
  //draw background each frame
  background(255);

  //update myBall position and draw each frame
  myBall.checkEdges();
  myBall.update();
  myBall.display();
}

