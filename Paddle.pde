class Paddle{
  float x;
  float y = height/2;
  float h = 100;
  float w = 10;
  
  float ychange = 0;
  boolean left = false;
  
  Paddle(boolean left_){
    left = left_;
    if(left){
      x = w;
    }else{
      x = width - w;
    }
  }
  
  boolean isLeft(){
    return left;
  }
  
  void update(){
    y += ychange;
    y = constrain(y, h/2, height-h/2);
  }
  
  void move(float steps){
    ychange = steps;
  }
  
  void show(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
