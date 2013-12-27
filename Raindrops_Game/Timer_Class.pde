class Timer {
  int currentTime;

  Timer() {
    currentTime = millis();
  }

  //timer function
  void Time() {    
    currentTime = millis();

    //every 3000 ms or 3 sec, the number of raindrops is increased and oldTime is updated
    if (currentTime - oldTime > interval) {
      if (index < rainFall.length) {
        index ++;
        oldTime = currentTime;
      }
    }

    //the interval value is decreased and eventually set to a permanent 500ms or .5 sec at certain values
    if (interval <= 2800) {
      interval -= 50;
      if (interval <= 2000) {
        interval -= 100;
      }
      if (interval <= 1000) {
        interval = 500;
      }
    }
  }
}

