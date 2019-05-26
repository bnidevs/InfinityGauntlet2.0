
import java.util.ArrayList;

Hole[] matchHs; //four arrows on top left corner
ArrayList<String> moves; //wasd coordination of moves
ArrayList<Button> moveBtts;
int ctr;
int _score;
color backgroundcolor;
String word;
guitar_driver g;

int offset = width / 16;
int ellOffset = width / 32;
int yPos = 0;
float wE = 30;
float hE = 20;
float shift = 0;

int difficulty;
int endCt;

void coreSetup(){
  //size(700,500);
  //frameRate(60);
  //backgroundcolor = color(0);
  ctrSetup();
  moveSetup();
  arrowSetup();
  arrowDraw();
  word = "";  
  g = new guitar_driver();
}

void coreDraw(){
  background(backgroundcolor);
  displayScore();
  g.stringDraw();
  arrowDraw();
  if(moves.size() > 0){
    checkMove();
  }
  count();
  if(difficulty == 0){
    if(ctr == 0 && endCt > 0){
      addMove();
      endCt--;
    }
  }else if(difficulty == 1){
    if((ctr == 0 || ctr == 30) && endCt > 0){
      addMove();
      endCt--;
    }
  }else if(difficulty == 2){
    if((ctr == 0 || ctr == 15 || ctr == 30 || ctr == 45) && endCt > 0){
      addMove();
      endCt--;
    }
  }
}

void ctrSetup(){
  ctr = 0;
}

void moveSetup(){
  moves = new ArrayList<String>();
  moveBtts = new ArrayList<Button>();
}

void arrowSetup(){
  matchHs = new Hole[4];
  
  //  ******************* RIGHT ARROW SETUP BEGIN *******************
  matchHs[0] = new Hole(0);
  //  ******************** RIGHT ARROW SETUP END ********************
  
  //  ******************* LEFT ARROW SETUP BEGIN ********************
  matchHs[1] = new Hole(1);
  //  ******************** LEFT ARROW SETUP END *********************
  
  //  ********************* UP ARROW SETUP BEGIN ********************
  matchHs[2] = new Hole(2);
  //  ********************** UP ARROW SETUP END *********************
  
  //  ******************** DOWN ARROW SETUP BEGIN *******************
  matchHs[3] = new Hole(3);
  //  ********************* DOWN ARROW SETUP END ********************
}

void arrowDraw(){
  for(Hole h : matchHs){
    h.drw();
  }
  for(Button b : moveBtts){
    if(b.type == 0){
      image(b.buttonShape, width/2-3*(b.ellOffset+b.shift)- (b.wE/2), b.yPos - b.hE, b.wE, b.hE);
    } else if(b.type == 1) {
      image(b.buttonShape, width/2-(b.ellOffset+b.shift)- (b.wE/2), b.yPos - b.hE, b.wE, b.hE);
    } else if(b.type == 2) {
      image(b.buttonShape, width/2+(b.ellOffset+b.shift)- (b.wE/2), b.yPos - b.hE, b.wE, b.hE);
    } else{
      image(b.buttonShape, width/2+3*(b.ellOffset+b.shift)- (b.wE/2), b.yPos - b.hE, b.wE, b.hE);
    }
    b.yPos+=1.3;
    b.shift+=0.063;
    b.wE+=0.06;
    b.hE+=0.04;
  }
}

void addMove(){
  double decision = Math.random();
  if(decision < 0.25){
    moves.add("a");
    Button temp = new Button(width/2-3*(ellOffset+shift), 0, 0);
    moveBtts.add(temp);
  }else if(decision < 0.5){
    moves.add("w");
    Button temp = new Button(width/2-(ellOffset+shift), 0, 1);
    moveBtts.add(temp);
  }else if(decision < 0.75){
    moves.add("s");
    Button temp = new Button(width/2+(ellOffset+shift), 0, 2);
    moveBtts.add(temp);
  }else{
    moves.add("d");
    Button temp = new Button(width/2+3*(ellOffset+shift), 0, 3);
    moveBtts.add(temp);
  }
}

void removeMove(int pos){
  score(pos);
  moves.remove(pos);
  moveBtts.remove(pos);
}

void keyPressed(){
  int pos = find(key + "", moves);
  if(pos != -1){
    removeMove(pos);
  }
}

int find(String x, ArrayList<String> arr){
  int rtrnVal = 0;
  for(String s : arr){
    if(x.equals(s)){
      return rtrnVal;
    }else{
      rtrnVal++;
    }
  }
  return -1;
}

void count(){
  if(ctr == 60){
    ctr = 0;
  }else{
    ctr++;
  }
}

void checkMove(){
  if(moveBtts.get(0).yPos > 510){
    removeMove(0);
  }
}
void score(int pos) {
  float ydiff;
  PFont scoreFont = createFont("ARCADE_R.ttf",20);
  textFont(scoreFont);
  ydiff = abs(moveBtts.get(pos).yPos - 462);//distance bwtn moves and moveArrs
  if ((int)ydiff == 0) {
    _score += 7; //flawless 
    word = "FLAWLESS"; 
    scoreTypeContainer[0]++;
  }
  else if (ydiff < 5) {
    _score += 6; //perfect
    word = "PERFECT";
    scoreTypeContainer[1]++;
  }
  else if (ydiff < 10) {
    _score += 5; //excellent
    word = "EXCELLENT";
    scoreTypeContainer[2]++;
  }
  else if (ydiff < 15) {
    _score += 4; //great
    word = "GREAT";
    scoreTypeContainer[3]++;
  }
  else if (ydiff < 20) {
    _score += 3; //good 
    word = "GOOD";
    scoreTypeContainer[4]++;
  }
  else if (ydiff < 25) {
    _score += 2; //okay
    word = "OK";
    scoreTypeContainer[5]++;
  }
  else if (ydiff < 30) {
    _score += 1; //almost
    word = "ALMOST";
    scoreTypeContainer[6]++;
  }
  else if (ydiff < 35) {
    _score -= 1; //bad
    word = "BAD";
    scoreTypeContainer[7]++;
  }
  else {
    _score -= 2; //miss
    word = "MISS";
    scoreTypeContainer[8]++;
  }
  println(_score);
}

void displayScore() {
  color g = color(96,0,193);
  fill(g);
  rect(470,15,220,65);
  PFont scoreFont = createFont("ARCADE_R.ttf",20);
  textFont(scoreFont);
  fill(0);
  text("score: ", 525,45); 
  if(_score > 0){
    text(_score,565 - 10 * floor(log(_score) / log(10)),70);
  } else {
    text(_score,565 - 10 * floor(log(abs(_score)) / log(10) + 1),70);
  }
  textSize(25);
  if (word.equals("FLAWLESS")) 
    fill(color(96,0,193)); //purple
  else if (word.equals("PERFECT")) 
    fill(color(29,0,238)); //dark blue
  else if (word.equals("EXCELLENT")) 
    fill(color(166,247,237)); //baby blue
  else if (word.equals("GREAT")) 
    fill(color(30,255,201)); //green-blue
  else if (word.equals("GOOD")) 
    fill(color(55,251,16)); //green
  else if (word.equals("OK"))
    fill(color(255,221,0)); // yellow
  else if (word.equals("ALMOST")) 
    fill(color(255,170,0)); //orange
  else if (word.equals("BAD")) 
    fill(color(255,104,0)); //red-orange
  else if (word.equals("MISS")) 
    fill(color(250,64,24)); //red
  text(word, 470, 300);
}
