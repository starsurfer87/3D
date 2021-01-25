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
  }
  if (skey && canMoveBackward()) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
  }
  if (dkey && canMoveRight()) {
    eyex += cos(leftRightAngle + PI/2)*10;
    eyez += sin(leftRightAngle + PI/2)*10;
  }
  if (akey && canMoveLeft()) {
    eyex -= cos(leftRightAngle + PI/2)*10;
    eyez -= sin(leftRightAngle + PI/2)*10;
  }
  
  focusx = eyex + cos(leftRightAngle)*100;
  focusy = eyey + tan(upDownAngle)*100;
  focusz = eyez + sin(leftRightAngle)*100;

  leftRightAngle += (mouseX - pmouseX)*0.01;
  upDownAngle += (mouseY - pmouseY)*0.01;
  
  if (upDownAngle > radians(85)) upDownAngle = radians(85);
  if (upDownAngle < -radians(85)) upDownAngle = -radians(85);
  
  if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  if (mouseX < 2) rbt.mouseMove(width - 3, mouseY);
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
  if (key == ' ') spacekey= false;
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
  float fwdx, fwdz;
  float minx, minz;
  float maxx, maxz;
  int mapx, mapy, mapminx, mapminy, mapmaxx, mapmaxy;
  
  fwdx = eyex + cos(leftRightAngle)*200;
  fwdz = eyez + sin(leftRightAngle)*200;
  mapx = int(fwdx + 2000) / gridSize;
  mapy = int(fwdz + 2000) / gridSize;
  
  minx = eyex + cos(leftRightAngle - radians(30))*150;
  minz = eyez + sin(leftRightAngle - radians(30))*150;
  mapminx = int(minx + 2000) / gridSize;
  mapminy = int(minz + 2000) / gridSize;
  
  maxx = eyex + cos(leftRightAngle + radians(30))*150;
  maxz = eyez + sin(leftRightAngle + radians(30))*150;
  mapmaxx = int(maxx + 2000) / gridSize;
  mapmaxy = int(maxz + 2000) / gridSize;
  
  if (map.get(mapx, mapy) == blue || map.get(mapminx, mapminy) == blue || map.get(mapmaxx, mapmaxy) == blue) jump(8*height/10 + 70);
  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == yellow || map.get(mapminx, mapminy) == white || map.get(mapminx, mapminy) == yellow 
  || map.get(mapmaxx, mapmaxy) == white || map.get(mapmaxx, mapmaxy) == yellow) jump(8*height/10);
  if (map.get(mapx, mapy) == lightGreen || map.get(mapminx, mapminy) == lightGreen || map.get(mapmaxx, mapmaxy) == lightGreen) jump(8*height/10 - 100);
  if (map.get(mapx, mapy) == darkGreen || map.get(mapminx, mapminy) == darkGreen || map.get(mapmaxx, mapmaxy) == darkGreen) jump(8*height/10 - 200);
}

void jump(float level) {
  if (eyey < level) {
    while (eyey < level - 1) eyey += 1;
  } else if (eyey > level) {
    while (eyey > level + 1) eyey -= 1;
  }
  eyey = level;
}

boolean colorsContain(color[] array, color item) {
  for (color c : array) {
   if (c == item) {
     return true;
    }
  }
return false;
}
