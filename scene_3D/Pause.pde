void pause() {
  HUD.beginDraw();
  HUD.clear();
  HUD.background(0, 5);
  button(width/2, height/2 - 75, 400, 100, "RESUME");
  button(width/2, height/2 + 75, 400, 100, "QUIT");
  HUD.endDraw();
  image(HUD, 0, 0);
  
}

void pauseClicks() {
  if (touchingMouse(width/2, height/2 - 50, 400, 100)) mode = GAME;
  if (touchingMouse(width/2, height/2 + 75, 400, 100)) {
    mode = INTRO;
    gameSetup();
  }
}
