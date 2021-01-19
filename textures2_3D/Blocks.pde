class Block {
  float x, y, z; 
  PImage top, side, bottom;
  float size;
  
  Block() {
    
  }
  
  void show() {
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
}

class Diamond extends Block {
  
  Diamond(float xi, float yi, float zi) {
    x = xi;
    y = yi;
    z = zi;
    top = side = bottom = diamond;
    size = 100;
  }
    
}
