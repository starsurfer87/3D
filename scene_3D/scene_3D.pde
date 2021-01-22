import java.awt.Robot;

Robot rbt;

//map variables
int sceneSize;
int gridSize;
PImage map;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//keyboard variables
boolean wkey, akey, skey, dkey, spacekey;

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

ArrayList<GameObject> objects;
ArrayList<Snowflake> snowList;
ArrayList<Block> blockList;

color[] nonCollisionColors = {white, blue, lightGreen, darkGreen, yellow};

int shotTimer, threshold;


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
  eyez = height/2 - 200;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 300;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  leftRightAngle = 3*PI/2;
  
  rbt.mouseMove(width/2, height/2);
  
  shotTimer = 0;
  threshold = 30;
  
  objects = new ArrayList<GameObject>();
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
  checkElevation();
  
  drawAxis();
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
  
  /*
  for (int n = 0 ; n < 100; n++) {
    Snowflake mySnowflake = snowList.get(n);
    mySnowflake.act();
    mySnowflake.show();
  } 
  */
  
  if (spacekey && shotTimer > threshold) {
    objects.add(new Bullet());
    shotTimer = 0;
  }
  shotTimer ++;

}


/* 
random ideas:
- changing weather
    - from rain, snow, clear
    - have background color change with weather
- randomly generated lakes or trees
- walking up one block difference
*/
