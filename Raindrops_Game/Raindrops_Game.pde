Raindrops r;
int rain = 1;
Raindrops [] rainFall = new Raindrops[rain];
PImage background;
Catcher c1;

void setup(){
  size(600,600);
  background = loadImage("rainy.jpg");
  r = new Raindrops();
  for (int i = 0; i < rain; i++) {
    rainFall[i] = new Raindrops();
  }
  c1 = new Catcher();
}

void draw(){
  imageMode(CORNERS);
  image(background,0,0,width,height);
  for (int i = 0; i < rain; i++) {
      rainFall[i].show();
      rainFall[i].fall();
    }
    c1.display();
}
