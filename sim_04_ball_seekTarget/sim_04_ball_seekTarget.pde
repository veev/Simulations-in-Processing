
//Declare Ball object called myBall;
Ball myBall;

void setup() {
 size(800, 800); 
 //Instantiate myBall object
 myBall = new Ball();
}

void draw() {
  background(255);
  myBall.update(mouseX, mouseY);
  myBall.display();
}

void mousePressed() {
  
  if (myBall.insideCircle(mouseX, mouseY)){
     myBall.toggleButton(); 
  } 
}
