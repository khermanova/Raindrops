class Catcher {
  PVector loc;
  int d;
  boolean gameOver;
  PImage cImageL;

  Catcher() {
    loc = new PVector (mouseX, height - 140);
    gameOver = false;
    cImageL = loadImage("Catcher Image.png");
  }

  //function to display the catcher
  void display() {
    imageMode(CENTER);
    if (score < 25) {
      image(cImageL, loc.x, loc.y);
      fill(0,0,0,0);
      ellipse(mouseX, height - 160, 180,115);
      //if the score reaches 75+, the catcher gets smaller
      if (score >= 25) {
        d = 75;
      }
      //if the score reaches 150+, the catcher gets even smaller
      if (score >= 35) {
        d = 50;
      }
    }
  }

  //this function updates the catcher so that it can follow the mouse's x motion
  void update() {
    loc.set(mouseX, height - 140);
    //if the score reaches the stated score, the catcher's new size is updated
    if (score >= 25) {
      loc.set(mouseX, height - 75);
    }
    if (score >= 50) {
      loc.set(mouseX, height - 50);
    }
  }

  //boolean used to recognize the intersection of a raindrop and the catcher
  boolean catchDrop(Raindrops drop) {
    //if the two intersect...
    if (loc.dist(drop.loc) < drop.d/2) {
      return true;
    }
    //if they do not intersect...
    else {
      return false;
    }
  }
}

