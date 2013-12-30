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
  }
}

