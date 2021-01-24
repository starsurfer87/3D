void crosshair() {
  HUD.stroke(white);
  HUD.strokeWeight(5);
  HUD.line(width/2 - 20, height/2, width/2 + 20, height/2);
  HUD.line(width/2, height/2 - 20, width/2, height/2 +20);
}

void miniMap(int x, int y) {
  HUD.image(map, x, y, 120, 120); // x3
  
  int mapX = int(eyex + 2000)/gridSize;
  int mapY = int(eyez + 2000)/gridSize;
  
  HUD.fill(255);
  HUD.textSize(20); 
  HUD.text("X: " + mapX, x, y+150);
  HUD.text("Y: " + mapY, x, y+170);
  
  HUD.strokeWeight(0);
  HUD.stroke(255, 0, 0);
  HUD.fill(255, 0, 0);
  HUD.rect(x + mapX*3, y + mapY*3, 3, 3);
}
