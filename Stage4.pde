//Do not touch the whole things in this tab!!
class Stage4 {
  boolean micStart = false;
  boolean suc = false;
  boolean oneBefore=true;
  int inst_num=0;
  Stage4() {
  } //constructor
  void drawStage4() { //draw()용 함수
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    if (inst_num==0&&!suc) {
      image(back4, 0, 0, width, height);
      image(stage4, 0, 0, width, height);
    } else {
      imageMode(CORNER);
      image(back4, 0, 0, width, height);
      if (!micStart) {
        input.start();
        analyzer.input(input);
        micStart = true;
      }
      float vol = analyzer.analyze();
      imageMode(CENTER);
      image(knock, width/2, height/2, 700*vol, 500*vol);
      if (vol>=0.8) {
        suc = true;
      }
    }
    if (suc) {
      imageMode(CORNER);
      image(success, 0, 0, width, height);
      imageMode(CENTER);
      image(start_inst, width/2, height/5*3, width/4*3, height/4*3);
      imageMode(CORNER);
      if (inst_num>=2) {
        stage=5;
      }
    }
  }
}