

class Ball implements Showable, Movable {
  
  float x, y;
  float r;
  float ang;
  float xStart, yStart;
  
  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = rBall;
    this.xStart = random(width);
    this.yStart = random(height);
    this.setAngle();
  }
  
  @Override
  void show () {
  
    fill(0);
    ellipse(this.x, this.y, this.r, this.r);
    
  }
  
  @Override
  void move() {
    
    float xMov = ballSpeed * cos(ang);
    float yMov = ballSpeed * sin(ang);
    
    int sign = this.x >= this.xStart ? 1 : -1;
    
    this.x += xMov * sign;
    this.y += yMov * sign;
    
    bounceWalls();
    bounceSticks();
    setAngle();
  }
  
  void bounceWalls () {
    
    if(this.y - this.r <= 0) {
      this.y = this.r+1;
      this.yStart -= yStart * 2; 
    }
    
    if(this.y + this.r >= height) {
      this.y = height - this.r;
      this.yStart += (height - yStart) * 2; 
    }
    
    if(this.x + this.r >= width) {
      this.x = width - this.r;
      this.xStart += (width - xStart) * 2;
    }
    
    if(this.x - this.r <= 0) {
      this.x = this.r;
      this.xStart -= xStart * 2;
    }
      
  }
  
  void bounceSticks () {
    
    float Wr = s2.x - wStick/2;
    float Wl = s1.x + wStick/2;
    
    float angle = hStick/4;
    
    //dx
    if(this.x + this.r >= Wr && this.y + this.r > s2.y - hStick/2 && this.y - this.r < s2.y + hStick/2) {
      
      this.x = Wr - this.r;
      
      if(this.y - this.r < s2.y - hStick/2 + angle || this.y + this.r > s2.y + hStick/2 - angle) {
        
        this.xStart += (Wr - xStart) + (Wr - xStart)/4;
        
      } else {
        this.xStart += (Wr - xStart) * 2;
      }
        
    }
    
    //sx
    if(this.x - this.r <= Wl && this.y + this.r > s1.y - hStick/2 && this.y - this.r < s1.y + hStick/2) {
      this.x = Wl + this.r;
      this.xStart -= (xStart - Wl) * 2;
    }
    
  }
  
  void setAngle() {
    float m = (this.y - this.yStart) / (this.x - this.xStart);
    this.ang = atan(m);
  }
  
  
}
