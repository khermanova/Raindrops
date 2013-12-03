class Catcher {
  PVector loc;
  int d;

  Catcher() {
    loc = new PVector (mouseX, height - 100);
    d = 100;
  }

  void display() {
    fill(222,16,16);
    ellipse(loc.x, loc.y, d, d);
  }
  
  void update(){
    loc.set(mouseX, height - 100);
  }
  
  boolean catchDrop(Raindrops drop){
    if(loc.dist(drop.loc) < d/2 + drop.d/2){
      return true;
    }
    else{
      return false;
    }
  }
}

