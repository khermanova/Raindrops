int currentTime = 0;
int oldTime = 0;
int timeChange = 0;

void setup(){
  size(displayWidth,displayHeight-75);
  background(0);
}

void draw(){
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if(timeChange >= 3000){
    fill(random(255), random(255), random(255));
    strokeWeight(random(2,15));
    stroke(random(255), random(255), random(255));
    ellipse(random(width), random(height), random(20, 150), random(20, 175));
    oldTime = currentTime;
  }
}


