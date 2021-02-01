import processing.sound.*;
SoundFile eatSound, dieSound, backgroundMusic;

Snake snake;
Food food;
int cellSize = 20;
int speed = 9;
Boolean playing = false;

void setup() {
  size(600, 600);
  frameRate(60);
  stroke(51);
  
  eatSound = new SoundFile(this, "eatSound.mp3");
  dieSound = new SoundFile(this, "dieSound.mp3");
  backgroundMusic = new SoundFile(this, "backgroundMusic.mp3");
  
  backgroundMusic.loop();
  restart();
}

void draw() {
  if(playing){
    game();
  } else {
    mainScreen();
  }
}

void keyPressed() {
  if(playing){
    if (keyCode == UP && snake.yspeed <= 0) {
      snake.direction(0, -1);
    } else if (keyCode == DOWN && snake.yspeed >= 0) {
      snake.direction(0, 1);
    } else if (keyCode == RIGHT && snake.xspeed >= 0) {
      snake.direction(1, 0);
    } else if (keyCode == LEFT && snake.xspeed <= 0) {
      snake.direction(-1, 0);
    }
  } else {
    if(keyCode == ' '){
      playing = true;
    }
  }
}

void mousePressed() {
  if(!playing) {
    if(100 < mouseX && mouseX < 500 && 430 < mouseY && mouseY < 550) {
      print(1);
      playing = true;
    }
    for(int y = 150; y < 300; y += 140) {
      for(int x = 100; x < 400; x += 140) {
        if(x < mouseX && mouseX < x+140 && y < mouseY && mouseY < y+140) {
          if(y == 150) {
            if((x - 100) / 100 == 0){
              cellSize = 50;
            } else if ((x - 100) / 100 == 1) {
              cellSize = 20;
            } else if((x - 100) / 100 == 2) {
              cellSize = 10;
            }
          }
          if(y == 290){
            if((x - 100) / 100 == 0){
              speed = 15;
            } else if ((x - 100) / 100 == 1) {
              speed = 9;
            } else if((x - 100) / 100 == 2) {
              speed = 3;
            }
          }
        }
      }
    }
  }
}
