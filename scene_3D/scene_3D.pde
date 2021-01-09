import java.awt.Robot;

Robot rbt;

int sceneSize;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//keyboard variables
boolean wkey, akey, skey, dkey;

//rotation varables
float leftRightAngle, upDownAngle;

ArrayList<Snowflake> snowList;


void setup() {
  size(displayWidth, displayHeight, P3D);
  sceneSize = 2000;
  
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  eyex = width/2;
  eyey = height/2;
  eyez = height/2;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  leftRightAngle = 3*PI/2;
  
  snowList = new ArrayList<Snowflake>();
  for (int i = 0 ; i < 100; i++) {
    snowList.add( new Snowflake() );
  }
}

void draw() {
  background(0);
  
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  
  drawAxis();
  drawFloor(-sceneSize, sceneSize, height, 100);
  drawFloor(-sceneSize, sceneSize, 0, 100);
  
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
  
  if (wkey) {
    eyex += cos(leftRightAngle)*10;
    eyez += sin(leftRightAngle)*10;
  }
  if (skey) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
  }
  if (dkey) {
    eyex += cos(leftRightAngle + PI/2)*10;
    eyez += sin(leftRightAngle + PI/2)*10;
  }
  if (akey) {
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

void drawAxis() {
  strokeWeight(2);
  //x-axis
  stroke(255, 0, 0);
  line(-sceneSize, 0, 0, sceneSize, 0, 0);
  //y-axis
  stroke(0, 255, 0);
  line(0, 0, 0, 0, height, 0);
  //z-axis
  stroke(0, 0, 255);
  line(0, 0, -sceneSize, 0, 0, sceneSize);
}

void drawFloor(int start, int end, int level, int gap) {
  //line(x1, y1, z1, x2, y2, z2);
  stroke(100);
  strokeWeight(1);
  for (int i = start; i <= end; i += gap) {
    line(i, level, start, i, level, end);
    line(start, level, i, end, level, i);
  }
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

/* 
random ideas:
- changing weather
    - from rain, snow, clear
    - have background color change with weather
- randomly generated lakes or trees
*/
