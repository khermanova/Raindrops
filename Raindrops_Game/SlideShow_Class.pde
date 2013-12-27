class SlideShow {
  PImage storm;
  PImage dew;
  PImage leaf;
  PImage rainForest;
  PImage rainy;
  PImage drops;
  PVector loc;

  SlideShow() {
    //loads images for the background
    storm = loadImage ("Thunderstorm.jpg");
    dew = loadImage ("Dew.jpg");
    leaf = loadImage ("Floating Leaf.jpg");
    rainForest = loadImage ("Rainforest.jpg");
    rainy = loadImage ("rainy.jpg");
    drops = loadImage ("Colordrops.jpg");
    //PVector for dimensionsof the images
    loc = new PVector(width, height);
  }

  //function that changes the background by cycling through the variable slide
  //each image is assigned to a value of slide
  void slideSwitch() {
    imageMode(CORNERS);
    if (slide == 1) {
      image(rainy, 0, 0, loc.x, loc.y);
    }
    if (slide == 2) {
      image(dew, 0, 0, loc.x, loc.y);
    }
    if (slide == 3) {
      image(leaf, 0, 0, loc.x, loc.y);
    }
    if (slide == 4) {
      image(rainForest, 0, 0, loc.x, loc.y);
    }
    if (slide == 5) {
      image(storm, 0, 0, loc.x, loc.y);
    }
    if (slide == 6) {
      image(drops, 0, 0, loc.x, loc.y);
    }
    //this cycles the function back to the first image
    if (slide == 7) {
      slide = 1;
    }
  }
}

