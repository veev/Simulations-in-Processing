
//Declare Ball object called myBall;
Ball myBall;
PVector mouse;

void setup() {
 size(800, 800); 
 //Instantiate myBall object
 myBall = new Ball();
}

void draw() {
  background(255);
  
  mouse = new PVector(mouseX, mouseY);
  //send mouse as target for seekTarget function
  myBall.seekTarget(mouse);
  myBall.update();
  myBall.display();
}

void mousePressed() {
  //mouse = new PVector(mouseX, mouseY);
  
  if (myBall.insideCircle(mouse)){
     myBall.toggleButton(); 
  } 
}
