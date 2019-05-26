PShape songSelectButton, instructButton, creditsButton;
PShape[] buttonArr;
String songSelectButtonText, instructButtonText, creditsButtonText;
String[] buttonTxtArr;
color priButtonColor, secButtonColor;
color priTextColor, secTextColor;
PFont buttonFont;

PImage titleLogo;

int displaceMenu;

void buttonDraw(){
  for(PShape p : buttonArr){
    shape(p);
  }
}

void txtDraw(){
  int i = 305;
  for(String s : buttonTxtArr){
    textFont(buttonFont);
    fill(priTextColor);
    text(s,displaceMenu + 270,i);
    i += 30;
  }
}

void titleDraw(){
  image(titleLogo, 120, 50, 420, 300);
}

void buttonHover(){
  if(mouseX > 260 && mouseX < 440){
    if(mouseY > 290 && mouseY < 310){
      buttonArr[0].setFill(secButtonColor);
    }else if(mouseY > 320 && mouseY < 340){
      buttonArr[1].setFill(secButtonColor);
    }else if(mouseY > 350 && mouseY < 370){
      buttonArr[2].setFill(secButtonColor);
    }else{
      for(int i = 0; i < buttonArr.length; i++){
        buttonArr[i].setFill(priButtonColor);
      }
    }
  }else{
    for(int i = 0; i < buttonArr.length; i++){
      buttonArr[i].setFill(priButtonColor);
    }
  }
}

void buttonSetup(){
  displaceMenu = 0;
  
  buttonArr = new PShape[3];
  
  songSelectButton = createShape(RECT, displaceMenu + 260, 290, 180, 20);
  
  instructButton = createShape(RECT, displaceMenu + 260, 320, 180, 20);
  
  creditsButton = createShape(RECT, displaceMenu + 260, 350, 180, 20);
  
  buttonArr[0] = songSelectButton;
  buttonArr[1] = instructButton;
  buttonArr[2] = creditsButton;
}

void buttonTextSetup(){
  songSelectButtonText = "Play";
  instructButtonText = "Instructions";
  creditsButtonText = "Credits";
  
  buttonTxtArr = new String[3];
  
  buttonTxtArr[0] = songSelectButtonText;
  buttonTxtArr[1] = instructButtonText;
  buttonTxtArr[2] = creditsButtonText;
}

void logoSetup(){
  titleLogo = loadImage("logo.png");
}

void colorSetup(){
  priButtonColor = color(96,0,193);
  secButtonColor = color(218,14,237);
  priTextColor = color(41,229,179);
}

void fontSetup(){
  buttonFont = createFont("Azedo-Bold.otf", 17);
}
