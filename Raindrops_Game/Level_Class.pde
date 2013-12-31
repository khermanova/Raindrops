class Level {

  Level() {
  }

  void levelChange() {
    //each level has its own background and set interval
    
    //level 1 from scores 0-10
    if (score <= 10) {
      slide = 1;
      fill(255, 10, 39);
      textSize(70);
      textAlign(CENTER);
      text("Level 1", textLoc.x, textLoc.y);
    }

    //level 2 from scores 11-20
    if (score > 10 && score <= 20) {
      slide = 2;
      fill(255);
      textSize(70);
      textAlign(CENTER);
      text("Level 2", textLoc.x, textLoc.y);
      interval = 2000;
      //displays colorDrop Power Up
      noStroke();
      fill(random(255), random(255), random(255));
      ellipse(loc.x, loc.y, d, d);
      triangle(loc.x - d/2, loc.y, loc.x, loc.y - d, loc.x + d/2, loc.y);
      //moves the colorDrop down the screen
      loc.add(vel);
      //if the score reaches 20+, the colorDrop shrinks
      if (score > 10 && score <= 30) {
        d = 25;
      }
      //if the score reaches 50+, the colorDrop shrinks again
      if (score <= 50 && score > 30) {
        d = 15;
      }
      //if the colordrop is caught the score is increased by 5 
      if (arcLoc.dist(loc) < d/2 || c1.dist(loc) < heightL/2 + d/2 || c2.dist(loc) < heightS/2 + d/2 || c3.dist(loc) < heightL/2 + d/2 || c4.dist(loc) < heightS/2 + d/2) {
        score += 5;
      }
    }

    //level 3 from scores 21-30
    if (score <= 30 && score > 20) {
      slide = 3;
      fill(32, 214, 42);
      textSize(70);
      textAlign(CENTER);
      text("Level 3", textLoc.x, textLoc.y);
      interval = 1000;
    }

    //level 4 from scores 31-40
    if (score <= 40 && score > 30) {
      slide = 4;
      fill(255);
      textSize(70);
      textAlign(CENTER);
      text("Level 4", textLoc.x, textLoc.y);
      interval = 500;
      //displays colorDrop
      noStroke();
      fill(random(255), random(255), random(255));
      ellipse(loc.x, loc.y, d, d);
      triangle(loc.x - d/2, loc.y, loc.x, loc.y - d, loc.x + d/2, loc.y);
      loc.add(vel);
      //if the score reaches 20+, the colorDrop shrinks
      if (score > 10 && score <= 30) {
        d = 25;
      }
      //if the score reaches 50+, the colorDrop shrinks again
      if (score <= 50 && score > 30) {
        d = 15;
      }
      //if the colordrop is caught the score is increased by 5
      if (arcLoc.dist(loc) < d/2 || c1.dist(loc) < heightL/2 + d/2 || c2.dist(loc) < heightS/2 + d/2 || c3.dist(loc) < heightL/2 + d/2 || c4.dist(loc) < heightS/2 + d/2) {
        score += 5;
      }
    }

    //level 5 from scores 41-50
    if (score < 50 && score > 40) {
      slide = 5;
      fill(255);
      textSize(70);
      textAlign(CENTER);
      text("Level 5", textLoc.x, textLoc.y);
      interval = 300;
    }
  }

  void win() {
    //if you reach 50 before losing it is the end of the game and YOU WIN !!! :)
    if (score == 50) {
      end = true;
      game = false;
    }
  }
}

