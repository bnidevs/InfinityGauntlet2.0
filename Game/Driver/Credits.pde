PShape backArrowCreds;
color arrColorCreds, arrOutlineCreds;

String credits1;
String credits2;

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
  credits1 = "Infinity Gauntlet Demo";
  credits2 = "Developers: Bill    Ni\n                 Kevin  Cheng\n                 Harris Miller\n                 Alex   Liu";
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
  textAlign(CENTER);
  textSize(25);
  text(credits1,width/2,200);
  textAlign(LEFT);
  text(credits2,190,250);
}
