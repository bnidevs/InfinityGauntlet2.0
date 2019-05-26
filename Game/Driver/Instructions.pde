PShape backArrowInst;
color arrColorInst, arrOutlineInst;

String instructions;

void arrSetupInst(){
  arrColorInst = color(96,0,193);
  arrOutlineInst = color(218,14,237);
  
  backArrowInst = createShape();
  backArrowInst.beginShape();
  backArrowInst.strokeWeight(2);
  backArrowInst.vertex(10,30);
  backArrowInst.vertex(30,10);
  backArrowInst.vertex(35,15);
  backArrowInst.vertex(25,25);
  backArrowInst.vertex(50,25);
  backArrowInst.vertex(55,30);
  backArrowInst.vertex(50,35);
  backArrowInst.vertex(25,35);
  backArrowInst.vertex(35,45);
  backArrowInst.vertex(30,50);
  backArrowInst.vertex(10,30);
  backArrowInst.endShape();
}

void instructSetup(){
  instructions = "        Use ASDF or the Infinity Gauntlet 2.0™\nto play the guitar.\n\nUse mouse to navigate menus.";
}

void arrDrawInst(){
  if(mouseX > 10 && mouseX < 55 && mouseY > 10 && mouseY < 50){
    backArrowInst.setFill(arrOutlineInst);
    backArrowInst.setStroke(arrColorInst);
  }else{
    backArrowInst.setFill(arrColorInst);
    backArrowInst.setStroke(arrOutlineInst);
  }
  
  shape(backArrowInst);
}

void instructDraw(){
  textFont(buttonFont); //see menu for font type
  fill(priTextColor);
  textAlign(CENTER);
  textSize(25);
  text(instructions,width/2,height/2);
}
