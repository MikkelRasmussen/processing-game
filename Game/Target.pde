class Target {

  PVector location;
  PVector size;
  PVector speed;
  PVector acceleration;

  float constant;

  boolean state;

  int gsec;


  Target(float x, float y, float w, float h, float s) {

    location = new PVector(x, y);
    size =  new PVector(w, h);
    speed = new PVector(s, 0);
    acceleration = new PVector(0, 0);

    constant = random(0.01, 0.03);

    gsec = int(random(0, 2500));
  }

  void movement() {
    if (millis()-gsec > 2500) {
      state = !state;
      gsec = millis();
      acceleration.mult(0);
    }
    if (state) {
      acceleration.add(0, constant);
    } else {
      acceleration.add(0, -constant);
    }
  }

  void checkedges() {
    if (location.y < 25){
      state = true;
      gsec = millis();
      acceleration.mult(0);
    }
    else if(location.y > 350){
      state = false;
      gsec = millis();
      acceleration.mult(0);
    }
  }

  void update() {
    checkedges();
    movement();
    location.add(acceleration);
    location.add(speed);
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
