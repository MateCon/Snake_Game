class Snake {
  int x, y, xspeed, yspeed, size;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  Boolean hasEaten;
  
  Snake(int x, int y) {
    this.x = x;
    this.y = y;
    
    this.xspeed = 0;
    this.yspeed = 0;
    this.size = 1;
  }
  
  void direction(int xdirection, int ydirection) {
    this.xspeed = xdirection * cellSize;
    this.yspeed = ydirection * cellSize;
  }
  
  Boolean eat(int xpos, int ypos) {
    if(this.x == xpos && this.y == ypos) {
      food.move();
      this.size++;
      eatSound.play();
      return true;
    } else {
      return false;
    }
  }
  
  void death() {
    for(PVector position : tail) {
      if(this.x == position.x && this.y == position.y && this.size > 1) {
        dieSound.play();
        restart();
      }
    }
  }
  
  void show() {
    fill(255);
    for(PVector position : tail) {
      rect(position.x, position.y, cellSize, cellSize);
    }
  }

  void update() {
    if(frameCount%speed == 0){
      this.death();
      
      this.hasEaten = this.eat(food.x, food.y);
      
      if(!tail.isEmpty() && !this.hasEaten) {
        this.tail.remove(0);
      }
      this.tail.add(new PVector(x, y));
    
      this.x += this.xspeed;
      this.y += this.yspeed;
    }
      
    this.show();
  
    if(this.x != constrain(this.x, 0, width-cellSize) || this.y != constrain(this.y, 0, height-cellSize)){
      dieSound.play();
      restart();
      return ;
    }
  }
}
