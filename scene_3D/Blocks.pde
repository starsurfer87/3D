class Block {
  float x, y, z; 
  PImage top, side, bottom;
  float size;
  
  Block(float x, float y, float z) {
    this.x = x;
    this.y = y - 100;
    this.z = z;
    size = 100;
  }
  
  void show() {
    pushMatrix(); 
    
    translate(x, y, z);
    scale(size);
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
  
  Diamond(float x, float y, float z) {
    super(x, y, z);
    top = side = bottom = diamond;
  }
    
}

class Grass extends Block {
  
  Grass(float x, float y, float z) {
    super(x, y, z);
    top = grass;
    side = grassSide;
    bottom = dirt;
  }
    
}

class Dirt extends Block {
  
  Dirt(float x, float y, float z) {
    super(x, y, z);
    top = side = bottom = dirt;
  }
    
}

class Leaves extends Block {
  
  Leaves(float x, float y, float z) {
    super(x, y, z);
    top = side = bottom = oakLeaves;
  }
    
}

class Wood extends Block {
  
  Wood(float x, float y, float z) {
    super(x, y, z);
    top = bottom = oakLog;
    side = oakLogSide;
  }
    
}

class Sand extends Block {
  
  Sand(float x, float y, float z) {
    super(x, y, z);
    top = side = bottom = sand;
  }
    
}

class Water extends Block {
  int f;
  int inc;
  
  Water(float x, float y, float z) { 
    super(x, y, z);
    f = 0;
  }
  
  void show() {
    pushMatrix(); 
      
    translate(x, y, z);
    scale(size);
    noStroke();
    
    beginShape(QUADS);
    texture(gif.get(f));
    //top
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
    
    f ++;
    if (f == gif.size() - 1) f = 0;
  }
    
}
