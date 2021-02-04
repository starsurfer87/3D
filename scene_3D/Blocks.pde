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
    world.pushMatrix(); 
    
    world.translate(x, y, z);
    world.scale(size);
    world.noStroke();
    
    //top
    world.beginShape(QUADS);
    world.texture(top);
    //vertex(x, y, z, texture's x, texture's y)
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 0, 1, 1, 1);
    world.vertex(0, 0, 1, 0, 1);
    world.endShape();
    
    //bottom
    world.beginShape(QUADS);
    world.texture(bottom);
    world.vertex(0, 1, 0, 0, 0);
    world.vertex(1, 1, 0, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(0, 1, 1, 0, 1);
    world.endShape();
    
    world.beginShape(QUADS);
    world.texture(side);
    //front
    world.vertex(0, 0, 1, 0, 0);
    world.vertex(1, 0, 1, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(0, 1, 1, 0, 1);
    //back
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 1, 0, 1, 1);
    world.vertex(0, 1, 0, 0, 1);
    //left
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(0, 0, 1, 1, 0);
    world.vertex(0, 1, 1, 1, 1);
    world.vertex(0, 1, 0, 0, 1);
    //right
    world.vertex(1, 0, 0, 0, 0);
    world.vertex(1, 0, 1, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(1, 1, 0, 0, 1);
    world.endShape();
    
    world.popMatrix();
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

class Stone extends Block {
  
  Stone(float x, float y, float z) {
    super(x, y, z);
    top = side = bottom = stone;
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
    world.pushMatrix(); 
      
    world.translate(x, y, z);
    world.scale(size);
    world.noStroke();
    
    world. beginShape(QUADS);
    world.texture(gif.get(f));
    //top
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 0, 1, 1, 1);
    world.vertex(0, 0, 1, 0, 1);
    //bottom
    world.vertex(0, 1, 0, 0, 0);
    world.vertex(1, 1, 0, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(0, 1, 1, 0, 1);
    //front
    world.vertex(0, 0, 1, 0, 0);
    world.vertex(1, 0, 1, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(0, 1, 1, 0, 1);
    //back
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 1, 0, 1, 1);
    world.vertex(0, 1, 0, 0, 1);
    //left
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(0, 0, 1, 1, 0);
    world.vertex(0, 1, 1, 1, 1);
    world.vertex(0, 1, 0, 0, 1);
    //right
    world.vertex(1, 0, 0, 0, 0);
    world.vertex(1, 0, 1, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(1, 1, 0, 0, 1);
    world.endShape();
    
    world.popMatrix();
    
    f ++;
    if (f == gif.size() - 1) f = 0;
  }
    
}
