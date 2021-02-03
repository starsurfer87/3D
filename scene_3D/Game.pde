void game() {
  world.beginDraw();
  world.colorMode(HSB);
  world.textureMode(NORMAL);
  world.background(skyBlue);
  //world.lights();
  //lightingColor = #FFFCDE;
  //world.lightFalloff(0.5, 0.0, 0.0);
  //println(hue(lightingColor));
  //println(saturation(lightingColor));
  //println(brightness(lightingColor));
  //world.ambientLight(hue(lightingColor), saturation(lightingColor), brightness(lightingColor), 0, 0, 0);
  //world.colorMode(RGB);
  //world.ambientLight(255, 255, 255);
  //world.colorMode(HSB);
  //world.pointLight(hue(lightingColor), saturation(lightingColor), brightness(lightingColor), eyex, eyey, eyez);
  //world.directionalLight(251, 252, 232, -1, 2, -1);
  
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  
  //drawAxis();
  //drawFloor(-sceneSize, sceneSize, height, gridSize);
  //drawFloor(-sceneSize, sceneSize, 0, gridSize);
  showMap();
  
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  
  if (spacekey && shotTimer > threshold) {
    objects.add(new Bullet());
    shotTimer = 0;
  }
  if (weatherTimer > 3000) {
    weather = int(random(2));
    println("weather change:" + weather);
    weatherTimer = 0;
  }
  shotTimer ++;
  weatherTimer ++;
  
  //println(objects.size());
  
  world.endDraw();
  image(world, 0, 0);
  
  HUD.beginDraw();
  HUD.clear();
  crosshair();
  miniMap(50, 50);
  HUD.text(weatherTimer, width/2, 100);
  HUD.endDraw();
  image(HUD, 0, 0);
}

void gameClicks() {
}
