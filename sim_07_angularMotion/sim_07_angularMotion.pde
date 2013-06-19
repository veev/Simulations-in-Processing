
Pointer[] pointers = new Pointer[10];

Attractor a;

void setup() {
  size(800,200);
  background(255);
  for (int i = 0; i < pointers.length; i++) {
    pointers[i] = new Pointer(random(0.1,2),random(width),random(height)); 
  }
  a = new Attractor();
}

void draw() {
  background(255);

  a.display();

  for (int i = 0; i < pointers.length; i++) {
    PVector force = a.attract(pointers[i]);
    pointers[i].applyForce(force);

    pointers[i].update();
    pointers[i].display();
  }

}










