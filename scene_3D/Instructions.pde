void instructions() {
  HUD.beginDraw();
  HUD.background(themeBase);
  HUD.fill(white);
  HUD.strokeWeight(3);
  HUD.stroke(themeAccent);
  HUD.rect(width/2 - 400, height/2 - 300, 800, 400);
  HUD.fill(themeAccent);
  HUD.textSize(70);
  HUD.text("INSTRUCTIONS", width/2, height/2 - 220);
  HUD.textSize(50);
  HUD.text("Use 'WASD' to move", width/2, height/2 - 100);
  HUD.text("Press 'E' to pause", width/2, height/2 - 50);
  HUD.text("Press space to throw a snowball", width/2, height/2);
  button(width/2, height/2 + 200, 300, 100, "LET'S START!");
  HUD.endDraw();
  image(HUD, 0, 0);
  
}

void instructionsClicks() {
  if (touchingMouse(width/2, height/2 + 200, 300, 100)) {
    mode = INTRO;
  }
}
