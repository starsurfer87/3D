class Snowflake {
  
  float x, y, z, size, speed;
  
  Snowflake() {
    x = random(-sceneSize, sceneSize);
    z = random(-sceneSize, sceneSize);
    y = 0;
    size = random(3,10);
    speed = size;
  }
  
  void act() {
    y += speed;
    if (y > height) {
      y = 0;
      x = random(-sceneSize, sceneSize);
    }
  }
  
  void show() {
     pushMatrix(); 
     translate(x, y, z);
     fill(255);
     stroke(255);
     box(size); 
     popMatrix();
  }

}
