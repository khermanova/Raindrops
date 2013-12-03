class Raindrops {
  PVector loc, vel, acc;
  float d;
  float yAcc;

  Raindrops() {
    loc = new PVector(random(width), 0);
    vel = new PVector(0, random(1, 3));
    acc = new PVector(0, yAcc);
    d = 30;
    yAcc = 0;
  }

  void show() {
    noStroke();
    fill(59, 121, 242);
    ellipse(loc.x, loc.y, d, d);
    triangle(loc.x - d/2, loc.y, loc.x, loc.y - d, loc.x + d/2, loc.y);
  }

  void fall() {
    vel.add(acc);
    loc.add(vel);
  }

  void reset() {
    loc.set(random(width), 0);
  }

//  if (score >= 25) {
//    yAcc += .25;
//  }

// if(score >= 35){
  //rain = 15;
//}
}

