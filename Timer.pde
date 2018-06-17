class Timer {
  float savedTime;
  float totalTime;
  float a;

  Timer(float tempTotalTime) {
    totalTime = tempTotalTime;
    savedTime = millis();
  }

  void startTimer() {
    savedTime = millis();
  }

  boolean isFinished() {
    // calculates time passed
    float timePassed = millis() - savedTime;
    a=timePassed;
    // check time passed
    if (timePassed > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}