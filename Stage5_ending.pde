class Stage5 {
  boolean oneBefore=true;
  boolean movieStarted=false;
  int inst_num=0;
  Stage5() {
  } //constructor
  void drawStage5() { //draw()용 함수
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    if (inst_num==1) {
      if (!movieStarted) { //To avoid multi-execution
        music.amp(0);
        finale.play(); //Play video
        movieStarted = true; //To avoid multi-execution
        a=new Timer(finale.duration()*1000);
      }
      image(finale, 0, 0, width, height); //Do not touch this!!
    }
    if (a.isFinished()) {
      happy.play();
      stage=50;
    }
  }
}

class Stage50 {
  boolean oneBefore=true;
  int inst_num=0;
  Stage50() {
  }
  void drawStage50() {
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    if (inst_num==0) {
      image(ending1, 0, 0, width, height);
      imageMode(CENTER);
      image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
      imageMode(CORNER);
    }
    if (inst_num==1) {
      image(ending2, 0, 0, width, height);
      imageMode(CENTER);
      image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
      imageMode(CORNER);
    }
    if (inst_num==2) {
      image(ending3, 0, 0, width, height);
      imageMode(CENTER);
      image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
      imageMode(CORNER);
    }
    if (inst_num==3) {
      image(sapporo, 0, 0, width, height);
      imageMode(CENTER);
      image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
      imageMode(CORNER);
    }
    if (inst_num==4) {
      stage=777;
    }
  }
}