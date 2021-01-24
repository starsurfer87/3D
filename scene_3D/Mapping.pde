void drawAxis() {
  world.strokeWeight(2);
  //x-axis
  world.stroke(255, 0, 0);
  world.line(-sceneSize, 0, 0, sceneSize, 0, 0);
  //y-axis
  world.stroke(0, 255, 0);
  world.line(0, 0, 0, 0, height, 0);
  //z-axis
  world.stroke(0, 0, 255);
  world.line(0, 0, -sceneSize, 0, 0, sceneSize);
}

void drawFloor(int start, int end, int level, int gap) {
  //line(x1, y1, z1, x2, y2, z2);
  world.stroke(100);
  world.strokeWeight(1);
  for (int i = start; i <= end; i += gap) {
    world.line(i, level, start, i, level, end);
    world.line(start, level, i, end, level, i);
  }
}

void generateMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == blue) {
        blockList.add(new Water(x*gridSize - sceneSize, height, y*gridSize - sceneSize));
      } else if (c == yellow) {
        blockList.add(new Sand(x*gridSize - sceneSize, height, y*gridSize - sceneSize));
      } else if (c == lightGreen) {
        blockList.add(new Grass(x*gridSize - sceneSize, height - 100, y*gridSize - sceneSize));
      } else if (c == darkGreen) {
        blockList.add(new Grass(x*gridSize - sceneSize, height - 200, y*gridSize - sceneSize));
      } else if (c == black) {
        for (int i = 0; i < 5; i++) {
          blockList.add(new Stone(x*gridSize - sceneSize, height - 100*i, y*gridSize - sceneSize));
        } 
      } else if (c == brown) {
        color adjacent = map.get(x - 1, y);
        int level;
        if (adjacent == darkGreen) level = 300;
        else if (adjacent == lightGreen) level = 200;
        else level = 100;
        generateTree(x, y, level);
      } else {
        blockList.add(new Grass(x*gridSize - sceneSize, height, y*gridSize - sceneSize));
      }
    }
  }
}

void showMap() {
    for (int i = 0 ; i < blockList.size(); i++) {
    Block b = blockList.get(i);
    b.show();
  } 
}

void generateTree(int x, int y, int level) {
  int treeHeight = int(random(2, 5));
  for (int i = 0; i < treeHeight; i++) {
    blockList.add(new Wood(x*gridSize - sceneSize, height - (level + i*100), y*gridSize - sceneSize));
  }
  for (int leavesx = x-2; leavesx <= x+2; leavesx ++) {
    for (int leavesy = y-2; leavesy <= y+2; leavesy++) {
      if ((leavesx > x-2 && leavesx < x+2 && leavesy > y-2 && leavesy < y+2) || !(leavesx - x == leavesy - y || leavesx - x == -(leavesy - y)) || random(3) < 2) { 
        //old condition: ((leavesx > x-2 && leavesx < x+2 && leavesy > y-2 && leavesy < y+2) || random(6) < 5)
        blockList.add(new Leaves(leavesx*gridSize - sceneSize, height - (level + treeHeight*100), leavesy*gridSize - sceneSize));
      }
    }
  }
  for (int leavesx = x-1; leavesx <= x+1; leavesx ++) {
    for (int leavesy = y-1; leavesy <= y+1; leavesy++) {
      if ((leavesx == x && leavesy == y) || random(4) < 3) {
      blockList.add(new Leaves(leavesx*gridSize - sceneSize, height - (level + (treeHeight+1)*100), leavesy*gridSize - sceneSize));
      }
    }
  }
  if (random(2) < 1) {
    blockList.add(new Leaves(x*gridSize - sceneSize, height - (level + (treeHeight+2)*100), y*gridSize - sceneSize));
  }
}
