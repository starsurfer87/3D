void move() {
  /*
  pushMatrix();
  translate(focusx, focusy, focusz);
  sphere(3);
  popMatrix();
  */
  if (wkey && canMoveForward()) {
    eyex += cos(leftRightAngle)*10;
    eyez += sin(leftRightAngle)*10;
    checkElevation();
  }
  if (skey && canMoveBackward()) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
    checkElevation();
  }
  if (dkey && canMoveRight()) {
    eyex += cos(leftRightAngle + PI/2)*10;
    eyez += sin(leftRightAngle + PI/2)*10;
    checkElevation();
  }
  if (akey && canMoveLeft()) {
    eyex -= cos(leftRightAngle + PI/2)*10;
    eyez -= sin(leftRightAngle + PI/2)*10;
    checkElevation();
  }
  
  focusx = eyex + cos(leftRightAngle)*100;
  focusy = eyey + tan(upDownAngle)*100;
  focusz = eyez + sin(leftRightAngle)*100;

  leftRightAngle += (mouseX - pmouseX)*0.01;
  upDownAngle += (mouseY - pmouseY)*0.01;
  
  if (upDownAngle > radians(85)) upDownAngle = radians(85);
  if (upDownAngle < -radians(85)) upDownAngle = -radians(85);
  
  if (frameCount < 2) {
    rbt.mouseMove(width/2, height/2);
  }
  
  if (mouseX < 1) {
    rbt.mouseMove(width-2, mouseY);
  } else if (mouseX > width-2) {
    rbt.mouseMove(1, mouseY);
  } 
}

void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'e' || key == 'E') mode = PAUSE;
  if (key == ' ') spacekey= false;
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  }
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  float minx, miny, minz;
  float maxx, maxy, maxz;
  int mapx, mapy, mapminx, mapminy, mapmaxx, mapmaxy;
  
  fwdx = eyex + cos(leftRightAngle)*200;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*200;
  mapx = int(fwdx + 2000) / gridSize;
  mapy = int(fwdz + 2000) / gridSize;
  
  minx = eyex + cos(leftRightAngle - radians(30))*150;
  miny = eyey;
  minz = eyez + sin(leftRightAngle - radians(30))*150;
  mapminx = int(minx + 2000) / gridSize;
  mapminy = int(minz + 2000) / gridSize;
  
  maxx = eyex + cos(leftRightAngle + radians(30))*150;
  maxy = eyey;
  maxz = eyez + sin(leftRightAngle + radians(30))*150;
  mapmaxx = int(maxx + 2000) / gridSize;
  mapmaxy = int(maxz + 2000) / gridSize;
  
  if (colorsContain(nonCollisionColors, map.get(mapx, mapy)) && colorsContain(nonCollisionColors, map.get(mapminx, mapminy)) && colorsContain(nonCollisionColors, map.get(mapmaxx, mapmaxy))) {
    return true;
  } else {
    return false;
  }
    
}

boolean canMoveBackward() {
  float backx, backy, backz;
  float minx, miny, minz;
  float maxx, maxy, maxz;
  int mapx, mapy, mapminx, mapminy, mapmaxx, mapmaxy;
  
  backx = eyex - cos(leftRightAngle)*200;
  backy = eyey;
  backz = eyez - sin(leftRightAngle)*200;
  mapx = int(backx + 2000) / gridSize;
  mapy = int(backz + 2000) / gridSize;
  
  minx = eyex - cos(leftRightAngle - radians(30))*200;
  miny = eyey;
  minz = eyez - sin(leftRightAngle - radians(30))*200;
  mapminx = int(minx + 2000) / gridSize;
  mapminy = int(minz + 2000) / gridSize;
  
  maxx = eyex - cos(leftRightAngle + radians(30))*200;
  maxy = eyey;
  maxz = eyez - sin(leftRightAngle + radians(30))*200;
  mapmaxx = int(maxx + 2000) / gridSize;
  mapmaxy = int(maxz + 2000) / gridSize;
  
  if (colorsContain(nonCollisionColors, map.get(mapx, mapy)) && colorsContain(nonCollisionColors, map.get(mapminx, mapminy)) && colorsContain(nonCollisionColors, map.get(mapmaxx, mapmaxy))) {    
    return true;
  } else {
    return false;
  }
    
}

boolean canMoveRight() {
  float rightx, righty, rightz;
  float minx, miny, minz;
  float maxx, maxy, maxz;
  int mapx, mapy, mapminx, mapminy, mapmaxx, mapmaxy;
  
  rightx = eyex + cos(leftRightAngle + PI/2)*200;
  righty = eyey;
  rightz = eyez + sin(leftRightAngle + PI/2)*200;
  mapx = int(rightx + 2000) / gridSize;
  mapy = int(rightz + 2000) / gridSize;
  
  minx = eyex + cos(leftRightAngle + PI/2 - radians(30))*200;
  miny = eyey;
  minz = eyez + sin(leftRightAngle + PI/2 - radians(30))*200;
  mapminx = int(minx + 2000) / gridSize;
  mapminy = int(minz + 2000) / gridSize;
  
  maxx = eyex + cos(leftRightAngle + PI/2 + radians(30))*200;
  maxy = eyey;
  maxz = eyez + sin(leftRightAngle + PI/2 + radians(30))*200;
  mapmaxx = int(maxx + 2000) / gridSize;
  mapmaxy = int(maxz + 2000) / gridSize;
  
  if (colorsContain(nonCollisionColors, map.get(mapx, mapy)) && colorsContain(nonCollisionColors, map.get(mapminx, mapminy)) && colorsContain(nonCollisionColors, map.get(mapmaxx, mapmaxy))) {    
    return true;
  } else {
    return false;
  }
    
}

boolean canMoveLeft() {
  float backx, backy, backz;
  float minx, miny, minz;
  float maxx, maxy, maxz;
  int mapx, mapy, mapminx, mapminy, mapmaxx, mapmaxy;
  
  backx = eyex - cos(leftRightAngle + PI/2)*200;
  backy = eyey;
  backz = eyez - sin(leftRightAngle + PI/2)*200;
  mapx = int(backx + 2000) / gridSize;
  mapy = int(backz + 2000) / gridSize;
  
  minx = eyex - cos(leftRightAngle + PI/2 - radians(30))*200;
  miny = eyey;
  minz = eyez - sin(leftRightAngle + PI/2 - radians(30))*200;
  mapminx = int(minx + 2000) / gridSize;
  mapminy = int(minz + 2000) / gridSize;
  
  maxx = eyex - cos(leftRightAngle + PI/2 + radians(30))*200;
  maxy = eyey;
  maxz = eyez - sin(leftRightAngle + PI/2 + radians(30))*200;
  mapmaxx = int(maxx + 2000) / gridSize;
  mapmaxy = int(maxz + 2000) / gridSize;
  
  if (colorsContain(nonCollisionColors, map.get(mapx, mapy)) && colorsContain(nonCollisionColors, map.get(mapminx, mapminy)) && colorsContain(nonCollisionColors, map.get(mapmaxx, mapmaxy))) {
    return true;
  } else {
    return false;
  }
  
}

void checkElevation() {

  PVector radius;
  int mapx, mapy;
  float interval = 20;
  float charElevation = height + 100;
  float pointElevation = baseLevel;
  
  for (int deg = 0; deg < 360; deg += 15) {
    radius = new PVector(100, 0);
    radius.rotate(radians(deg));
    mapx = int(eyex + radius.x + 2000) / gridSize;
    mapy = int(eyez + radius.y + 2000) / gridSize;
    
    color c = map.get(mapx, mapy);
    if (colorsContain(nonCollisionColors, c)) {
    pointElevation =  baseLevel - elevations.get(c);
    }
    
    if (pointElevation < charElevation) charElevation = pointElevation;
  }
  
  if (eyey < charElevation - interval) eyey += interval;
  else if (eyey > charElevation + interval) eyey -= interval;
  else if (eyey > charElevation - interval && eyey < charElevation + interval) eyey = charElevation;
  
  if (charElevation == baseLevel - elevations.get(blue) && frameCount % 3 == 0) {
    for (int i = 0; i < 5; i++) {
      objects.add(new Splash());
    }
  }
}

boolean colorsContain(color[] array, color item) {
  for (color c : array) {
   if (c == item) {
     return true;
    }
  }
return false;
}
