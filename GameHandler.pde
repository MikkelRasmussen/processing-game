class GameHandler {

  int score;
  int gsec;
  int endsec;
  int time;

  boolean start = true;
  boolean state = false;

  String mode = "startScreen";

  GameHandler() {

    score = 0;
    time = 120;
  }


  void score() {
    textSize(32);
    text("Score:" +score, width/2-60, height-120);
  }

  void spawnTarget() {
    if (millis() - gsec > 1250) {
      gsec = millis();
      state = !state;
    }

    if (state) {
      targets.add(new Target(random(10, 300), random(10, 300), 40, 15, 2));
      state = !state;
    }
  }

  void startScreen() {
    background(100, 220, 220);
    textSize(64);
    text("Start by pressing Enter", 50, height/2);

    if (keyPressed) {
      if (key == ENTER) {
        mode = "gameScreen";
        start = true;
        keyPressed = false;
      }
    }
    println(mode);
  }

  void gameScreen() {
    if (start) {
      start = false;
      endsec = millis();
      score = 0;
    }
    text("Time left:" + (60-((millis()-endsec)/1000)), width/2-60, height-160);
    println((millis()-endsec)/1000);

    if ((millis()-endsec)/1000 > 60) {
      mode = "resetScreen";
    }
  }
  void resetScreen() {
    if (keyPressed) {
      if (key == ENTER) {
        mode = "startScreen";
        keyPressed = false;
      }
    }
    textSize(48);
    text("Score:" +score, width/2-100, height/2-100);
    text("Press Enter to go to Main Screen", 25, height/2);
  }
}
