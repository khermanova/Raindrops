class Raindrops {
  PVector loc, vel, acc;
  float d;

  Raindrops() {
    loc = new PVector(random(width), 0);
    vel = new PVector(0, random(3));
    acc = new PVector(0, random(.1));
    d = 10;
  }

  void show() {
    noStroke();
    fill(59,121,242);
    ellipse(loc.x, loc.y, d, d);
    triangle(loc.x - d/2, loc.y, loc.x, loc.y - d, loc.x + d/2, loc.y);
  }

  void fall() {
    vel.add(acc);
    loc.add(vel);
    if(loc.y > height){
      loc.y = 0;
    }
  }
}
