class Raindrops {
  PVector loc, vel;
  float d;

  Raindrops() {
    loc = new PVector(random(width), 0);
    vel = new PVector(0, random(1,3));
    d = 30;
  }

  void show() {
    noStroke();
    fill(59, 121, 242);
    ellipse(loc.x, loc.y, d, d);
    triangle(loc.x - d/2, loc.y, loc.x, loc.y - d, loc.x + d/2, loc.y);
  }

  void fall() {
    loc.add(vel);
  }
  
  void reset(){
    if (loc.y > height) {
      loc.y = 0;
    }
  }
  
}

