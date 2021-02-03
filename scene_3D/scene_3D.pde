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
color cloudyGrey = #DAE2EA;
color skyBlue = #D4F1FA;
color themeAccent = #698841;
color themeBase = #60432E;

//canvases
PGraphics world;
PGraphics HUD;

//lighting
color lightingColor;

//fonts
PFont gameFont;

//mode framework
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int OPTIONS = 3;

//weather
int weather, weatherTimer;
final int RAIN = 0;
final int SNOW = 1;

//other
PImage introScreen;
String[] catchphrases = {
  "Why not take a swim?",
  "Grow your own tree!",
  "Flowers! Flowers! Flowers!",
  "Have a garden snowball fight!",
  "No need to pay for a landscape architect",
  "I wonder what's over the wall?"
};

ArrayList<GameObject> objects;
ArrayList<Block> blockList;

color[] nonCollisionColors = {white, blue, lightGreen, darkGreen, yellow};
HashMap<Integer, Integer> elevations;

int shotTimer, threshold;


void setup() {
  size(displayWidth, displayHeight, P2D);
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  mode = INTRO;
  
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
  oakLeaves = loadImage("Oak_Leaves_C.png");
  oakLogSide = loadImage("Oak_Log_Side.png");
  oakLog = loadImage("Oak_Log_Top.png");
  sand = loadImage("Sand.png");
  stone = loadImage("Stone_Bricks.png");
  flower = loadImage("flower");
  
  introScreen = loadImage("minecraft_landscape.png");
  
  gameFont = loadFont("PlayMeGamesReguler-150.vlw");
  
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  baseLevel = 7.5*height/10;
  
  threshold = 30;
  
  objects = new ArrayList<GameObject>();
  blockList = new ArrayList<Block>();
  
  elevations = new HashMap<Integer, Integer>();
  elevations.put(blue, -70);
  elevations.put(yellow, 0);
  elevations.put(white, 0);
  elevations.put(lightGreen, 100);
  elevations.put(darkGreen, 200);
  elevations.put(brown, 500);
  elevations.put(black, 400);
  
  gameSetup();
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println("ERROR! Mode = " + mode);
  }
}

void gameSetup() {
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
  weatherTimer = 0;

  weather = int(random(2));
  if (weather == RAIN) {
    for (int i = 0 ; i < 100; i++) {
      objects.add( new Rain() );
    }
  } else if (weather == SNOW) {
    for (int i = 0 ; i < 100; i++) {
      objects.add( new Snowflake() );
    }
  } else println("error: no weather");
  
  generateMap();
  generateFlowers();
}
/* 
random ideas:
- changing weather
    - from rain, snow, clear
    - have background color change with weather
- play more with lighting (lightFalloff)
- options menu:
    - weather select
    - show map

*/
