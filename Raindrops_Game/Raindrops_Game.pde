//variables, classes, and arrays
Raindrops r;
Raindrops [] rainFall = new Raindrops[300];
PImage background;
Catcher c1;
int score;
int oldTime = 0;
boolean start;
int interval = 3000;
int index = 1;
Timer t1;
PImage startScreen;
PImage victoryScreen;
boolean end;

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
  t1 = new Timer();
  startScreen = loadImage("cloudy.jpg");
  victoryScreen = loadImage("fireworks.jpg");
  end = false;
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
        rainFall[i].goAway();
        score++;
        interval -= 20;
      }
      
//if a raindrop hits the ground game over is true and this code runs
      if (r.gameOver(rainFall[i]) == true) {
        background(0);
        textSize(100);
        textAlign(CENTER);
        text("GAME OVER", 350, 250);
      }
    }
    
    //if you reach 75 it is the end of the game
    if (score == 75) {
      end = true;
    }

//if it is the end of the game YOU WIN!!! :)
    if (end == true) {
      image(victoryScreen, 0, 0, width, height);
      textSize(130);
      textAlign(CENTER);
      fill(3, 255, 59);
      text("You Win!", 300, height/2);
    }

    //the catcher is displayed and updated as it moves
    c1.display();
    c1.update();
    t1.Time();
  }

  //this code runs if boolean start is false
  //creates start button
  else {
    image(startScreen, 0, 0, width, height);
    fill(255, 0, 0);
    rectMode(CORNERS);
    rect(250, 300, 450, 400);
    textSize(75);
    stroke(245, 234, 17);
    strokeWeight(10);
    fill(245, 234, 17);
    text("Start", 265, 375);
  }  
  //checking to see if the interval is decreasing
  println(interval);
}


//if the start button is pressed, the true boolean code is run and the game begins
void mousePressed() {
  if (mouseX > 250 && mouseX < 450 && mouseY > 300 && mouseY < 400) {
    start = true;
  }
}








