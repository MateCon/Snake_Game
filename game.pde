void restart() {
  food = new Food(width/3*2, height/2);
  snake = new Snake(width/3, height/2);
  playing = false;
}

void UI() {
  textAlign(LEFT);
  textSize(12);
  fill(255);
  text("Score: " + (snake.size-1), 10, 16);
}

void game() {
  background(51);
  UI();
  food.update();
  snake.update();
}

void mainScreen() {
  background(51);
  
  textAlign(CENTER);
  textSize(80);
  fill(255);
  text("Snake", width/2, 100);
  
  for(int y = 150; y < 300; y += 140) {
    for(int x = 100; x < 400; x += 140) {
      rect(x, y, 120, 120);
    }
  }
  
  fill(240);
  rect(100, 430, 400, 120);
  fill(51);
  textSize(60);
  text("PLAY", width/2, 510);
  
  fill(240);
  noStroke();
  triangle(120, 310, 120, 390, 200, 350);
  triangle(120 + 140, 310, 120 + 140, 390, 200 + 140, 350);
  triangle(120 + 280, 310, 120 + 280, 390, 200 + 280, 350);
  
  stroke(51);
  strokeWeight(1);
  fill(240);
  rect(100 + 60-25, 210-25, 50, 50);
  rect(240 + 60-10, 210-10, 20, 20);
  rect(380 + 60-5, 210-5, 10, 10);
  
  line(120, 310, 200, 350);
  line(120, 390, 200, 350);
  
  line(120 + 140, 310, 200 + 140, 350);
  line(120 + 140, 390, 200 + 140, 350);
  line(120 + 140, 310 + 10, 200 + 140 - 20, 350);
  line(120 + 140, 390 - 10, 200 + 140 - 20, 350);
  
  line(120 + 280, 310, 200 + 280, 350);
  line(120 + 280, 390, 200 + 280, 350);
  line(120 + 280, 310 + 10, 200 + 280 - 20, 350);
  line(120 + 280, 390 - 10, 200 + 280 - 20, 350);
  line(120 + 280, 310 + 20, 200 + 280 - 40, 350);
  line(120 + 280, 390 - 20, 200 + 280 - 40, 350);
}
