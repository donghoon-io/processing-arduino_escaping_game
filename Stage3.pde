Timer b;

class Stage3 {
  float xVib, yVib, xPos, yPos, m;
  boolean ifSuc=false;
  boolean indoor = false;
  boolean oneBefore = true;
  boolean timerSet=false;
  int inst_num=0;
  Stage3() {
    xVib = 0;
    yVib = 0;
  } //constructor
  void drawStage3() { //draw()용 함수
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    if (inst_num==1) {
      if (!indoor) indoor=true;
    }
    if (!ifSuc) {
      if (!indoor) {
        cursor();
        background(255);
        imageMode(CORNER);
        image(stage3_pic1, 0, 0, width, height);
      }
      if (indoor) {
        noCursor();
        background(255);
        imageMode(CORNER);
        image(stage3_pic2, 0, 0, width, height);
        image(stopwatch, 50, 50, 250, 200);
        rectMode(CENTER);
        if (!timerSet) {
          b=new Timer(60000);
          timerSet=true;
        }
        fill(0);
        textSize(25);
        float c=60000-b.a;
        text((int)c/1000, 102, 150);
        text(":", 132, 150);
        text((int)(c-1000*((int)c/1000)), 137, 150);
        if (!ifSuc&&b.isFinished()) {
          stage=10000;
        }
        xPos = map(joyX, 0, 1024, 1520, 400);
        yPos = joyY;
        xVib = random(0, 15);
        yVib = random(0, 15);
        image(key_img, xPos+xVib, yPos+yVib);
        unlock();
      }
    }
    println(inst_num);
    if (ifSuc && inst_num>1) {
      stage=300;
    }
  }
  void unlock() {
    //키위치는 세붲ㄱ으로 맞출 것
    if (indoor && xPos+xVib>1058 && xPos+xVib<1076 && yPos+yVib > 550 && yPos+yVib < 625) {
      ifSuc=true;
      image(success, 0, 0, width, height);
      imageMode(CENTER);
      image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
      imageMode(CORNER);
    }
  }
}

class Stage300 {
  boolean movieStarted = false;
  int inst_num=0;
  boolean oneBefore=true;
  Stage300() {
  }
  void drawStage300() {
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    cursor();
    fill(255);
    if (inst_num==1) {
      if (!movieStarted) { //To avoid multi-execution
        music.amp(0);
        v3.play(); //Play video
        movieStarted = true; //To avoid multi-execution
        a=new Timer(v3.duration()*1000);
      }
      image(v3, 0, 0, width, height); //Do not touch this!!
      if (a.isFinished()) {
        music.amp(0.5);
        stage=4;
      }
    }
  }
}