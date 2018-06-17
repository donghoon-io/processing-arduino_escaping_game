Timer ct;
class Stage2 {  
  //the number at which the potentiometer is pointing(the value of potentiometer)
  int digit1, digit2, digit3, digit4;
  boolean oneBefore=true;
  boolean timerSet=false;
  boolean ifWin=false;
  //new daeun  
  int bg_num, inst_num;
  //

  //the answer of each digit
  int answer1 = 1;
  int answer2 = 1;
  int answer3 = 2;
  int answer4 = 3;

  int mode=0;

  boolean ifSuc=false;

  Stage2() {
    digit1 = 0;
    digit2 = 0;
    digit3 = 0;
    digit4 = 0;
    //new daeun
    bg_num = 0;
    inst_num = 0;
    //
  } //constructor

  //resist# is the new value of potentiometer
  void updateDigits() {
    this.digit1 = numPointed(map(resist1, 0, 1023, 0, 10));
    this.digit2 = numPointed(map(resist2, 0, 1023, 0, 10));
    this.digit3 = numPointed(map(resist3, 0, 1023, 0, 10));
    this.digit4 = numPointed(map(resist4, 0, 1023, 0, 10));
  }

  //returns the number at which the dial is pointing
  int numPointed(float tmp) {
    if (tmp<0.5) return 0;
    else if (tmp<1.5) return 1;
    else if (tmp<2.5) return 2;
    else if (tmp<3.5) return 3;
    else if (tmp<4.5) return 4;
    else if (tmp<5.5) return 5;
    else if (tmp<6.5) return 6;
    else if (tmp<7.5) return 7;
    else if (tmp<8.5) return 8;
    else if (tmp<9.5) return 9;
    else return 0;
  }

  //draws outer dials
  void showOuterDials() {
    imageMode(CENTER);
    image(outer_dial, width/3, height/4+20, 400, 400);
    image(outer_dial, width/3, height/4*3-20, 400, 400);
    image(outer_dial, width/3*2, height/4+20, 400, 400);
    image(outer_dial, width/3*2, height/4*3-20, 400, 400);
    imageMode(CORNER);
  }

  //draws inner dials
  void showInnerDials() {
    imageMode(CENTER);

    pushMatrix();
    translate(width/3, height/4+20);
    rotate(radians(map(resist1, 0, 1024, 0, 360)));
    image(dial1, 0, 0, 400, 400);
    popMatrix();

    pushMatrix();
    translate(width/3, height/4*3-20);
    rotate(radians(map(resist2, 0, 1024, 0, 360)));
    image(dial2, 0, 0, 400, 400);
    popMatrix();

    pushMatrix();
    translate(width/3*2, height/4+20);
    rotate(radians(map(resist3, 0, 1024, 0, 360)));
    image(dial3, 0, 0, 400, 400);
    popMatrix();

    pushMatrix();
    translate(width/3*2, height/4*3-20);
    rotate(radians(map(resist4, 0, 1024, 0, 360)));
    image(dial4, 0, 0, 400, 400);
    popMatrix();

    imageMode(CORNER);

    textAlign(CENTER);
    textSize(40);
    fill(0);
    text("1", width/3, height/4+20);
    text("2", width/3, height/4*3-20);
    text("3", width/3*2, height/4+20);
    text("4", width/3*2, height/4*3-20);
  }

  //returns true if the digit matches with the answer
  boolean isAnswer(int _digit, int _answer) {
    if (_digit == _answer) {
      return true;
    } else {
      return false;
    }
  }

  //returns true if all for digits are correct
  boolean isOpen() {
    int count = 0;
    if (this.isAnswer(digit1, answer1)) {
      count++;
    }
    if (this.isAnswer(digit2, answer2)) {
      count++;
    }
    if (this.isAnswer(digit3, answer3)) {
      count++;
    }
    if (this.isAnswer(digit4, answer4)) {
      count++;
    }
    if (count == 4) {
      ifSuc=true;
      return true;
    } else {
      return false;
    }
  }

  void drawStage2() { //draw()용 함수
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    println(inst_num);
    background(200, 80, 20);
    //new daeun
    imageMode(CORNER);
    if (inst_num<2) bg_num = 0;
    else bg_num = 1;
    image(bg[bg_num], 0, 0, width, height);
    this.updateDigits();
    if (inst_num>=2) {
      this.showOuterDials();
      this.showInnerDials();
    }
    rectMode(CENTER);
    if (inst_num>=6) {
      image(stopwatch, 50, 50, 250, 200);
      if (!timerSet) {
        ct=new Timer(200000);
        timerSet=true;
      }
      fill(0);
      textSize(25);
      float c=200000-ct.a;
      text((int)c/1000, 115, 150);
      text(":", 140, 150);
      text((int)(c-1000*((int)c/1000)), 170, 150);
      if (!ifWin&&ct.isFinished()) {
        stage=10000;
      }
    }
    if (inst_num == 2 || inst_num > 3) image(note01, -30, -60);
    if (inst_num == 3) image(note02, 0, 0);
    if (inst_num<5) {
      image(subFrame, 0, 0, width, height);
    }
    if (inst_num>=0 && inst_num<=5) {
      image(inst[constrain(inst_num, 0, 5)], 0, 0, width, height);
    }
    if (this.isOpen()) {
      image(success, 0, 0, width, height);
      imageMode(CENTER);
      image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
      imageMode(CORNER);
    }
    if (this.isOpen() && inst_num >= 7) {
      ifWin=true;
      stage = 301;
    }
  }
}

class Stage301 {
  boolean movieStarted=false;
  boolean oneBefore=true;
  Stage301() {
  }
  void drawStage301 () {
    if (!movieStarted) { //To avoid multi-execution
      music.amp(0);
      v25.play(); //Play video
      movieStarted = true; //To avoid multi-execution
      a=new Timer(v25.duration()*1000);
    }
    image(v25, 0, 0, width, height); //Do not touch this!!
    if (a.isFinished()) {
      music.amp(0.5);
      stage=30;
    }
  }
}

class Stage30 {
  boolean clicked = false;
  boolean oneBefore = true;
  int inst_num=0;
  Stage30() {
  }
  void drawStage30() {
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    if (inst_num==0||inst_num==1) {
      image(stage3_pic1, 0, 0, width, height);
      image(subFrame, 0, 0, width, height);
      image(inst1[constrain(inst_num, 0, 1)], 0, 0, width, height);
    }
    if (inst_num==2) {
      image(stage3_pic1, 0, 0, width, height);
      image(stage3, 0, 0, width, height);
    }
    if (inst_num==3) {
      stage=3;
    }
  }
}