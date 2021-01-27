class GameObject {
  
  PVector loc;
  float size;
  float lives;
  color c;
  
  //default
  GameObject() {
    loc = new PVector(0, 0, 0);
    size = 10;
    lives = 1;
    c = white;
  }
  
  GameObject(float x, float y, float z, float s) {
    lives = 1;
    loc = new PVector(x, y, z);
    size = s;
    c = white;
  }
  
  void act() {}
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(c);
    world.stroke(200);
    world.box(size);
    world.popMatrix();
  }
}
