class Catcher {
  int d;

  Catcher() {
    d = 100;
  }

  void display() {
    fill(222,16,16);
    ellipse(mouseX, height-100, d, d);
  }
}

