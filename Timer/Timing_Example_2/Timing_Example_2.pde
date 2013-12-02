int oldTime = 0;
int currentTime = 0;
int timeChange = 0;

void setup() {
  background(0);
  size(500, 500);
}

void draw() {
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if (timeChange >= 2000) {
    fill(random(255), random(255), random(255));
    ellipse(random(width), random(height), random(20, 70), random(20, 70));
    oldTime = currentTime;
  }
}

