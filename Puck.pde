class Puck{
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  float r = 3;
  float mspeed  = 5;
  int blipcount = 0;
  
  Puck(){
    reset();
  }
  
  void checkPaddle(Paddle p){
    
    float diff = y - (p.y - p.h/2);
    
    if(p.isLeft()){
       if( y < p.y + p.h/2 && y > p.y - p.h/2 && x - r < p.x + p.w/2){
         if(x > p.x) {
           float rad = radians(45);
           float angle = map(diff, 0 , p.h, -rad, rad);
           xspeed = mspeed * cos(angle);
           yspeed = mspeed * sin(angle);
           x = p.x + p.w/2 + r;
           ping.play();
           blipcount++;
         }
       }
    }else{
      if( y < p.y + p.h/2 && y > p.y - p.h/2 && x + r > p.x - p.w/2){
        if(x < p.x){ 
         float rad = radians(135);
         float angle = map(diff, 0 , p.h, rad, rad);
         xspeed = mspeed * cos(angle);
         yspeed = mspeed * sin(angle);
         x = p.x - p.w/2 - r;
         pong.play();
         blipcount++;
         }
      }
    }
  }
  void reset(){
    x = width/2;
    y = height/2;
    delay(500);
    blipcount = 0;
    mspeed = 5;
    float angle = random(-PI/4, PI/4);
    xspeed = mspeed * cos(angle);
    yspeed = mspeed * sin(angle);
    
    if (random(1) < 0.5){
      xspeed *= -1;
    }
  }
  
  void show(){
    fill(255);
    ellipse(x,y,r*2,r*2);
  }
  void update(){
    x = x + xspeed;
    y = y + yspeed;
    mspeed += blipcount * 0.001;
  }
  
  void edges(){
    if(y < 0 || y > height){
      yspeed *= -1;
      whit.play();
    }
    
    if(x + r < 0){
      ding.play();
      rightscore++;
      reset();
    }
    if(x - r > width){
      ding.play();
      leftscore++;
      reset();
    }
  }
}
