class Flower extends GameObject {
  
  Flower(int gridx, int gridy, int elevation) {
    loc.x = gridx*gridSize - sceneSize;
    loc.y = height - elevation - 195;
    loc.z = gridy*gridSize - sceneSize;
    size = 100;
    lives = 1;
  }
  
  void show() {
    world.pushMatrix(); 
    
    world.translate(loc.x, loc.y, loc.z);
    world.scale(size);
    world.noStroke();
    
    world.beginShape(QUADS);
    world.texture(flower);
    
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 1, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(0, 1, 0, 0, 1);
    
    world.vertex(0, 0, 1, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 1, 0, 1, 1);
    world.vertex(0, 1, 1, 0, 1);

    world.endShape();
    world.popMatrix();
  }
}
