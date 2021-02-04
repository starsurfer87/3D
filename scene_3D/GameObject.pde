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
    float colorBrightness = brightness(c) - 30.0;
    if (colorBrightness < 0.0) colorBrightness = 0.0;
    world.stroke(hue(c), saturation(c), colorBrightness);
    world.box(size);
    world.popMatrix();
  }
}
