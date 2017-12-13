class Slider {
  float x, y, max, min;
  float l = 150;
  float knobx;
  Slider(float posx, float posy, float min, float max) {
    this.x = posx;
    this.y = posy;
    this.min = min;
    this.max = max;
    this.knobx = x;
  }

  void disp() {
    fill(255);
    rect(x, y, l, 4, 2);
  }
  
  void knob_move(){
    
  }
  
  float val(){
    return map(knobx,x,x+l,min,max);
  }
}