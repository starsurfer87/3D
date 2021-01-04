float rotx, roty, locx, locy;
boolean wkey, akey, skey, dkey;

void setup() {
  size(800, 800, P3D);
  rotx = radians(45);
  roty = radians(45);
  locx = width/2;
  locy = height/2;
  wkey = akey = skey = dkey = false;
}

void draw() {
  background(50);
  
  if (wkey) {
    locy -= 5;
  }
  if (skey) {
    locy += 5;
  }
  if (akey) {
    locx -= 5;
  }
  if (dkey) {
    locx += 5;
  }
  
  translate(locx, locy, 0);
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  box(100, 100, 100); // Width, Height, Depth
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
