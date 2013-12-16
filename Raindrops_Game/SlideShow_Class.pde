class SlideShow {
  PImage woman;
  PImage dew;
  PImage leaf;
  PImage rainForest;
  PImage rainy;
  PVector loc;
  int slide;

  SlideShow() {
    PImage woman = loadImage ("Blurry Woman.jpg");
    PImage dew = loadImage ("Dew.jpg");
    PImage leaf = loadImage ("Floating Leaf.jpg");
    PImage rainForest = loadImage ("Rainforest.jpg");
    PImage rainy = loadImage ("rainy.jpg");
    loc = new PVector(width, height);
    slide = 0;
  }
  
  void slideSwitch(){
    slide ++;
    imageMode(CORNERS);
    if(slide == 1){
      image(rainy,0,0,loc.x,loc.y);
    }
    if(slide == 2){
      image(dew,0,0,loc.x,loc.y);
    }
    if(slide == 3){
      image(leaf,0,0,loc.x,loc.y);
    }
    if(slide == 4){
      image(rainForest,0,0,loc.x,loc.y);
    }
    if(slide == 5){
      image(woman,0,0,loc.x,loc.y);
      slide = 0;
      slide ++;
    }
  }
}
    
    
    




