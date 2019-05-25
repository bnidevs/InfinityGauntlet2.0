public class guitarStrings {
  int stroke;
  public guitarStrings(int stroke){
    this.stroke = stroke;
    refresh();
  }
  void refresh(){
    int offset = width / 16;
    stroke(stroke);
    strokeWeight(2);
    line(width/2 - 1.5*offset, 0,  2.25*offset + 1*width/8, height);
    line(width/2 - 0.5*offset, 0,  0.75*offset + 3*width/8, height);
    line(width/2 + 0.5*offset, 0, -0.75*offset + 5*width/8, height);
    line(width/2 + 1.5*offset, 0, -2.25*offset + 7*width/8, height);
    
    stroke(173,216,230);
    strokeWeight(3);
    line(width/2 - 2.0*offset, 0,  3.00*offset        , height);
    line(width/2 + 2.0*offset, 0, -3.00*offset + width, height);  
  }
}
