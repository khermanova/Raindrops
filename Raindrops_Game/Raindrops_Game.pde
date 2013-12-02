Raindrops r;
int rain = 10;
Raindrops [] rainFall = new Raindrops[rain];
PImage background;
Catcher c1;
int score;

void setup(){
  size(600,600);
  background = loadImage("rainy.jpg");
  r = new Raindrops();
  for (int i = 0; i < rain; i++) {
    rainFall[i] = new Raindrops();
  }
  c1 = new Catcher();
  textSize(40);
}

void draw(){
  imageMode(CORNERS);
  image(background,0,0,width,height);
  text(score, 50, 100);
  for (int i = 0; i < rain; i++) {
      rainFall[i].show();
      rainFall[i].fall();
      if(c1.catchDrop(rainFall[i]) == true){
        r[i].reset();
        score++;
      }
    }
    c1.display();
    c1.update();
}
