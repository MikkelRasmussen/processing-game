class Player {

  PVector location;
  PVector size;
  PVector speed;

  int gsec;

  int score = 0;

  boolean state;

  ArrayList <Bullet> bullets; 

  Player(float x, float y, float w, float h, float s) {

    location = new PVector(x, y);
    size =  new PVector(w, h);
    speed = new PVector(s, 0);
  }

  void setup() {
    bullets = new ArrayList();
  }
  void input() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        location.sub(speed);
      } else if (keyCode == RIGHT) {
        location.add(speed);
      } else if ((keyCode == UP) && (state)) {
        Bullet temp = new Bullet(location.x+5, location.y-10, 10, 20, -10);
        bullets.add(temp);
        keyPressed = false;
        state = !state;
      }
    }
  }

  void checkEdges() {
    if (location.x > width - size.x) {
      location.x = width - size.x;
    } else if (location.x < 0) {
      location.x = 0;
    }
  }
  void update() {
    if (millis() - gsec > 500) {
      gsec = millis();
      state = !state;
    }

    removeToLimit(10);

    moveAll();
    displayAll();
    targetHit();
  }
  void display() {
    rect(location.x, location.y, size.x, size.y);
  }

  void removeToLimit(int maxLength)
  {
    while (bullets.size() > maxLength)
    {
      bullets.remove(0);
    }
  }
  void moveAll()
  {
    for (Bullet temp : bullets)
    {
      temp.move();
    }
  }
  void displayAll()
  {
    for (Bullet temp : bullets)
    {
      temp.display();
    }
  }
  void targetHit() {
    for (int i = bullets.size()-1; i >= 0; i-- ) {
      Bullet currentBullet = bullets.get(i);
      boolean removeBullet = false;
      for (int o = targets.size()-1; o >= 0; o--) {
        Target currentTarget = targets.get(o);
        if (currentTarget.location.x + currentTarget.size.x >= currentBullet.location.x &&
          currentTarget.location.x <= currentBullet.location.x + currentBullet.size.x &&  
          currentTarget.location.y + currentTarget.size.y >= currentBullet.location.y &&
          currentTarget.location.y <= currentBullet.location.y + currentBullet.size.y) {

          if (currentTarget.location.y < 100) {
            UI.score =  UI.score + 2;
          } else {
            UI.score++;
          }

          targets.remove(o);
          removeBullet = true; 

          break;
        }
      }
      if (removeBullet) {
        bullets.remove(i);
      }
    }
  }
}
