class Timer {
  int currentTime;

  Timer() {
    currentTime = millis();
  }

  void Time() {
    if (currentTime - oldTime > interval) {
      if (index < rainFall.length) {
        index ++;
        oldTime = currentTime;
      }
    }
    if (interval <= 500) {
      interval -=100;
      if (interval <= 100) {
        interval = 25;
      }
    }
  }
}

