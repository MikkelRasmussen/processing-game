ArrayList<Target> targets = new ArrayList<Target>();

UI UI = new UI();;

Player player;
GameHandler gamehandler = new GameHandler();

void setup() {
  size(800, 600);

  for (int i = 0; i < 7; i++) {
    targets.add(new Target(i*100, random(30, 300), 40, 15, 2, false, false));
  }
  player = new Player(100, height-150, 20, 50, 5);

  player.setup();
}

void draw() {
  switch(gamehandler.mode) {
  case "startScreen":
    gamehandler.startScreen();
    break;

  case "gameScreen":
    background(100, 220, 220);

    for (Target target : targets) {
      target.update();
      target.checkEdges();
      target.display();
    }

    player.update();
    player.input();
    player.checkEdges();
    player.display();

    gamehandler.spawnTarget();
    gamehandler.gameScreen();
    
    UI.update();
    
    break;  

  case "resetScreen":
    background(100, 220, 220);
    gamehandler.resetScreen();
    break;
  }
}
