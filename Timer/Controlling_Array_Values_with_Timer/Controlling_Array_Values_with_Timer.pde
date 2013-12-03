Raindrops r;
int dropValueE = 0;
int dropValueS = 25;
Raindrops [] drops = new Raindrops[dropValueS];
int currentTime = 0;
int oldTime = 0;
int timeChange = 0;

void setup(){
  size(500,500);
  background(13,16,59);
  r = new Raindrops();
  for (int i = 0; i < dropValueS; i++){
    drops[i] = new Raindrops();
  }
}

void draw(){
  background(13,16,59);
  for (int i = 0; i <= dropValueE; i++){
    drops[i].display();
    drops[i].fall();
  }
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if(timeChange >= 2000){
    dropValueE++;
    oldTime = currentTime;
  }
}


  

