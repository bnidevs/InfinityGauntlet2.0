class Button {
  PImage buttonShape;
  float ycor;
  float xcor;
  
  int offset = width / 16;
  int ellOffset = width / 32;
  int yPos = 0;
  float wE = 30;
  float hE = 20;
  float shift = 0;
  
  int type = 0;

  public Button(float x, float y, int id) { //id = 0 blue; id = 1 yellow ; id = 2 green
    xcor = x;
    ycor = y;
    type = id;
    buttonShape = makeButton(); 
  }

  PImage makeButton() {
    if(type == 0){
      return loadImage("g.png");
    } else if(type == 1) {
      return loadImage("r.png");
    } else if(type == 2) {
      return loadImage("y.png");
    } else {
      return loadImage("b.png");
    }
  }
}
