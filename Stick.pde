
class Stick implements Showable, Movable {
  
  float x, y;
  float ySpeed;
  boolean onTop;
  boolean onBottom;
  int pos;
  
  Stick(float x, float y, int pos) {
    this.x = x;
    this.y = y;
    this.ySpeed = 0;
    this.onTop = false;
    this.onBottom = false;
    this.pos = pos;
  }
  

  @Override
  void show () {
    stroke(0);
    fill(pos == LEFT ? color(255, 0, 0) : color(0, 0, 255));
    rect(this.x - wStick/2, this.y - hStick/2, wStick, hStick); 
    
  }
  
  @Override
  void move () {
    
    this.y += ySpeed;
  
    if(this.y - hStick/2 < 0) {
      this.onTop = true;  
      this.ySpeed = 0;
    } else {
      this.onTop = false;  
    }
    
    if(this.y + hStick/2 > height) {
      this.onBottom = true;  
      this.ySpeed = 0;
    } else {
      this.onBottom = false;  
    }
   
  }
  
}
