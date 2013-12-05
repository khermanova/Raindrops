class Catcher {
  PVector loc;
  int d;

  Catcher() {
    loc = new PVector (mouseX, height - 100);
    d = 100;
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
    if (score >= 50) {
      d = 50;
    }
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
    }

    //boolean used to recognize the intersection of a raindrop and the catcher
    boolean catchDrop(Raindrops drop) {
      //if the two intersect...
      if (loc.dist(drop.loc) < d/2 + drop.d/2) {
        return true;
      }
      //if they do not intersect...
      else {
        return false;
      }
    }
  }

