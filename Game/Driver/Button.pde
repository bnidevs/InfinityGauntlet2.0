class Button {

  PShape buttonShape;
  float ycor;
  float xcor;
  
  int offset = 0;
  int ellOffset = 0;
  int yPos = 0;
  float wE = 30;
  float hE = 20;
  float shift = 0;
  
  int type = 0;

  public Button(float x, float y, int id) {
    xcor = x;
    ycor = y;
    buttonShape = makeButton(); 
    setFS();
  }

  PShape makeButton() {
    return createShape(ELLIPSE, xcor, ycor, 50, 30);
  }

  void setFS() {
    buttonShape.setFill(220);
    buttonShape.setStroke(235);
  }

  void tempSet() {
    buttonShape.setFill(0);
    buttonShape.translate(0, -600);
  }

  void moveDown() {
    if(type == 0){
      buttonShape = createShape(ELLIPSE, width/2-3*(ellOffset+shift), yPos, wE, hE);
    }else if(type == 1){
      buttonShape = createShape(ELLIPSE, width/2-(ellOffset+shift), yPos, wE, hE);
    }else if(type == 2){
      buttonShape = createShape(ELLIPSE, width/2+(ellOffset+shift), yPos, wE, hE);
    }else{
      buttonShape = createShape(ELLIPSE, width/2+3*(ellOffset+shift), yPos, wE, hE);
    }
  }
}
