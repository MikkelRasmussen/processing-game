class UI {
  int score;
  int health;

  UI() {

    score = 0;
    health = 300;
    
  } 

  void update() {
    display();
    score();
    health();
  }


  void display() {
    fill(20, 20, 20);
    rect(0, height-70, width, 70);
    fill(255);
  }

  void health() {
    //Den røde container
    fill(255, 0, 0);
    rect(25, height-60, 300, 50);
    //Den grønne container
    fill(0, 255, 0);
    rect(25, height-60, health, 50);

    fill(255);
  }

  void score() {
    textSize(32);
    text("Score: " +score, width-150, height-24);
  }
}
