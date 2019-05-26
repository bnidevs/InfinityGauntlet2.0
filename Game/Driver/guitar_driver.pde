class guitar_driver{

  int offset = 0;
  int ellOffset = 0;
  int yPos = 0;
  float wE = 30;
  float hE = 20;
  float shift = 0;
  int score = 100;
  guitarStrings g;
  
  public guitar_driver(){
    g = new guitarStrings(63);
  }
  
  void stringDraw(){
      offset = width / 16;
      ellOffset = width / 32;
      g.refresh();
  
      stroke(255);
      strokeWeight(1);
      //line(width/2-2*offset, 0, 3*offset, height); //left side
      //line(width/2-offset, 0, 1.5*offset + width/4, height); //left mid
      //line(width/2, 0, width/2, height);
      //line(width/2+offset, 0, width/2-1.5*offset + width/4, height); //right mid
      //line(width/2+2*offset, 0, width-3*offset, height); //right side
      
  }
  
}
