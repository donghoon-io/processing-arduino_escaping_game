class Fail {
  boolean clicked = false; //Determine whether initializing button is clicked
  boolean oneBefore = true;
  int inst_num=0;
  Fail() {
  } //constructor
  void drawFail() { //draw()용 함수
    imageMode(CORNER);
    image(failImage, 0, 0, width, height);
    if (ifClicked==0&&oneBefore) {
      inst_num++;
      oneBefore=false;
    }
    if (ifClicked==1&&!oneBefore) {
      oneBefore=true;
    }
    if (inst_num==1) { //Let know whether button is clicked
      clicked=true;
    }
    if (clicked) { // add every stages
      main = new Stage0(); //init Class 선언
      s1 = new Stage1(); //Stage1 Class 선언
      s2 = new Stage2(); //Stage2 Class 선언
      s3 = new Stage3(); //Stage3 Class 선언
      s4 = new Stage4(); //Stage4 Class 선언
      ending = new Stage5(); //ending Class 선언
      s10 = new Stage10();
      s30 = new Stage30();
      s50 = new Stage50();
      s100 = new Stage100();
      s200 = new Stage200();
      s300 = new Stage300();
      s301 = new Stage301();
      end = new Theend();
      init = new Movie(app, "init.mp4"); //영상 불러오기
      v2 = new Movie(app, "v2.mp4");
      v25 = new Movie(app, "v25.mp4");
      v3 = new Movie(app, "v3.mp4");
      finale = new Movie(app, "finale.mp4");
      input = new AudioIn(app, 0);
      analyzer = new Amplitude(app);
      stage=0;
    }
  }
}