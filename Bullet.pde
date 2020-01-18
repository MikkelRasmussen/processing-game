class Bullet {

  PVector location;
  PVector size;
  PVector speed;
  PVector acceleration;


  Bullet(float x, float y, float w, float h, float s) {

    location = new PVector(x, y);
    size =  new PVector(w, h);
    speed = new PVector(0, s);
    acceleration = new PVector(0, 0);
  }

  void move() {
    speed.add(acceleration);
    location.add(speed);
    acceleration.mult(0);
  }

  void display() {
    rect(location.x, location.y, size.x, size.y);
  }
}
