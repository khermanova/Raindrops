class SlideShow {
  PImage storm;
  PImage dew;
  PImage leaf;
  PImage rainForest;
  PImage rainy;
  PImage drops;
  PVector loc;

  SlideShow() {
    storm = loadImage ("Thunderstorm.jpg");
    dew = loadImage ("Dew.jpg");
    leaf = loadImage ("Floating Leaf.jpg");
    rainForest = loadImage ("Rainforest.jpg");
    rainy = loadImage ("rainy.jpg");
    drops = loadImage ("Colordrops.jpg");
    loc = new PVector(width, height);
  }

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
    if (slide == 7) {
      slide = 1;
    }
  }
}

