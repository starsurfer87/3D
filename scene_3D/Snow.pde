class Snowflake extends GameObject {
  
  float speed;
  
  Snowflake() {
    loc = new PVector (random(-sceneSize, sceneSize), 0, random(-sceneSize, sceneSize));
    size = random(2,5);
    lives = 1;
    speed = size + 3;
  }
  
  void act() {
    loc.y += speed;
    if (loc.y > height) {
      loc.y = 0;
      loc.x = random(-sceneSize, sceneSize);
    }
  }

}
