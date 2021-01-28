class Rain extends GameObject {
  
  float speed;
  
  Rain() {
    loc = new PVector (random(-sceneSize, sceneSize), 0, random(-sceneSize, sceneSize));
    size = random(2,5);
    lives = 1;
    speed = size*8;
    c = #183DF4;
    println(brightness(c));
  }
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(c);
    world.stroke(200);
    world.box(size, size*2, size);
    world.popMatrix();
  }
  
  void act() {
    loc.y += speed;
    if (loc.y > height) {
      loc.y = 0;
      loc.x = random(-sceneSize, sceneSize);
    }
  }

}
