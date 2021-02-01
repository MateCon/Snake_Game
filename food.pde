class Food {
  int x, y;
  
  Food(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void move() {
    x = int(random(width)/cellSize)*cellSize;
    y = int(random(height)/cellSize)*cellSize;
  }
  
  void show() {
    fill(255, 0, 100);
    rect(this.x, this.y, cellSize, cellSize);
  }
  
  void update() {
    show();
  }
}
