class Raindrops {
  PVector loc, vel, acc;
  float d;
  float yAcc;

  Raindrops() {
    loc = new PVector(random(width), 0);
    vel = new PVector(0, random(1.5, 3));
    acc = new PVector(0, yAcc);
    d = 30;
    yAcc = 0;
  }

  //function to display a raindrop
  void show() {
    noStroke();
    fill(59, 121, 242);
    ellipse(loc.x, loc.y, d, d);
    triangle(loc.x - d/2, loc.y, loc.x, loc.y - d, loc.x + d/2, loc.y);
    //if the score reaches 20+, the raindrop shrinks
    if (score >= 20) {
      d = 25;
    }
    //if the score reaches 50+, the raindrop shrinks again
    if (score >= 50) {
      d = 20;
    }
  }

  //movement of the raindrop
  void fall() {
    vel.add(acc);
    loc.add(vel);
    //if the score reaches 15, the raindrops begin to accelerate
    if (score >= 15) {
      yAcc += .5;
    }
    //checking value of yAcc
    //println(yAcc);
  }

  //resetting the location of the raindrop
  void reset() {
    loc.set(random(width), 0);
  }

  //function to make the raindrop disappear once it goes off the screen or is caught
  void goAway() {
    loc.set(height*2, 0);
    vel.set(0, 0);
    yAcc = 0;
  }

  //if  a raindrop is missed and it hits the ground, the player loses a life and the missed raindrop disappears
  void loseLife() {
    if (loc.y >= height) {
      lives--;
      goAway();
    }
  }
}

