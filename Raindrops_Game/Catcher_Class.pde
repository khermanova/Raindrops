class Catcher {
  PVector loc;
  PVector arcLoc;
  int d;
  boolean gameOver;
  PImage cImageL;
  PImage bUmbrella;
  PVector c1;
  PVector c2;
  PVector c3;
  PVector c4;
  int heightL;
  int heightS;
  int widthL; 
  int widthS; 


  Catcher() {
    loc = new PVector (mouseX, height - 115);
    gameOver = false;
    cImageL = loadImage("Catcher Image.png");
    bUmbrella = loadImage ("Black Umbrella.png");
    arcLoc = new PVector (loc.x, loc.y-25);
    c1 = new PVector (arcLoc.x - 35, arcLoc.y + 25);
    c2 = new PVector (arcLoc.x - 70, arcLoc.y + 10);
    c3 = new PVector (arcLoc.x + 35, arcLoc.y + 25);
    c4 = new PVector (arcLoc.x + 70, arcLoc.y + 10);
    heightL = 60;
    heightS = 30;
    widthL = 70;
    widthS = 35;
  }

  //function to display the catcher
  void display() {
    fill(222, 16, 16);
    ellipse(loc.x, loc.y, d, d);
    //if the score reaches 75+, the catcher gets smaller
    if (score >= 25) {
      d = 75;
    }
    //if the score reaches 150+, the catcher gets even smaller
    if (score >= 35) {
      d = 50;
    }

    imageMode(CENTER); 
    image(cImageL, loc.x, loc.y);
    fill(0, 255, 0, 0);
    arc(arcLoc.x, arcLoc.y, 175, 125, 0, PI, CHORD);
    fill(255, 0, 0, 0);
    ellipse(c1.x, c1.y, widthL, heightL);
    ellipse(c2.x, c2.y, widthS, heightS);
    ellipse(c3.x, c3.y, widthL, heightL);
    ellipse(c4.x, c4.y, widthS, heightS);
  }

  //this function updates the catcher so that it can follow the mouse's x motion
  void update() {
    loc.set(mouseX, height - 100);
    //if the score reaches the stated score, the catcher's new size is updated
    if (score >= 25) {
      loc.set(mouseX, height - 75);
    }
    if (score >= 50) {
      loc.set(mouseX, height - 50);
    }

    loc.set(mouseX, height - 115);
    arcLoc.set(loc.x, loc.y-25);
    c1.set(arcLoc.x - 35, arcLoc.y + 25);
    c2.set(arcLoc.x - 70, arcLoc.y + 10);
    c3.set(arcLoc.x + 35, arcLoc.y + 25);
    c4.set(arcLoc.x + 70, arcLoc.y + 10);
  }

  //boolean used to recognize the intersection of a raindrop and the catcher
  boolean catchDrop(Raindrops drop) {
    //if the two intersect...


    if (arcLoc.dist(drop.loc) < drop.d/2 || c1.dist(drop.loc) < heightL/2 + drop.d/2 || c2.dist(drop.loc) < heightS/2 + drop.d/2 || c3.dist(drop.loc) < heightL/2 + drop.d/2 || c4.dist(drop.loc) < heightS/2 + drop.d/2) {
      return true;
    }
    //if they do not intersect...
    else {
      return false;
    }
  }
}

