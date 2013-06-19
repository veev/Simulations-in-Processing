
//Declare Pointer object called myPointer;
Pointer myPointer;

void setup() {
 size(800, 800); 
 //Instantiate myPointer object
 myPointer = new Pointer();
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(mouseX, mouseY);
  //send mouse as target for seekTarget function
  myPointer.seekTarget(mouse);
  myPointer.update();
  myPointer.display();
}

