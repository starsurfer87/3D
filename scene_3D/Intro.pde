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
  
  
  HUD.textSize(textSize);
  HUD.fill(white);
  HUD.text(phrase, width/2, height/2 - 80);
  textSize += textInc;
  if (textSize >= 55 || textSize <= 50) textInc *= -1;
  println (textSize);
  
  button(width/2, height/2 + 100, 400, 120, "START", 100);
  button(width/2, height/2 + 250, 300, 80, "INSTRUCTIONS");
  
  HUD.endDraw();
  image(HUD, 0, 0);
}

void introClicks() {
  if (touchingMouse(width/2, height/2 + 100, 400, 150)) {
    mode = GAME;
  }
  if (touchingMouse(width/2, height/2 + 250, 300, 80)) {
    mode = INSTRUCTIONS;
  }
}
