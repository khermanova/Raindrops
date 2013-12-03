Raindrops r;
int dropValueE = 0;
int dropValueS = 25;
Raindrops [] drops = new Raindrops[dropValueS];

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
}

void mousePressed(){
  if(dropValueE < dropValueS){
    dropValueE++;
  }
}
  

