class Rain extends GameObject {
  
  float speed;
  
  Rain() {
    loc = new PVector (random(-sceneSize, sceneSize), 0, random(-sceneSize, sceneSize));
    size = random(2,5);
    lives = 1;
    speed = size*8;
    c = #183DF4;
  }
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(c);
    world.stroke(hue(c), saturation(c), brightness(c) - 30.0);
    world.box(size, size*2, size);
    world.popMatrix();
  }
  
  void act() {
    loc.y += speed;
    if (loc.y > height) {
      if (weather == SNOW) {
        lives = 0;
        objects.add(new Snowflake());
      } else {
        loc.y = 0;
        loc.x = random(-sceneSize, sceneSize);
      }
    }
  }

}
