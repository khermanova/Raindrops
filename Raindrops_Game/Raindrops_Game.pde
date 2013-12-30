//variables, classes, booleans, and arrays
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
SlideShow play;
int slide = 1;
PImage heart1;
PImage heart2;
PImage heart3;
boolean gameOver;
int lives;
boolean lossLife;
PImage sad;
boolean level1, level2, level3, level4, level5, level6;
PVector textLoc;

void setup() {
  size(700, 700);
  background = loadImage("rainy.jpg");
  //raindrops array
  r = new Raindrops();
  for (int i = 0; i < rainFall.length; i++) {
    rainFall[i] = new Raindrops();
  }
  //catcher
  c1 = new Catcher();
  //boolean for starting game
  start = false;
  //timer for timing rainfall
  t1 = new Timer();
  //images for start and winning screens
  startScreen = loadImage("cloudy.jpg");
  victoryScreen = loadImage("fireworks.jpg");
  //boolean for the end of the game
  end = false;
  //background image change
  play = new SlideShow();
  //lives images
  heart1 = loadImage("Heart.png");
  heart2 = loadImage("Heart2.png");
  heart3 = loadImage("Heart3.png");
  //boolean for losing the game
  gameOver = false;
  //player given three lives
  lives = 3;
  //boolean for losing lives when raindrops are dropped
  lossLife = false;
  //image for game over screen
  sad = loadImage("Sad Face.png");
  //PVector for level text location
  textLoc = new PVector(250, 75);
}

void draw() {
  //when the start button is pressed this boolean is given a true value, which runs the game
  if (start == true) {
    //loading image as background
    imageMode(CORNERS);
    image(background, 0, 0, width, height);

    //function in SlideShow Class that changes the background for each level with the variable *slide* 
    play.slideSwitch();

    //level 1 from scores 0-10
    if (score <= 10) {
      slide = 1;
      fill(225);
      strokeWeight(10);
      textSize(70);
      textAlign(CENTER);
      text("Level 1", textLoc.x, textLoc.y);
    }

    //level 2 from scores 11-20
    if (score > 10 && score <= 20) {
      slide = 2;
      fill(255);
      strokeWeight(10);
      textSize(70);
      textAlign(CENTER);
      text("Level 2", textLoc.x, textLoc.y);
      interval = 2500;
    }

    //level 3 from scores 21-35
    if (score <= 35 && score > 20) {
      slide = 3;
      fill(255, 230, 3);
      strokeWeight(10);
      textSize(70);
      textAlign(CENTER);
      text("Level 3", textLoc.x, textLoc.y);
      interval = 2000;
    }

    //level 4 from scores 36-50
    if (score <= 50 && score > 35) {
      slide = 4;
      fill(255);
      strokeWeight(10);
      textSize(70);
      textAlign(CENTER);
      text("Level 4", textLoc.x, textLoc.y);
      interval = 1000;
    }

    //level 5 from scores 51-65
    if (score <= 65 && score > 50) {
      slide = 5;
      fill(255);
      strokeWeight(10);
      textSize(70);
      textAlign(CENTER);
      text("Level 5", textLoc.x, textLoc.y);
      interval = 500;
    }

    //if you reach 65 before losing it is the end of the game and YOU WIN !!! :)
    if (score == 65) {
      end = true;
    }

    //the catcher is displayed and updated as it moves
    //the timer is updated as the game goes on
    c1.display();
    c1.update();
    t1.Time();

    //displays Lives box with text "Lives" and its value in it
    fill(37, 56, 113);
    stroke(255, 158, 0);
    strokeWeight(5);
    rectMode(CORNERS);
    rect(380, 25, 505, 65);
    fill(255, 158, 0);
    textAlign(LEFT);
    textSize(30);
    text("Lives:" + lives, 390, 55);

    //this code to determines the size of the score rectangle
    //2 digit score creates medium rectangle to fit score value
    if (score >= 10) {
      fill(37, 56, 113);
      stroke(255, 158, 0);
      strokeWeight(5);
      rectMode(CORNERS);
      rect(25, 25, 115, 90);
    }
    //single digit score creates small rectangle for score
    else {
      fill(37, 56, 113);
      stroke(255, 158, 0);
      strokeWeight(5);
      rectMode(CORNERS);
      rect(25, 25, 95, 90);
    }
    //creates score text in score box
    textAlign(LEFT);
    fill(255, 158, 0);
    textSize(20);
    text("Score", 35, 45);
    //displays current score in score box
    textAlign(LEFT);
    textSize(40);
    text(score, 50, 80);
    //rainFall array that creats the rain in the game
    for (int i = 0; i < index; i++) {
      //each of the raindrops are displayed, fall down the screen, and if one is dropped, a life is lost
      rainFall[i].show();
      rainFall[i].fall();
      rainFall[i].loseLife();
      if (lives == 3) {
        //displays 3 hearts signifying lives
        imageMode(CENTER);
        image(heart1, 550, 45);
        image(heart2, 610, 45);
        image(heart3, 670, 45);
      }
      if (lives == 2) {
        //displays two hearts
        imageMode(CENTER);
        image(heart1, 550, 45);
        image(heart2, 610, 45);
      }
      if (lives == 1) {
        //displays one heart
        imageMode(CENTER);
        image(heart1, 550, 45);
      }
      if (lives == 0) {
        //no lives left so game over, no hearts are displayed
        gameOver = true;
      }

      //this code runs if the drop is caught by the catcher (the two intersect)
      //the score increases and the drop disappears
      if (c1.catchDrop(rainFall[i]) == true) {
        rainFall[i].goAway();
        score++;
      }
    }

    //if a three raindrops hit the ground, it's game over and the game over screen appears
    if (gameOver == true) {
      background(0);
      textSize(100);
      textAlign(CENTER);
      text("GAME OVER", 335, 150);
      image(sad, 500, 500);
    }

    //when you win the victory screen appears
    if (end == true) {
      background(0);
      imageMode(CORNERS);
      image(victoryScreen, 0, 0, width, height);
      textSize(130);
      textAlign(CENTER);
      fill(3, 255, 59);
      text("You Win!", 300, height/2);
    }
  }

  //when the game has not started, the start screen is created (start = false)
  //creates start button on start screen with restart instructions
  else {
    imageMode(CORNERS);
    image(startScreen, 0, 0, width, height);
    fill(255, 0, 0);
    rectMode(CORNERS);
    rect(250, 300, 450, 400);
    textAlign(LEFT);
    textSize(75);
    stroke(245, 234, 17);
    strokeWeight(10);
    fill(245, 234, 17);
    text("Start", 265, 375);
    textSize(25);
    strokeWeight(5);
    text("Press key *r* to restart the game at any time", 75, 550);
  }  
  //checking to see if the interval is decreasing
  //println(interval);
  //checking to see that the lives decrease by one as raindrops hit the ground
  //  println(gameOver);
  //  println(lives);
  //  println(start);
}


//if the start button is pressed, the start boolean becomes true and the game begins
void mousePressed() {
  if (mouseX > 250 && mouseX < 450 && mouseY > 300 && mouseY < 400) {
    start = true;
  }
}

//if the key *r* is pressed, the game restarts by going to the start screen
void keyPressed() {
  if (key == 'r') {
    start = false;
    score = 0;
    lives = 4;
    gameOver = false;
    end = false;
  }
}

