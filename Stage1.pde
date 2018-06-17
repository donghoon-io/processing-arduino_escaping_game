class Stage1 {
  int yAxis, r;
  boolean upBefore=false;
  boolean ifSuccess=false;
  boolean oneBefore = true;
  int inst_num=0;
  Stage1() {
    r = 100;
  } //constructor
  void drawStage1() { //draw()용 함수
    if (!ifSuccess) {
      yAxis=(int)map(joyY, 0, 1023, -200, 200);
      if (yAxis<-200) {
        yAxis = -200;
      }
      if (yAxis>200) {
        yAxis = 200;
      }
      image(desk, 0, 0, width, height);
      if (frameCount%4==0 && r< 730) {
        r-=7;
      }
      if (r < 300 ) {
        image(arm1, 700, yAxis+260, 900, 1028);
      } else if (r >= 300 && r < 500) {
        image(arm3, 700, yAxis+260, 900, 1028);
      } else if (r >= 500 && r < 730) {
        image(arm2, 700, yAxis+260, 900, 1028);
      }
      if (r >= 730) {
        rectMode(CORNER);  
        rect(50, 70, 50, 920, 10);
        image(arm4, 700, yAxis+260, 900, 1028);
        image(success, 0, 0, width, height);
        imageMode(CENTER);
        image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
        imageMode(CORNER);
        ifSuccess=true;
        r=750;
      }
      //status bar
      rectMode(CORNER);
      fill(0, 50);
      stroke(255);
      rect(50, 70, 50, 920, 10);

      rectMode(CORNERS);
      noStroke();
      fill(255);
      if (r>-190) {
        rect(50, 800-r, 100, 990, 10);
      } else {
        rect(50, 990, 100, 990, 10);
      }
      if (joyY>=1010&&!upBefore) {
        r+=40;
        upBefore=true;
      } else if (joyY<=10&&upBefore) {
        r+=40;
        upBefore=false;
      }
      if (r<=-190) {
        stage=10000;
      }
    }
    if (ifSuccess) {
      rectMode(CORNER);
      if (ifClicked==0&&oneBefore) {
        inst_num++;
        oneBefore=false;
      }
      if (ifClicked==1&&!oneBefore) {
        oneBefore=true;
      }
      if (inst_num>=1) {
        stage=200;
      }
    }
  }
}

class Stage200 {
  boolean movieStarted = false;
  boolean clicked = false; //Determine whether initializing button is clicked
  Stage200() {
  }
  void drawStage200() {
    if (!movieStarted) { //To avoid multi-execution
      music.amp(0);
      v2.play(); //Play video
      movieStarted = true; //To avoid multi-execution
      a=new Timer(v2.duration()*1000);
    }
    image(v2, 0, 0, width, height); //Do not touch this!!
    if (a.isFinished()) {
      music.amp(0.5);
      stage=2;
    }
  }
}