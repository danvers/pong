import processing.sound.*;

SoundFile ping, pong, ding, over, whit;

Puck puck;

Paddle left;
Paddle right;

int leftscore = 0;
int rightscore = 0;

boolean leftUp, leftDown, rightUp, rightDown; 

void setup(){
  ping = new SoundFile(this, "pongblipa4.wav");
  pong = new SoundFile(this, "pongblipc5.wav");
  ding = new SoundFile(this, "pongscore.wav");
  over = new SoundFile(this, "game_over.wav");
  whit = new SoundFile(this, "wallhit.wav");
  size (600,400);
  puck = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw(){
  background(0);
  
  if(leftscore == 10  || 
     rightscore == 10){
    textSize(64);
    text("GAME OVER", width/2-190, height/2);
    over.play();
    frameRate(0);
  }
  puck.checkPaddle(left);
  puck.checkPaddle(right);
  
  left.show();
  right.show();
  left.update();
  right.update();
 
  puck.update();
  puck.edges();
  puck.show();
  
  stroke(150);
  for(int i = 0; i < height ; i+=50){
    line(width/2, i, width/2, i+25);
  }
  
  fill(150);
  textSize(32);
  text(leftscore, 64, 80);
  text(rightscore, width-96,80);
  
  left.move(0);
  right.move(0);
  
  if(leftUp)    left.move(-10);
  if(leftDown)  left.move(10);
  if(rightUp)   right.move(-10);
  if(rightDown) right.move(10);
}

void keyPressed() {
  setMove(keyCode, true);
}
 
void keyReleased() {
  setMove(keyCode, false);
}
 
boolean setMove(int k, boolean b) {
  switch (k) {
  case 65:
    return leftUp = b;
  case 89:
    return leftDown = b;
  case UP:
    return rightUp = b;
  case DOWN:
    return rightDown = b;
  default:
    return b;
  }
}
