class Timer {
  int currentTime;

  Timer() {
    currentTime = millis();
  }

  void Time() {
    if (currentTime - oldTime > interval) {
      if (index < rainFall.length) {
        index += 1;
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

