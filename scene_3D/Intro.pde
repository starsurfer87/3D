void intro() {
  HUD.beginDraw();
  
  HUD.image(introScreen, 0, 0, width, height);
  HUD.textAlign(CENTER, CENTER);
  HUD.textFont(gameFont);
  HUD.fill(themeBase);
  HUD.textSize(200);
  HUD.text("MINESCAPE", width/2 - 10, height/2 - 205);
  HUD.fill(themeAccent);
  HUD.textSize(200);
  HUD.text("MINESCAPE", width/2, height/2 - 200);
  
  
  HUD.rectMode(CENTER);
  button(width/2, height/2 + 100, 400, 120, "START", 100);
  
  HUD.endDraw();
  image(HUD, 0, 0);
}

void introClicks() {
  if (touchingMouse(width/2, height/2 + 100, 400, 150)) {
    mode = GAME;
  }
}
