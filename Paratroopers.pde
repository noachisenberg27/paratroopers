Music music = new Music();
Music inboat=new Music();
Music insea=new Music();
Text text1= new Text();
Text gameover= new Text();
Text Tscore=new Text();
Text win=new Text();
int life;
int score;

Image image1 = new Image();
Image image2=new Image();
Image image3=new Image();
void setup() {
  size(1000,700);
  image1.setImage("background.png");
  life=3;
  score=0;
  win.text="YOU WIN";
  win.textSize=120;
  win.brush=color(0,255,0);
  win.x=image1.width/2 - 200;
  win.y=image1.height/2;
  Tscore.textSize=50;
  Tscore.brush=color(0,0,0);
  Tscore.x=50;
  Tscore.y=50;
  gameover.text="Game over";
  gameover.textSize=100;
  gameover.brush=color(255,0,0);
  gameover.x=image1.width/2 - 200;
  gameover.y=image1.height/2;
  text1.textSize=50;
  text1.brush=color(0,0,0);
  text1.x=800;
  text1.y=50;
  image1.width=1000;
  image1.height=700;
  image1.x=0;
  image1.y=0;
  image3.direction=Direction.DOWN;
  image3.speed=10;
  music.load("song.wav");
  inboat.load("land-on-boat.wav");
  insea.load("land-on-sea.mp3");
  music.loop=true;
  music.play();
  image2.setImage("boat.png");
  image2.x=500;
  image2.y=600;
  image3.setImage("paratrooper.png");
  image3.x=(int)random(0,950);
  image3.y=0;
  
  
}

void keyPressed(){
  if (keyCode==RIGHT){
    image2.direction=Direction.RIGHT;
    image2.speed=15;
  }
  if (keyCode==LEFT){
    image2.direction=Direction.LEFT;
    image2.speed=15;

  }
  if (keyCode==UP){
    image2.speed=0;
  }
}

void draw() {
  
  image1.draw();
  image2.draw();
  image3.draw();
  if(image2.x<=0 || image2.x >= 920){
  image2.speed=0;
  }
  if(image3.y>=550){
    if(image3.x<=image2.x+55 && image3.x+35>image2.x){
      inboat.play();
      score++;
    }
    else {
      insea.play();
      life--;
    }
    image3.y=0;
    image3.x=(int)random(0,950);
  }
  if(life==0){
    gameover.draw();
    noLoop();
  }
  if(score+3-life==10 && life!=0){
    win.draw();
    noLoop();
  }
  Tscore.text="score: "+str(score);
  Tscore.draw();
  text1.text="life: "+str(life);
  text1.draw();
}