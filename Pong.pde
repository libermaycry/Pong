
float wStick;
float hStick; 
float stickSpeed = 6.5;
float rBall = 10;
float ballSpeed = 7.5;

Stick s1, s2;
Ball b;

int score_1 = 0, score_2 = 0;

void setup() {
  
  size(800,600);
  frameRate(60);
  //fullScreen();
  hStick = height/8;
  wStick = hStick / 4;
  start();
  
}

void start () {
  
  waitSeconds(0.5);
  s1 = new Stick(wStick, height/2, LEFT);
  s2 = new Stick(width - wStick, height/2, RIGHT);
  b = new Ball(width/2, height/2);
  
}

void draw() {
  
  drawBackground();
  s1.show();
  s2.show(); 
  s1.move();
  s2.move();
  b.show();
  b.move();
  checkGoals();
   
}

void drawBackground() {
  
  noStroke();
  fill(color(255, 180, 180));
  rect(0, 0, width/2, height);
  fill(color(208, 201, 255));
  rect(width/2, 0, width/2, height);
  
  textAlign(CENTER);
  textSize(40);
  fill(150);
  text(score_1 + " - " +score_2, width/2, height/2);  
}

void checkGoals () {
  
  if(b.x <= s1.x) {
    score_2 ++;
    start();  
  }
  
  if(b.x >= s2.x) {
    score_1 ++;
    start();
  }
  
}

void keyPressed () {
  
  if(keyCode == UP && !s2.onTop)
    s2.ySpeed = -stickSpeed;  

  if(keyCode == DOWN && !s2.onBottom)
    s2.ySpeed = stickSpeed;  
  
  switch (key) {
      
    case 'W':
    case 'w':
      if(!s1.onTop)
        s1.ySpeed = -stickSpeed;
      break;
      
    case 'S':
    case 's':
      if(!s1.onBottom)
        s1.ySpeed = stickSpeed;
      break;
  }

}

void keyReleased () {
  
  if ((key == 'w' || key == 'W') && s1.ySpeed < 0) 
    s1.ySpeed = 0;
    
  if ((key == 's' || key == 'S') && s1.ySpeed >= 0)
    s1.ySpeed = 0;
  
  if (keyCode == UP && s2.ySpeed < 0)
    s2.ySpeed = 0;
    
  if (keyCode == DOWN && s2.ySpeed >= 0)
    s2.ySpeed = 0;

}

void waitSeconds(float secs) {
  
  int start = millis();
  while(millis() < start + secs * 1000);
}

interface Showable {
  void show();  
}

interface Movable {
  void move();  
}
