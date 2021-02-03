void button(int x, int y, int w, int h, String label) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    HUD.stroke(themeAccent);
    HUD.strokeWeight(5);
  } else {
    HUD.stroke(themeBase);
    HUD.strokeWeight(3);
  }
  
  HUD.rectMode(CENTER);
  HUD.textAlign(CENTER, CENTER);
  HUD.fill(255);
  HUD.rect(x, y, w, h);
  HUD.fill(themeAccent);
  HUD.textSize(50);
  HUD.text(label, x, y);
  HUD.rectMode(CORNER);
}

void button(int x, int y, int w, int h, String label, int size) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    HUD.stroke(themeAccent);
    HUD.strokeWeight(5);
  } else {
    HUD.stroke(themeBase);
    HUD.strokeWeight(3);
  }
  
  HUD.rectMode(CENTER);
  HUD.textAlign(CENTER, CENTER);
  HUD.fill(255);
  HUD.rect(x, y, w, h);
  HUD.fill(themeAccent);
  HUD.textSize(size);
  HUD.text(label, x, y);
  HUD.rectMode(CORNER);
}

boolean touchingMouse(int x, int y, int w, int h) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    return true;
  } else {
    return false;
  }
}
