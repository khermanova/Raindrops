color c;

void setup(){
  size(200,200);
  textSize(30);
  textAlign(CENTER);
  c = color(0);
}

void draw(){
  background(c);
  if(millis()/1000 % 2 == 0){
    c = color(random(255),random(255),random(255));
  }
  text(millis()/1000.0,width/2,height/2);
}
  
  
