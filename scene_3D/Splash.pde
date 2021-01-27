class Splash extends GameObject {
  
  PVector vel;
  
  Splash() {
    loc.x = eyex + cos(leftRightAngle)*75;
    loc.y = eyey + 60;
    loc.z = eyez + sin(leftRightAngle)*75;
    vel = new PVector(random(-1, 1), -2, random(-1, 1));
    vel.setMag(10);
    size = 2;
    lives = 1;
    c = #183DF4;
  }
  
  void act() {
    loc.add(vel);
    vel.y += 1;
    if (loc.y < 100) {
      lives = 0;
    }
  }
    
}
