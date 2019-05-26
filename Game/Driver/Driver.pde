final int MENU = 0;
final int INSTRUCT = 1;
final int CREDITS = 2;
final int PLAY = 3;
final int DIFFMENU = 4;
final int ENDGAME = 5;

PImage REDBTT;
PImage GRNBTT;
PImage YLWBTT;
PImage BLUBTT;

PImage REDHOL;
PImage GRNHOL;
PImage YLWHOL;
PImage BLUHOL;

int status = MENU;

void setup(){
  REDBTT = loadImage("r.png");
  GRNBTT = loadImage("g.png");
  YLWBTT = loadImage("y.png");
  BLUBTT = loadImage("b.png");
  
  REDHOL = loadImage("rhole.png");
  GRNHOL = loadImage("ghole.png");
  YLWHOL = loadImage("yhole.png");
  BLUHOL = loadImage("bhole.png");
  
  size(700,500);
  textAlign(LEFT);
  // MENU SETUP
  buttonSetup();
  colorSetup();
  fontSetup();
  buttonTextSetup();
  logoSetup();
  
  // INSTRUCTIONS SETUP
  arrSetupInst();
  instructSetup();
  
  // CREDITS SETUP
  arrSetupCreds();
  creditsSetup();
  
  // CORE SETUP
  coreSetup();
  
  // DIFFICULTY MENU SETUP
  diffButtonTextSetup();
  diffMenuTitleSetup();
  diffMenuButtonSetup();
  arrSetupDiffMenu();
  diffDescSetup();
  
  //END SETUP
  endTitleSetup();
  restartSetup();
  
  frameRate(60);
}

void draw(){
  background(0);
  
  //MENU DRAW
  if(status == MENU){
    textAlign(LEFT);
    buttonHover();
    buttonDraw();
    txtDraw();
    titleDraw();
  }
  
  //INSTRUCTIONS DRAW
  if(status == INSTRUCT){
    arrDrawInst();
    instructDraw();
  }
  
  //CREDITS DRAW
  if(status == CREDITS){
    arrDrawCreds();
    creditsDraw();
  }
  
  //PLAY MODE
  if(status == PLAY){
    coreDraw();
    if(endCt <= 0 && moveBtts.isEmpty()){
      status = ENDGAME;
    }
  }
  
  //DIFFICULTY MENU DRAW
  if(status == DIFFMENU){
    arrDrawDiffMenu();
    diffMenuButtonDraw();
    diffButtonHover();
    diffMenuTextDraw();
  }
  
  //GAME OVER DRAW
  if(status == ENDGAME){
    scoreSetup();
    endTitleDraw();
    restartDraw();
    scoreDraw();
  }
}

void mouseClicked(){
  if(status == MENU && mouseX > displaceMenu + 260 && mouseX < displaceMenu + 440){
    if(mouseY > 290 && mouseY < 310){
      status = DIFFMENU;
    }else if(mouseY > 320 && mouseY < 340){
      status = INSTRUCT;
    }else if(mouseY > 350 && mouseY < 370){
      status = CREDITS;
    }
  }
  
  if((status == CREDITS || status == INSTRUCT || status == DIFFMENU) && mouseX > 10 && mouseX < 55 && mouseY > 10 && mouseY < 50){
    status = MENU;
  }
  
  if(status == DIFFMENU && mouseX > 130 && mouseX < 330){
    if(mouseY > 240 && mouseY < 260){
      difficulty = 0;
      loadSong("EyeOfTheTiger");
      status = PLAY;
    }else if(mouseY > 270 && mouseY < 290){
      difficulty = 1;
      loadSong("IronMan");
      status = PLAY;
    }else if(mouseY > 300 && mouseY < 320){
      difficulty = 2;
      loadSong("ThroughTheFireAndFlames");
      status = PLAY;
    }
  }
  
  if(status == ENDGAME && mouseX > 160 && mouseX < 340 && mouseY > 300 && mouseY < 320){
    status = DIFFMENU;
    _score = 0;
    scoreTypeContainer = new int[10];
    ctr = 0;
    word = "";
  }
}
