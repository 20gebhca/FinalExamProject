float blocky = 650;
float blockSize1 = random(50, 200);
float blockSize2 = 150;
float blockx = 1400;
int x=0;
float recty=(700);
float rectx=(200);
float r= random(0, 255);
float g= random(0, 255);
float b= random(0, 255);
float speed= (0);
int blockSpeed=0;
float a=0;
float blockJump=0;


void setup() {
  //fullScreen();
  size(1400,820);
  println(blocky);
  strokeWeight(10);
  fill(r, g, b);
  line(0, 1320, 9999, 1320);
  rect(rectx, recty, 200, 200);
}
void draw() {
  if (a==0) {
    drawBackground();
    rect(blockx, blocky, blockSize1, blockSize2);
    blockx= blockx-(10+blockSpeed);
    squareUp();
    textSize(100);
    text((blockSpeed), 600, 600);
  }
  if ((recty>blocky && rectx>blockx && rectx<blockx+blockSize1)//upper left corner
    || (recty+100>blocky && rectx>blockx && rectx<blockx+blockSize1)
    || (recty+100>blocky && rectx+100>blockx && rectx+100<blockx+blockSize1)
    || (recty>blocky && rectx+100>blockx && rectx+100<blockx+blockSize1))

  {
    blockSpeed=-10;
    textSize(102);
    text("Game Over", 300, 300);
    a=1;
  }

  if (blockx+blockSize1<=0) {
    blockx=1920;
    blockSize1 = random(50, 200);
    blockSpeed+=1;
  }
}
void drawBackground() {
  background(255);
  strokeWeight(10);
  line(0, 800, 9999, 800);
  rect(rectx, recty, 100, 100);
}
void mousePressed() {
  blockJump+=blockSpeed;
  speed=(10+(blockJump/2));
}
void squareUp() {
  recty=recty-(speed);
  if (recty<=400) {
    speed=(-10-(blockJump/2));
    rect(rectx, recty, 100, 100);
  }
  if (recty>=700) {
    speed=0;
    blockJump=0;
    recty=700;
  }
}
