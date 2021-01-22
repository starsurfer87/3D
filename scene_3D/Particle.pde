class Particle extends GameObject {
  
  int t; //transparency
  PVector vel;
  
  Particle(PVector startLoc) {
    loc = startLoc.copy();
    vel = new PVector(random(10, 15), 0, 0);
    vel.rotate(radians(random(360)));
    size = 10;
    lives = 1;
    t = 255;
  }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(white, t);
    stroke(200, t);
    box(size);
    popMatrix();
    t -= 3;
  }
  
  void act() {
    loc.add(vel);
    vel.add(0, 1, 0);
    if (t < 0) {
      lives = 0;
    }
  }
  
}
