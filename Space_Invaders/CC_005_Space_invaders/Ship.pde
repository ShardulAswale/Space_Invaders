// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/biN3v3ef-Y0

class Ship {
  float x, xdir;

  Ship() {
    this.x = width/2;
    this.xdir = 0;
  }

  void show() {
    fill(255);
    rectMode(CENTER);
    rect(this.x, height-20, 5, 40);
    rect(this.x+5, height-15, 5, 30);
    rect(this.x+10, height-10, 5, 20);
    rect(this.x+15, height-5, 5, 10);
    rect(this.x-5, height-15, 5, 30);
    rect(this.x-10, height-10, 5, 20);
    rect(this.x-15, height-5, 5, 10);
    
  }

  void setDir(float dir) {
    this.xdir = dir;
  }

  void move() {
    this.x += this.xdir*5;
  }
}
