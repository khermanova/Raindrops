//variables, classes, and arrays
Raindrops r;
Raindrops [] rainFall = new Raindrops[10];
PImage background;
Catcher c1;
int score;
boolean start;
int oldTime = 0;
int interval = 3000;
int index = 1;

void setup() {
  size(700, 700);
  background = loadImage("rainy.jpg");
  //array
  r = new Raindrops();
  for (int i = 0; i < rainFall.length; i++) {
    rainFall[i] = new Raindrops();
  }
  //catcher
  c1 = new Catcher();
  //boolean
  start = false;
}

void draw() {
  //loading image as background
  imageMode(CORNERS);
  image(background, 0, 0, width, height);
  //boolean with true value runs the game
  if (start == true) {
    //this code to determines the size of the score rectangle
    //2 digit score creates medium rectangle to fit score value
    if (score >= 10 && score < 100) {
      fill(37, 56, 113);
      stroke(255, 158, 0);
      strokeWeight(5);
      rectMode(CORNERS);
      rect(30, 25, 130, 90);
    }
    //three digit score increases size of rectangle to large so score fits
    else if (score >= 100) {
      fill(37, 56, 113);
      stroke(255, 158, 0);
      strokeWeight(5);
      rectMode(CORNERS);
      rect(30, 25, 150, 90);
    }
    //single digit score creates small rectangle
    else {
      fill(37, 56, 113);
      stroke(255, 158, 0);
      strokeWeight(5);
      rectMode(CORNERS);
      rect(30, 25, 100, 90);
    }
    //creates score text in score box
    fill(255, 158, 0);
    textSize(20);
    text("Score", 35, 45);
    //displays current score in score box
    textSize(40);
    text(score, 50, 80);
    //rain array
    for (int i = 0; i < index; i++) {
      rainFall[i].show();
      rainFall[i].fall();
      //this code runs if the drop is caught by the catcher (the two intersect)
      //the score increases and the drop is reset
      if (c1.catchDrop(rainFall[i]) == true) {
        rainFall[i].reset();
        score++;
        interval -= 25;
      }
    }
    //the catcher is displayed and updated as it moves
    c1.display();
    c1.update();
    if(millis() - oldTime > interval){
      if(index < rainFall.length){
        index++;
        oldTime = millis();
      }
    }
  }
  
  //if you reach 100 YOU WIN!!!! :)
//  else if(score == 10){
//    textSize(75);
//    textAlign(CENTER);
//    text("You Win!",250,250);
//  }
    
  //this code runs if boolean start is false
  //creates start button
  else {
    fill(255, 0, 0);
    rectMode(CORNERS);
    rect(250, 300, 450, 400);
    textSize(75);
    stroke(245, 234, 17);
    strokeWeight(10);
    fill(245, 234, 17);
    text("Start", 265, 375);
  }  
}

//if the start button is pressed, the true boolean code is run and the game begins
void mousePressed() {
  if (mouseX > 250 && mouseX < 450 && mouseY > 300 && mouseY < 400) {
    start = true;
  }
}

