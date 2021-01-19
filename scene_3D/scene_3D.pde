import java.awt.Robot;

Robot rbt;

//map variables
int sceneSize;
int gridSize;
PImage map;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//keyboard variables
boolean wkey, akey, skey, dkey;

//rotation varables
float leftRightAngle, upDownAngle;

//textures
PImage diamond, dirt, grassSide, grass, oakLeaves, oakLogSide, oakLog, sand, stone;
ArrayList<PImage> gif;

//color palette
color black = #000000;
color white = #FFFFFF;
color blue = #0000FF;
color lightGreen = #B5E61D;
color darkGreen = #22B14C;
color brown = #804000;
color yellow = #FFFF00;


ArrayList<Snowflake> snowList;
ArrayList<Block> blockList;


void setup() {
  size(displayWidth, displayHeight, P3D);
  textureMode(NORMAL);
  
  sceneSize = 2000;
  gridSize = 100;
  map = loadImage("map4.png");
  
  gif = new ArrayList<PImage>();
  String gifDir = "Water";
  File dataDir = new File(sketchPath() + "/data/" + gifDir); 
  File[] files = dataDir.listFiles();
  for (File file : files) { 
    PImage frame = loadImage(gifDir + "/" + file.getName());
    gif.add(frame);
  }
  
  diamond = loadImage("Diamond.png");
  dirt = loadImage("Dirt_(texture)_JE2_BE2.png");
  grass = loadImage("Grass_Block_Top_C.png");
  grassSide = loadImage("Grass_Block_Side.png");
  oakLeaves = loadImage("Oak_Leaves.png");
  oakLogSide = loadImage("Oak_Log_Side.png");
  oakLog = loadImage("Oak_Log_Top.png");
  sand = loadImage("Sand.png");
  stone = loadImage("Stone_Bricks.png");
  
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  eyex = width/2;
  eyey = 8*height/10;
  eyez = height/2;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  leftRightAngle = 3*PI/2;
  
  rbt.mouseMove(width/2, height/2);
  
  snowList = new ArrayList<Snowflake>();
  for (int i = 0 ; i < 100; i++) {
    snowList.add( new Snowflake() );
  }
  blockList = new ArrayList<Block>();
  
  generateMap();
}

void draw() {
  background(0);
  //lights();
  ambientLight(251, 252, 232, 2000, 0, 0);
  //directionalLight(251, 252, 232, -1, 2, -1);
  
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  
  drawAxis();
  //drawFloor(-sceneSize, sceneSize, height, gridSize);
  //drawFloor(-sceneSize, sceneSize, 0, gridSize);
  showMap();
  
  for (int i = 0 ; i < 100; i++) {
    Snowflake mySnowflake = snowList.get(i);
    mySnowflake.act();
    mySnowflake.show();
  } 
  
}

void move() {
  
  pushMatrix();
  translate(focusx, focusy, focusz);
  sphere(3);
  popMatrix();
  
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
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
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
  
  if (map.get(mapx, mapy) == white && map.get(mapminx, mapminy) == white && map.get(mapmaxx, mapmaxy) == white) {
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
  
  if (map.get(mapx, mapy) == white && map.get(mapminx, mapminy) == white && map.get(mapmaxx, mapmaxy) == white) {
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
  
  if (map.get(mapx, mapy) == white && map.get(mapminx, mapminy) == white && map.get(mapmaxx, mapmaxy) == white) {
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
  
  if (map.get(mapx, mapy) == white && map.get(mapminx, mapminy) == white && map.get(mapmaxx, mapmaxy) == white) {
    return true;
  } else {
    return false;
  }
    
}
/* 
random ideas:
- changing weather
    - from rain, snow, clear
    - have background color change with weather
- randomly generated lakes or trees
- walking up one block difference
*/
