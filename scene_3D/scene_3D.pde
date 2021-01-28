import java.awt.Robot;

Robot rbt;

//map variables
int sceneSize;
int gridSize;
PImage map, displayMap;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;
float baseLevel;

//keyboard variables
boolean wkey, akey, skey, dkey, spacekey;

//rotation varables
float leftRightAngle, upDownAngle;

//textures
PImage diamond, dirt, grassSide, grass, oakLeaves, oakLogSide, oakLog, sand, stone, flower;
ArrayList<PImage> gif;

//color palette
color black = #000000;
color white = #FFFFFF;
color blue = #0000FF;
color lightGreen = #B5E61D;
color darkGreen = #22B14C;
color brown = #804000;
color yellow = #FFFF00;

//canvases
PGraphics world;
PGraphics HUD;

ArrayList<GameObject> objects;
ArrayList<Block> blockList;

color[] nonCollisionColors = {white, blue, lightGreen, darkGreen, yellow};
HashMap<Integer, Integer> elevations;

int shotTimer, threshold;


void setup() {
  size(displayWidth, displayHeight, P2D);
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  
  sceneSize = 2000;
  gridSize = 100;
  map = loadImage("map4.png");
  displayMap = loadImage("map5.png");
  
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
  flower = loadImage("flower");
  
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  baseLevel = 7.5*height/10;
  
  eyex = width/2;
  eyey = baseLevel;
  eyez = height/2 - 200;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 300;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  leftRightAngle = 3*PI/2;
  
  shotTimer = 0;
  threshold = 30;
  
  objects = new ArrayList<GameObject>();
  for (int i = 0 ; i < 100; i++) {
    objects.add( new Rain() );
  }
  blockList = new ArrayList<Block>();
  
  elevations = new HashMap<Integer, Integer>();
  elevations.put(blue, -70);
  elevations.put(yellow, 0);
  elevations.put(white, 0);
  elevations.put(lightGreen, 100);
  elevations.put(darkGreen, 200);
  elevations.put(brown, 500);
  elevations.put(black, 400);
  
  generateMap();
  generateFlowers();
}

void draw() {
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(0);
  //world.lights();
  //world.lightFalloff(1.5, 0.0, 0.0);
  //world.ambientLight(251, 252, 232);
  //world.pointLight(255, 255, 255, eyex, eyey, eyez);
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
  shotTimer ++;
  //println(objects.size());
  
  world.endDraw();
  image(world, 0, 0);
  
  HUD.beginDraw();
  HUD.clear();
  crosshair();
  miniMap(50, 50);
  HUD.endDraw();
  image(HUD, 0, 0);
}


/* 
random ideas:
- changing weather
    - from rain, snow, clear
    - have background color change with weather
- play more with lighting (lightFalloff)
- object-oriented grass or flowers
- have stroke on game
*/
