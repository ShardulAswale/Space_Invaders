int counter;
boolean lose= false;
Ship ship;
int control=0;
int state=0;
Flower[] flowers = new Flower[6];
boolean [] bf = new boolean [6];
ArrayList<Drop> drops = new ArrayList<Drop>();
int stop=-1,stop1,frames;
boolean f =true;
int []score=new int[5];
int textsize=30,change=1;
void setup() {
  frameRate(60);
  size(600, 400);
  init();
  score[0] = 60;
  score[1] = 70;
  score[2] = 80;
  score[3] = 90;
  score[4] = 100;
}

void init(){
  ship = new Ship();
  for (int i = 0; i < flowers.length; i++) {
    flowers[i] = new Flower(i*80+80, 60);
    bf[i] = true;
  }
}

void draw() {
  if(state==0)pause();
  if(state==1)startGame(); 
}

void pause(){
  background(51);
  fill(255,255,255);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Press y to Start", 300, 200);
  frames=0;
  stop=-2;
  f=true;
}

void startGame(){
  frames++;
  background(51);
  line(0,100,100,100);
  counter = 0 ;
  for(int i = 0 ; i<bf.length;i++){
    if(!bf[i]) counter++;
    if(flowers[i].y+flowers[i].r>340){lose = true;break;}
  }
  if(counter<6 && !lose){
    
    ship.show();
    ship.move();
    if(ship.x>width){
      ship.x=ship.x%width;
    }
    if(ship.x<0){
      ship.x=width;
    }

    for (Drop d : drops) {
      d.show();
      d.move();
      for (int j = 0; j < flowers.length; j++) {
        if (d.hits(flowers[j])) {
          bf[j]=flowers[j].grow();
          d.evaporate();
        }
      }
    }

    boolean edge = false;

    for (int i = 0; i < flowers.length; i++) {
      flowers[i].show();
      flowers[i].move();
      if (flowers[i].x > width || flowers[i].x < 0) {
        edge = true;
      }
    }

    if (edge) {
      for (int i = 0; i < flowers.length; i++) {
        flowers[i].shiftDown();
      }
    }

    for (int i = drops.size()-1; i >= 0; i--) {
      Drop d = drops.get(i);
      if (d.toDelete) {
        drops.remove(i);
      }
    }
  }
  
  if(counter==6){  
    fill(255, 255, 255);
    if(textsize > 50 || textsize < 30){change=-change;}
    textsize=textsize+change;
    textSize(textsize);
    text("Press y to \nPlay Again", 200, 240);
    textSize(40);
    textAlign(CENTER, LEFT);
    text("You Win!!!", 200, 180);    
        if(f){stop1=stop=frames/60;f=false;}
    text(stop1+" seconds", 200, 100);
    int temp;
    for(int i = 0;i<score.length-1;i++){
      if(stop<score[i]){
        temp=score[i];
        score[i]=stop;
        stop=temp;
      }
    }
    text("HI-Scores", 450, 100);
    text(score[0], 450, 140);
    text(score[1], 450, 180);
    text(score[2], 450, 220);
    text(score[3], 450, 260);
    text(score[4], 450, 300);
    control=3;
  } 
  
  if(lose){
    fill(255, 255, 255);
    
    if(textsize > 50 || textsize < 30){change=-change;}
    textsize=textsize+change;
    textSize(textsize);
    text("Press y to \nPlay Again", 200, 240);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("You Lose :(", 200, 180);
    text("HI-Scores", 450, 100);
    text(score[0], 450, 140);
    text(score[1], 450, 180);
    text(score[2], 450, 220);
    text(score[3], 450, 260);
    text(score[4], 450, 300);
    control=3;
  }
}

void keyReleased() {
  if (key != ' ') {
    ship.setDir(0);
  }
}


void keyPressed() {
  if(control==0){
    if(key=='y'){
      state=1;
      control=1;
    }
  }
  else if (control == 3){
    if(key =='y'){
      state=0;
      control=0;
      counter=0;
      lose=false;
      init();
    }
  }
  else{
    if (key == ' ') {
      Drop drop = new Drop(ship.x, height);
      drops.add(drop);
    }

    if (keyCode == RIGHT) {
      ship.setDir(1);
    } else if (keyCode == LEFT) {
      ship.setDir(-1);
    }
  }
}
