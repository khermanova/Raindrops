class Level {

  Level() {
  }

  void levelChange() {
    //level 1 from scores 0-10
    if (score < 10) {
      slide = 1;
      fill(255, 10, 39);
      textSize(70);
      textAlign(CENTER);
      text("Level 1", textLoc.x, textLoc.y);
    }

    //level 2 from scores 10-20
    if (score > 10 && score <= 20) {
      slide = 2;
      fill(255);
      textSize(70);
      textAlign(CENTER);
      text("Level 2", textLoc.x, textLoc.y);
      interval = 2000;
    }

    //level 3 from scores 20-30
    if (score <= 30 && score > 20) {
      slide = 3;
      fill(32, 214, 42);
      textSize(70);
      textAlign(CENTER);
      text("Level 3", textLoc.x, textLoc.y);
      interval = 1000;
    }

    //level 4 from scores 30-40
    if (score <= 40 && score > 30) {
      slide = 4;
      fill(255);
      textSize(70);
      textAlign(CENTER);
      text("Level 4", textLoc.x, textLoc.y);
      interval = 500;
    }

    //level 5 from scores 40-50
    if (score < 50 && score > 40) {
      slide = 5;
      fill(255);
      textSize(70);
      textAlign(CENTER);
      text("Level 5", textLoc.x, textLoc.y);
      interval = 300;
    }
  }
  
  void win(){
    //if you reach 50 before losing it is the end of the game and YOU WIN !!! :)
    if (score == 50) {
      end = true;
      game = false;
    }
  }
}


