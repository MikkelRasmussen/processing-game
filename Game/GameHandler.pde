class GameHandler {

  int spawnrate;
  int gsec;
  int time;
  int startHealth = UI.health;
  boolean start = false;
  boolean state = false;

  String mode = "startScreen";

  GameHandler() {

    time = 30;
  }
  void spawnTarget() {
    if (millis() - spawnrate > 1250) {
      spawnrate = millis();
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
      gsec = millis();
      UI.score = 0;
      UI.health = startHealth;
    }
    
    if(UI.health > 0 ){
      if((millis()-gsec) >= 100){
       UI.health = UI.health - startHealth/time/10;
       gsec = millis();
      }
    }
    
    if (UI.health <= 0 ) {
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
    text("Score:" +UI.score, width/2-100, height/2-100);
    text("Press Enter to go to Main Screen", 25, height/2);
  }
}
