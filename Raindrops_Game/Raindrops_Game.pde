Raindrops r;
int rain = 100;
Raindrops [] rainFall = new Raindrops[rain];
PImage background;
Catcher c1;
int score;
boolean start;

void setup() {
  size(600, 600);
  background = loadImage("rainy.jpg");
  r = new Raindrops();
  for (int i = 0; i < rain; i++) {
    rainFall[i] = new Raindrops();
  }
  c1 = new Catcher();
  start = false;
}

void draw() {
  imageMode(CORNERS);
  image(background, 0, 0, width, height);
  if (start == true) {
    if (score >= 10 && score < 100) {
      fill(37, 56, 113);
      stroke(255, 158, 0);
      strokeWeight(5);
      rectMode(CORNERS);
      rect(30, 25, 130, 90);
    }
    else if (score >= 100) {
      fill(37, 56, 113);
      stroke(255, 158, 0);
      strokeWeight(5);
      rectMode(CORNERS);
      rect(30, 25, 150, 90);
    }
    else {
      fill(37, 56, 113);
      stroke(255, 158, 0);
      strokeWeight(5);
      rectMode(CORNERS);
      rect(30, 25, 100, 90);
    }
    fill(255, 158, 0);
    textSize(20);
    text("Score", 35, 45);
    textSize(40);
    text(score, 50, 80);
    for (int i = 0; i < rain; i++) {
      rainFall[i].show();
      rainFall[i].fall();
      if (c1.catchDrop(rainFall[i]) == true) {
        rainFall[i].reset();
        score++;
      }
    }
    c1.display();
    c1.update();
  }
  else {
    fill(255, 0, 0);
    rectMode(CORNERS);
    rect(200, 250, 400, 350);
    textSize(75);
    stroke(245, 234, 17);
    strokeWeight(10);
    fill(245, 234, 17);
    text("Start", 215, 325);
  }
}

void mousePressed() {
  if (mouseX > 200 && mouseX < 400 && mouseY > 200 && mouseY < 400) {
    start = true;
  }
}

