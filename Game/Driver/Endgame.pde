String endTitleText;

int[] scoreTypeContainer = new int[9];

String restartText;
PShape restartButton;

String gameOverScore;

void endTitleSetup(){
  endTitleText = "Game Over";
}

void endTitleDraw(){
  textFont(buttonFont);
  fill(priTextColor);
  text(endTitleText,200,110);
}

void restartSetup(){
  restartText = "Restart";
  
  restartButton = createShape(RECT, 160, 300, 180, 20);
}

void restartDraw(){
  if(mouseX > 160 && mouseX < 340 && mouseY > 300 && mouseY < 320){
    restartButton.setFill(secButtonColor);
    shape(restartButton);
  }else{
    restartButton.setFill(priButtonColor);
    shape(restartButton);
  }
  
  textFont(buttonFont);
  fill(priTextColor);
  text(restartText, 215, 315);
}

void scoreSetup(){
  gameOverScore = "Final Score: " + _score;
}

void scoreDraw(){
  textFont(buttonFont);
  fill(priTextColor);
  text(gameOverScore,400,110);
  
  for(int i = 0; i < 9; i++){
    if(i == 0){
      text("Flawless: " + scoreTypeContainer[i],400, 155 + i * 20);
    }else if(i == 1){
      text("Perfect: " + scoreTypeContainer[i],400, 155 + i * 20);
    }else if(i == 2){
      text("Excellent: " + scoreTypeContainer[i],400, 155 + i * 20);
    }else if(i == 3){
      text("Great: " + scoreTypeContainer[i],400, 155 + i * 20);
    }else if(i == 4){
      text("Good: " + scoreTypeContainer[i],400, 155 + i * 20);
    }else if(i == 5){
      text("OK: " + scoreTypeContainer[i],400, 155 + i * 20);
    }else if(i == 6){
      text("Almost: " + scoreTypeContainer[i],400, 155 + i * 20);
    }else if(i == 7){
      text("Bad: " + scoreTypeContainer[i],400, 155 + i * 20);
    }else if(i == 8){
      text("Miss: " + scoreTypeContainer[i],400, 155 + i * 20);
    }
  }
}
