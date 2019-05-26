PShape backArrowCreds;
color arrColorCreds, arrOutlineCreds;

String credits;

void arrSetupCreds(){
  arrColorCreds = color(96,0,193);
  arrOutlineCreds = color(218,14,237);
  
  backArrowCreds = createShape();
  backArrowCreds.beginShape();
  backArrowCreds.strokeWeight(2);
  backArrowCreds.vertex(10,30);
  backArrowCreds.vertex(30,10);
  backArrowCreds.vertex(35,15);
  backArrowCreds.vertex(25,25);
  backArrowCreds.vertex(50,25);
  backArrowCreds.vertex(55,30);
  backArrowCreds.vertex(50,35);
  backArrowCreds.vertex(25,35);
  backArrowCreds.vertex(35,45);
  backArrowCreds.vertex(30,50);
  backArrowCreds.vertex(10,30);
  backArrowCreds.endShape();
}

void creditsSetup(){
  credits = "         Infinity Gauntlet Demo\nDevelopers: Kevin, Alex, Harris, Bill Ni";
}

void arrDrawCreds(){
  if(mouseX > 10 && mouseX < 55 && mouseY > 10 && mouseY < 50){
    backArrowCreds.setFill(arrOutlineCreds);
    backArrowCreds.setStroke(arrColorCreds);
  }else{
    backArrowCreds.setFill(arrColorCreds);
    backArrowCreds.setStroke(arrOutlineCreds);
  }
  
  shape(backArrowCreds);
}

void creditsDraw(){
  textFont(buttonFont); //see menu for font type
  fill(priTextColor);
  text(credits,150,230);
}
