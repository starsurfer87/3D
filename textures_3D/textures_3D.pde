PImage diamond, dirt, grassSide, grassTop;
float rotx, roty;

void setup() {
  size(800, 800, P3D);
  textureMode(NORMAL);
  diamond = loadImage("diamond.png");
  dirt = loadImage("dirt.png");
  grassTop = loadImage("grass_top.png");
  grassSide = loadImage("grass_side.png");
  }

void draw() {
  background(0);
  
  texturedCube(width/2, height/2, 0, diamond, 100);
  texturedCube(width/2, 200, 200, dirt, 100);
  texturedCube(600, 200, 0, grassTop, grassSide, dirt, 100);
}

void texturedCube(float x, float y, float z, PImage texture, float size) {
  pushMatrix(); 
  
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  noStroke();
  
  beginShape(QUADS);
  texture(texture);
  //top
  //vertex(x, y, z, texture's x, texture's y)
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  endShape();
  
  popMatrix();
}

void texturedCube(float x, float y, float z, PImage top,  PImage side, PImage bottom,float size) {
  pushMatrix(); 
  
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  noStroke();
  
  //top
  beginShape(QUADS);
  texture(top);
  //vertex(x, y, z, texture's x, texture's y)
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();
  
  //bottom
  beginShape(QUADS);
  texture(bottom);
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(side);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  endShape();
  
  popMatrix();
}

void mouseDragged() {
 rotx += (pmouseY - mouseY)*0.01;
 roty += (pmouseX - mouseX)*-0.01;
}
