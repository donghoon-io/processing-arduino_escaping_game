Timer a;

class Stage0 {
  int inst_num=-1;
  boolean oneBefore=true;
  Stage0() {
  } //constructor
  void drawStage0() { //draw()용 함수
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    if (inst_num==-1) {
      image(start, 0, 0, width, height);
      imageMode(CENTER);
      image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
      imageMode(CORNER);
    }
    //if (inst_num==0||inst_num==1) {
    //  background(0);
    //  image(subFrame, 0, 0, width, height);
    //  image(inst0[constrain(inst_num, 0, 1)], 0, 0, width, height);
    //}
    if (inst_num==0) {
      stage=100;
    }
  }
}

class Stage100 {
  boolean movieStarted = false;
  boolean clicked = false; //Determine whether initializing button is clicked
  Stage100() {
  }
  void drawStage100() {
    if (!movieStarted) { //To avoid multi-execution
      music.amp(0);
      init.play(); //Play video
      movieStarted = true; //To avoid multi-execution
      a=new Timer(init.duration()*1000);
    }
    image(init, 0, 0, width, height); //Do not touch this!!
    if (a.isFinished()) {
      music.amp(0.5);
      stage=10;
    }
  }
}

class Stage10 {
  boolean oneBefore=true;
  int inst_num1=0;
  Stage10() {
  }
  void drawStage10() {
    if (ifClicked==0&&oneBefore) {
      inst_num1++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    image(desk, 0, 0, width, height);
    image(stage1, 0, 0, width, height);
    if (inst_num1>=1) {
      stage=1;
    }
  }
}