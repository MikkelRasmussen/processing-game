class Target {

  PVector location;
  PVector size;
  PVector speed;
  PVector acceleration;


  Target(float x, float y, float w, float h, float s) {

    location = new PVector(x, y);
    size =  new PVector(w, h);
    speed = new PVector(s, 0);
    acceleration = new PVector(0, 0);
  }

  void move() {
    speed.add(acceleration);
    location.add(speed);
    acceleration.mult(0);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    }
    if (location.x < 0 ) {
      location.x = width;
    }
  }

  void display() {
    rect(location.x, location.y, size.x, size.y);
  }
}
