//variables, classes, booleans, and arrays
Raindrops r;
Raindrops [] rainFall = new Raindrops[300];
PImage background;
Catcher catcher1;
int score;
int oldTime = 0;
boolean start;
int interval = 3000;
int index = 0;
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
PVector textLoc;
Level progress;
boolean game;
PImage extraLife;
PVector fallHeart;
PVector heartVel;
PVector loc, vel;
float d;
PVector arcLoc;
PVector c1;
PVector c2;
PVector c3;
PVector c4;
int heightL;
int heightS;
int widthL; 
int widthS; 

void setup() {
  size(700, 700);
  background = loadImage("rainy.jpg");
  //raindrops array
  r = new Raindrops();
  for (int i = 0; i < rainFall.length; i++) {
    rainFall[i] = new Raindrops();
  }
  //catcher
  catcher1 = new Catcher();
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
  //player is given three lives
  lives = 3;
  //boolean for losing lives when raindrops are dropped
  lossLife = false;
  //image for game over screen
  sad = loadImage("Sad Face.png");
  //PVector for level text location
  textLoc = new PVector(250, 75);
  //level changer
  progress = new Level();
  //this boolean controls the parts of the game including display/use of catcher, score, lives, raindrops
  game = true;
  //image for the falling life
  extraLife = loadImage("Falling Life.png");
  //location of the falling life
  fallHeart = new PVector(random(width), -50);
  //speed of the falling life
  heartVel = new PVector(0, .5);
  //location of the raindrops
  loc = new PVector(random(width), 0);
  //speed of the raindrops
  vel = new PVector(0, random(1.5, 4));
  //size of the raindrops
  d = 30;
  //shapes used to fill the space that the raindrops can hit in the umbrella to be caught
  //an arc and four circles
  arcLoc = new PVector (loc.x, loc.y-25);
  c1 = new PVector (arcLoc.x - 35, arcLoc.y + 25);
  c2 = new PVector (arcLoc.x - 70, arcLoc.y + 10);
  c3 = new PVector (arcLoc.x + 35, arcLoc.y + 25);
  c4 = new PVector (arcLoc.x + 70, arcLoc.y + 10);
  //sizes of the circles filling the umbrella
  heightL = 60;
  heightS = 30;
  widthL = 70;
  widthS = 35;
}

void draw() {
  //when the start button is pressed this boolean is given a true value, which runs the game
  if (start == true) {
    if (game == true) {
      //loading image as background
      imageMode(CORNERS);
      image(background, 0, 0, width, height);

      //function in SlideShow Class that changes the background for each level with the variable *slide* 
      play.slideSwitch();
      
      //funcion in Level Class that controls the level and winning the game
      progress.levelChange();
      progress.win();

      //the catcher is displayed and updated as it moves
      //the timer is updated as the game goes on
      catcher1.display();
      catcher1.update();
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
          //when the player has 1 life left, he/she gets the chance to win one back if he/she catches the falling life
          //the extra life is displayed and falls
          image(extraLife, fallHeart.x, fallHeart.y);
          fallHeart.add(heartVel);
        }
        if (lives == 0) {
          //no lives left so game over, no hearts are displayed
          gameOver = true;
        }

        //this code runs if a drop is caught by the catcher (the two intersect)
        //the score increases and the drop disappears
        if (catcher1.catchDrop(rainFall[i]) == true) {
          rainFall[i].goAway();
          score++;
        }
      }
      
      //this code runs if the extra life is caught by the catcher (the two intersect)
      //a life is given back and the image disappears
      if (catcher1.catchHeart() == true) {
        lives = 2;
        fallHeart.set(random(width), -50);
      }
    }

    //this code is run when game is false; this is so the raindrops,catcher, score, and lives don't appear on the game over and victory screens
    //if a three raindrops hit the ground, it's game over and the game over screen appears
    if (gameOver == true) {
      game = false;
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
      fill(0);
      rectMode(CENTER);
      rect(width/2, height/2 - 50, 600, 200);
      textSize(130);
      textAlign(CENTER);
      fill(3, 255, 59);
      text("You Win!", width/2, height/2);
    }
  }

  //when the game has not started, the start screen is created (start = false)
  //creates start button on start screen with game instructions
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
    text("Press key *r* to restart the game at any time", 75, 150);
    text("Catch as many objects as you can!", 50, 550);
    text("Don't drop more than 2 or you'll lose!", 200, 625);
  }  
  //checking to see if the interval is decreasing
  //println(interval);
  //checking to see that the lives decrease by one as raindrops hit the ground
  //checking value of start and gameOver boolean
  //println(gameOver);
  //println(lives);
  //println(start);
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
    lives = 3;
    gameOver = false;
    end = false;
  }
}

