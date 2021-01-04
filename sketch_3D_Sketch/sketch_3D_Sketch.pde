float rotx, roty, locx, locy;
boolean wkey, akey, skey, dkey;

void setup() {
  size(800, 800, P3D);
  rotx = radians(45);
  roty = radians(45);
  locx = 0;
  locy = 0;
  wkey = akey = skey = dkey = false;
}

void draw() {
  background(255);
  
  if (wkey) {
    locy += 5;
  }
  if (skey) {
    locy -= 5;
  }
  if (akey) {
    locx += 5;
  }
  if (dkey) {
    locx -= 5;
  }
  
  cube(300, 400, 0, #FF0000, 200);
  cube(600, 400, 5, #0000FF, 150);
  ball(200, 700, -100, #00FF00, 30);
  ball(700, 200, 10, #0000FF, 50);
  
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix(); 
  
  translate(x + locx, y + locy, z);
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  
  fill(c);
  box(size); 
  
  popMatrix();
}

void ball(float x, float y, float z, color c, float size) {
  pushMatrix(); 
  
  translate(x + locx, y + locy, z);
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  
  fill(c);
  sphere(size); 
  
  popMatrix();
}


void mouseDragged() {
 rotx += (pmouseY - mouseY)*0.01;
 roty += (pmouseX - mouseX)*-0.01;
}

void keyPressed() {
  if (key == 'W' || key == 'w') {
    wkey = true;
  }
  if (key == 'S' || key == 's') {
    skey = true;
  }
  if (key == 'A' || key == 'a') {
    akey = true;
  }
  if (key == 'D' || key == 'd') {
    dkey = true;
  }   
}

void keyReleased() {
  if (key == 'W' || key == 'w') {
    wkey = false;
  }
  if (key == 'S' || key == 's') {
    skey = false;
  }
  if (key == 'A' || key == 'a') {
    akey = false;
  }
  if (key == 'D' || key == 'd') {
    dkey = false;
  }
}
