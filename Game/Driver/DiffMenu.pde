PShape backArrowDiffMenu;
color arrColorDiffMenu, arrOutlineDiffMenu;

PShape ezButton, medButton, hrdButton;
PShape[] diffButtonArr;

String ezButtonText, medButtonText, hrdButtonText;
String[] diffButtonTxtArr;

String ezDesc, medDesc, hrdDesc;
String[] diffDescs;

String diffMenuTitle;

void diffMenuTextDraw(){
  int i = 255;
  for(String s : diffButtonTxtArr){
    textFont(buttonFont);
    fill(priTextColor);
    text(s,140,i);
    i += 30;
  }
  
  text(diffMenuTitle, 130, 160);
}

void diffDescDraw(int diff){
  if(diff == 0){
    textFont(buttonFont);
    fill(priTextColor);
    text(ezDesc,320,255);
  }else if(diff == 1){
    textFont(buttonFont);
    fill(priTextColor);
    text(medDesc,320,285);
  }else if(diff == 2){
    textFont(buttonFont);
    fill(priTextColor);
    text(hrdDesc,320,315);
  }
}

void diffMenuButtonDraw(){
  for(PShape p : diffButtonArr){
    shape(p);
  }
}

void diffButtonHover(){
  if(mouseX > 130 && mouseX < 330){
    if(mouseY > 240 && mouseY < 260){
      diffButtonArr[0].setFill(secButtonColor);
      diffDescDraw(0);
    }else if(mouseY > 270 && mouseY < 290){
      diffButtonArr[1].setFill(secButtonColor);
      diffDescDraw(1);
    }else if(mouseY > 300 && mouseY < 320){
      diffButtonArr[2].setFill(secButtonColor);
      diffDescDraw(2);
    }else{
      for(int i = 0; i < buttonArr.length; i++){
        diffButtonArr[i].setFill(priButtonColor);
      }
    }
  }else{
    for(int i = 0; i < buttonArr.length; i++){
      diffButtonArr[i].setFill(priButtonColor);
    }
  }
}

void arrSetupDiffMenu(){
  arrColorDiffMenu = color(96,0,193);
  arrOutlineDiffMenu = color(218,14,237);
  
  backArrowDiffMenu = createShape();
  backArrowDiffMenu.beginShape();
  backArrowDiffMenu.strokeWeight(2);
  backArrowDiffMenu.vertex(10,30);
  backArrowDiffMenu.vertex(30,10);
  backArrowDiffMenu.vertex(35,15);
  backArrowDiffMenu.vertex(25,25);
  backArrowDiffMenu.vertex(50,25);
  backArrowDiffMenu.vertex(55,30);
  backArrowDiffMenu.vertex(50,35);
  backArrowDiffMenu.vertex(25,35);
  backArrowDiffMenu.vertex(35,45);
  backArrowDiffMenu.vertex(30,50);
  backArrowDiffMenu.vertex(10,30);
  backArrowDiffMenu.endShape();
}

void arrDrawDiffMenu(){
  if(mouseX > 10 && mouseX < 55 && mouseY > 10 && mouseY < 50){
    backArrowDiffMenu.setFill(arrOutlineDiffMenu);
    backArrowDiffMenu.setStroke(arrColorDiffMenu);
  }else{
    backArrowDiffMenu.setFill(arrColorDiffMenu);
    backArrowDiffMenu.setStroke(arrOutlineDiffMenu);
  }
  
  shape(backArrowDiffMenu);
}

void diffMenuButtonSetup(){
  diffButtonArr = new PShape[3];
  
  ezButton = createShape(RECT, 130, 240, 180, 20);
  
  medButton = createShape(RECT, 130, 270, 180, 20);
  
  hrdButton = createShape(RECT, 130, 300, 180, 20);
  
  diffButtonArr[0] = ezButton;
  diffButtonArr[1] = medButton;
  diffButtonArr[2] = hrdButton;
}

void diffButtonTextSetup(){
  ezButtonText = "Easy";
  medButtonText = "Medium";
  hrdButtonText = "Hard";
  
  diffButtonTxtArr = new String[3];
  
  diffButtonTxtArr[0] = ezButtonText;
  diffButtonTxtArr[1] = medButtonText;
  diffButtonTxtArr[2] = hrdButtonText;
}

void diffMenuTitleSetup(){
  diffMenuTitle = "Select a Difficulty";
}

void diffDescSetup(){
  ezDesc = "Eye of the Tiger, 116 BPM";
  medDesc = "Iron Man, 144 BPM";
  hrdDesc = "Through the Fire and Flames, 200 BPM";
}
