PImage diamond, dirt, grassSide, grassTop;
float rotx, roty;
Diamond myBlock;

void setup() {
  size(800, 800, P3D);
  textureMode(NORMAL);
  diamond = loadImage("diamond.png");
  dirt = loadImage("dirt.png");
  grassTop = loadImage("grass_top.png");
  grassSide = loadImage("grass_side.png");
  myBlock = new Diamond(width/2, height/2, 0);
}

void draw() {
  background(0);
  
  myBlock.show();
}

void mouseDragged() {
 rotx += (pmouseY - mouseY)*0.01;
 roty += (pmouseX - mouseX)*-0.01;
}
