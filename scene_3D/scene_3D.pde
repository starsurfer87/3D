import java.awt.Robot;

Robot rbt;

//camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//keyboard variables
boolean wkey, akey, skey, dkey;

//rotation varables
float leftRightAngle, upDownAngle;


void setup() {
  size(displayWidth, displayHeight, P3D);
  
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
}

void draw() {
  background(0);
  
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  
  drawAxis();
  drawFloor(-2000, 2000, height, 100);
  drawFloor(-2000, 2000, 0, 100);
}

void move() {
  
  pushMatrix();
  translate(focusx, focusy, focusz);
  sphere(3);
  popMatrix();
  
  if (dkey) eyex += 10;
  if (akey) eyex -= 10;
  if (skey) eyez += 10;
  if (wkey) eyez -= 10;
  
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
  line(-2000, 0, 0, 2000, 0, 0);
  //y-axis
  stroke(0, 255, 0);
  line(0, 0, 0, 0, height, 0);
  //z-axis
  stroke(0, 0, 255);
  line(0, 0, -2000, 0, 0, 2000);
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
