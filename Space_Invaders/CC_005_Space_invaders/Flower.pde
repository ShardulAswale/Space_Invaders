// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/biN3v3ef-Y0

class Flower {
  float x, y, r, xdir;

  Flower(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 30;

    this.xdir = 1;
  }

  boolean grow() {
    if(r>2){
      this.r = this.r - 2;
      return true;
    }
    else {
      this.r=0;
      return false;
    }
  }

  void shiftDown() {
    this.xdir *= -1;
    this.y += this.r;
  }

  void move() {
    this.x = this.x + this.xdir;
  }

  void show() {
    noStroke();
    fill(255, 0, 200, 150);
    ellipse(this.x, this.y, this.r*2, this.r*2);
  }
}
