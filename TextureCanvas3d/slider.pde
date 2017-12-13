class Slider {
  float x, y, max, min;
  float l = 150;
  float knobx;
  int r = 8;
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
    ellipse(knobx, y+2, r*2, r*2);
    if (grip) knob_move();
  }

  boolean grip = false;
  void mousePressed() {
    if (bounds()) grip = true;
  }
  void mouseReleased() {
    grip = false;
  }
  boolean bounds() {
    return dist(mouseX, mouseY, knobx, y+2) < r;
  }

  void knob_move() {
    knobx += mouseX - pmouseX;
    if (knobx < x) knobx = x;
    if (knobx > x + l) knobx = x + l;
  }

  float val() {
    return map(knobx, x, x+l, min, max);
  }
}