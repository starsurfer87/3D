class Snowflake extends GameObject {
  
  float speed;
  float xoff, yoff1, yoff2;
  
  Snowflake() {
    loc = new PVector (random(-sceneSize, sceneSize), 0, random(-sceneSize, sceneSize));
    size = random(2,5);
    lives = 1;
    speed = size + 3;
    c = white;
    xoff = 0;
    yoff1 = random(15);
    yoff2 = random(15);
  }
  
  void act() {
    loc.y += speed;
    loc.x += (noise(xoff, yoff1) - 0.5)*5;
    loc.z += (noise(xoff, yoff2) - 0.5)*5;
    xoff += 0.05;
    if (loc.y > height) {
      if (weather == RAIN) {
        lives = 0;
        objects.add(new Rain());
      } else {
        loc.y = 0;
        loc.x = random(-sceneSize, sceneSize);
      }
    }
  }

}
