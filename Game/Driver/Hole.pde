class Hole{
  int offset = width / 16;
  int ellOffset = width / 32;
  int yPos = 0;
  float wE = 30;
  float hE = 20;
  float shift = 0;
  int score = 100;
  
  int type;
  PImage img;
  
  public Hole(int id){
    type = id;
    if(type == 0){
      img = GRNHOL;
    }else if(type == 1){
      img = REDHOL;
    }else if(type == 2){
      img = YLWHOL;
    }else{
      img = BLUHOL;
    }
  }
  
  void drw(){
    if(type == 0){
      image(img, 2.25*offset + 1*width/8-25, height - 70, 75,50);
    }else if(type == 1){
      image(img, 0.75*offset + 3*width/8-35, height - 70, 75, 50);
    }else if(type == 2){
      image(img, -0.75*offset + 5*width/8-40, height - 70, 75,50);
    }else{
      image(img, -2.25*offset + 7*width/8-48, height - 70, 75,50);
    }
  }
}
