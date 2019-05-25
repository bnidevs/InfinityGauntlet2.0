int offset = 0;
int ellOffset = 0;
int yPos = 0;
float wE = 30;
float hE = 20;
float shift = 0;
int score = 100;
guitarStrings g;

void setup() {
  size(800,600);
  //surface.setResizable(true);
  g = new guitarStrings(63);
}

void draw(){
    offset = width / 16;
    ellOffset = width / 32;
    
    background(0);
    g.refresh();

    stroke(255);
    strokeWeight(1);
    //line(width/2-2*offset, 0, 3*offset, height); //left side
    //line(width/2-offset, 0, 1.5*offset + width/4, height); //left mid
    //line(width/2, 0, width/2, height);
    //line(width/2+offset, 0, width/2-1.5*offset + width/4, height); //right mid
    //line(width/2+2*offset, 0, width-3*offset, height); //right side
    
    fill(0,0,255);
    ellipse(width/2-3*(ellOffset+shift), yPos, wE, hE);
    fill(255,0,0);
    ellipse(width/2-(ellOffset+shift), yPos, wE, hE);
    fill(255,255,0);
    ellipse(width/2+(ellOffset+shift), yPos, wE, hE);
    fill(0,255,0);
    ellipse(width/2+3*(ellOffset+shift), yPos, wE, hE);
    
    stroke(0);
    fill(0);
    rect(0,0,width,200);
    fill(255);
    
    yPos+=1;
    shift+=0.063;
    wE+=0.06;
    hE+=0.04;
    
    textSize(32);
    text(score, width-10, 30);
    textAlign(RIGHT);
    score+=10;
    
}
