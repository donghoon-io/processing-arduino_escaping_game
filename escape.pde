import processing.serial.*; //Import serial library
import processing.video.*; //Import video library
import processing.sound.*; //Import sound library

AudioIn input; //Do not touch this!!
Amplitude analyzer; //Do not touch this!!
Movie init, v2, v25, v3, finale; //Do not touch this!!
SoundFile music, happy;

PApplet app;

String serial1, serial2;
Serial port1, port2;
float joyX;
float joyY;
int ifClicked;
float resist1;
float resist2;
float resist3;
float resist4;
boolean serialEnabled = true;

Stage0 main = new Stage0(); //init Class 선언
Stage1 s1 = new Stage1(); //Stage1 Class 선언
Stage2 s2 = new Stage2(); //Stage2 Class 선언
Stage3 s3 = new Stage3(); //Stage3 Class 선언
Stage4 s4 = new Stage4(); //Stage4 Class 선언
Stage5 ending = new Stage5(); //ending Class 선언
Stage10 s10 = new Stage10();
Stage30 s30 = new Stage30();
Stage50 s50 = new Stage50();
Stage100 s100 = new Stage100();
Stage200 s200 = new Stage200();
Stage300 s300 = new Stage300();
Stage301 s301 = new Stage301();
Theend end = new Theend();
Fail fail = new Fail();

//daeun
//import dial images(dial# is the inner dial)
PImage subFrame;
PImage start, start_inst, button, outer_dial, dial1, dial2, dial3, dial4, arm1, arm2, arm3, arm4, desk, key_img, stage3_pic1, stage3_pic2;
PImage stage1, stage2, stage3, stage4, failImage, stopwatch, back4, knock, pFinal;
PImage ending1, ending2, ending3, sapporo;

//new daeun
PImage success, note01, note02;
//bg and inst determine the background image and the instruction image
String[] bglist = {"s2_bg00.png", "s2_bg01.jpg"};
PImage[] bg = new PImage[bglist.length];
String[] instlist = {"s2_inst00.png", "s2_inst01.png", "s2_inst02.png", "s2_inst03.png", "s2_inst04.png", "stage2.png"};
String[] inst0list = {"int_inst00.png", "int_inst01.png"};
String[] inst1list = {"s3_inst00.png", "s3_inst01.png"};
PImage[] inst = new PImage[instlist.length];
PImage[] inst0 = new PImage[inst0list.length];
PImage[] inst1 = new PImage[inst1list.length];

int stage = 0;

void setup() {
  fullScreen();
  frameRate(200);
  app=this;
  background(0);
  init = new Movie(this, "init.mp4");
  v2 = new Movie(this, "v2.mp4");
  v25 = new Movie(this, "v25.mp4");
  v3 = new Movie(this, "v3.mp4");
  finale = new Movie(this, "finale.mp4");
  input = new AudioIn(this, 0);
  analyzer = new Amplitude(this);

  music=new SoundFile(this, "music.mp3");
  music.amp(0.5);
  music.loop();

  happy = new SoundFile(this, "happy.mp3");

  sapporo = loadImage("sapporo.png");
  stopwatch = loadImage("stopwatch.png");
  subFrame=loadImage("subFrame.png");
  start = loadImage("start.png");
  start_inst = loadImage("start_inst.png");
  button = loadImage("button.png");
  outer_dial = loadImage("outer_dial.png");
  dial1 = loadImage("inner_dial.png");
  dial2 = loadImage("inner_dial.png");
  dial3 = loadImage("inner_dial.png");
  dial4 = loadImage("inner_dial.png");
  arm1 = loadImage("arm1.png");
  arm2 = loadImage("arm2.png");
  arm3 = loadImage("arm3.png");
  arm4 = loadImage("arm4.png");
  desk = loadImage("desk.jpeg");
  key_img = loadImage("key.png");
  stage3_pic1 = loadImage("stage3_pic1.jpg");
  stage3_pic2 = loadImage("stage3_pic2.png");
  failImage = loadImage("failImage.png");
  back4 = loadImage("back4.png");
  knock = loadImage("knock.png");
  pFinal = loadImage("pFinal.png");

  ending1 = loadImage("ending1.png");
  ending2 = loadImage("ending2.png");
  ending3 = loadImage("ending3.png");

  stage1 = loadImage("stage1.png");
  stage2 = loadImage("stage2.png");
  stage3 = loadImage("stage3.png");
  stage4 = loadImage("stage4.png");

  port1 = new Serial(this, Serial.list()[3], 9600);
  port1.clear();
  port2 = new Serial(this, Serial.list()[4], 9600);
  port2.clear();
  serial1 = port1.readStringUntil(12);
  serial1 = null;
  serial2 = port2.readStringUntil(12);
  serial2 = null;

  success = loadImage("success.png");
  note01 = loadImage("note01.png");
  note02 = loadImage("note02.png");
  for (int i=0; i<bglist.length; i++) bg[i] = loadImage(bglist[i]);
  for (int i=0; i<instlist.length; i++) inst[i] = loadImage(instlist[i]);
  for (int i=0; i<inst0list.length; i++) inst0[i] = loadImage(inst0list[i]);
  for (int i=0; i<inst1list.length; i++) inst1[i] = loadImage(inst1list[i]);
  //
}

void input() {
  if (serialEnabled) {
    while (port1.available() > 0 ) {
      serial1 = port1.readStringUntil(10);
    }
    while (port2.available() > 0) {
      serial2 = port2.readStringUntil(10);
    }
    if (serial1!=null) {
      String[] a = split(serial1, ',');    
      String sjoyY = a[0];
      String sjoyX = a[1];
      String sifClicked = a[2];
      String sresist1 = a[3];
      String sresist2 = a[4];
      joyY = new Float(sjoyY);
      joyX = new Float(sjoyX);
      float ifClicked1 = new Float(sifClicked);
      resist1 = new Float(sresist1);
      resist2 = new Float(sresist2); 
      ifClicked = (int)ifClicked1;
    } else {
      joyY = 500;
      joyX = 500;
      ifClicked = 1;
      resist1 = 500;    
      resist2 = 500;
    }
    if (serial2!=null) {
      String[] b = split(serial2, ',');
      String sresist3 = b[0];
      String sresist4 = b[1];
      resist3 = new Float(sresist3);
      resist4 = new Float(sresist4);
    }
  } else {
    joyY = 500;
    joyX = 500;
    ifClicked = 1;
    resist1 = 500;    
    resist2 = 500;
    resist3 = 500;
    resist4 = 500;
  }
}

void draw() {
  input();
  //println(joyX+" "+joyY+" "+ifClicked+" "+resist1+" "+resist2+" "+resist3+" "+resist4);
  if (stage==0) {
    fail = new Fail();
    end = new Theend();
    main.drawStage0();
  } else if (stage==1) {    
    s1.drawStage1();
  } else if (stage==2) {  
    s2.drawStage2();
  } else if (stage==3) {
    s3.drawStage3();
  } else if (stage==4) {
    s4.drawStage4();
  } else if (stage==5) {
    ending.drawStage5();
  } else if (stage==10) {
    s10.drawStage10();
  } else if (stage==100) {
    s100.drawStage100();
  } else if (stage==200) {
    s200.drawStage200();
  } else if (stage==10000) {
    fail.drawFail();
  } else if (stage==30) {
    s30.drawStage30();
  } else if (stage==50) {
    s50.drawStage50();
  } else if (stage==300) {
    s300.drawStage300();
  } else if (stage==301) {
    s301.drawStage301();
  } else if (stage==777) {
    end.drawTheend();
  }
}

void movieEvent(Movie m) { //Do not modify this!!
  m.read();
}