class Particle extends GameObject {
  
  int t; //transparency
  PVector vel;
  
  Particle(PVector startLoc, PVector startDir) {
    loc = startLoc.copy();
    vel = startDir.copy();
    vel.mult(-1);
    vel.add(random(-30, 30), random(-30, 30), random(-30, 30));
    vel.setMag(random(5, 10));
    size = 10;
    lives = 1;
    t = 255;
  }
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white, t);
    world.stroke(200, t);
    world.box(size);
    world.popMatrix();
    t -= 7;
  }
  
  void act() {
    loc.add(vel);
    vel.add(0, 1, 0);
    if (t < 0) {
      lives = 0;
    }
  }
  
}
