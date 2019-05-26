import java.util.ArrayList;

Button right, left, up, down;
Button[] matchBtts; //four arrows on top left corner
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
  arrowDraw();
  g.stringDraw();
  arrMove();
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
  matchBtts = new Button[4];
  
  //  ******************* RIGHT ARROW SETUP BEGIN *******************
  matchBtts[0] = new Button(193, 450, 0);
  //  ******************** RIGHT ARROW SETUP END ********************
  
  //  ******************* LEFT ARROW SETUP BEGIN ********************
  matchBtts[1] = new Button(297, 450, 1); 
  //  ******************** LEFT ARROW SETUP END *********************
  
  //  ********************* UP ARROW SETUP BEGIN ********************
  matchBtts[2] = new Button(400, 450, 2);
  //  ********************** UP ARROW SETUP END *********************
  
  //  ******************** DOWN ARROW SETUP BEGIN *******************
  matchBtts[3] = new Button(504, 450, 3);
  //  ********************* DOWN ARROW SETUP END ********************
}

void arrowDraw(){
  for(Button b : matchBtts){
    shape(b.buttonShape);
  }
  for(Button b : moveBtts){
    shape(b.buttonShape);
    b.yPos+=1;
    b.shift+=0.063;
    b.wE+=0.06;
    b.hE+=0.04;
  }
}

void addMove(){
  double decision = Math.random();
  if(decision < 0.25){
    moves.add("w");
    Button temp = new Button(width/2-3*(ellOffset+shift), 0, 0);
    moveBtts.add(temp);
  }else if(decision < 0.5){
    moves.add("a");
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
  score();
  moves.remove(pos);
  moveBtts.remove(pos);
}

void keyPressed(){
  int pos = find(key + "", moves);
  if(pos != -1){
    removeMove(pos);
  }
}

void arrMove(){
  int len = moveBtts.size();
  for(int i = 0; i < len; i++){
    moveBtts.get(i).moveDown();
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
  if(moves.get(0) == "w"){
    if(moveBtts.get(0).ycor < -45){
      removeMove(0);
    }
  }else if(moves.get(0) == "a"){
    if(moveBtts.get(0).ycor < -45){
      removeMove(0);
    }
  }else if(moves.get(0) == "s"){
    if(moveBtts.get(0).ycor < -45){
      removeMove(0);
    }
  }else{
    if(moveBtts.get(0).ycor < -45){
      removeMove(0);
    }
  }
}
void score() {
  float ydiff;
  PFont scoreFont = createFont("ARCADE_R.ttf",20);
  textFont(scoreFont);
  if (moves.get(0) == "w" || moves.get(0) == "s") {
    ydiff = abs(moveBtts.get(0).ycor - 52);//distance bwtn moves and moveArrs 
}
  else {
    ydiff = abs(moveBtts.get(0).ycor - 50);//distance bwtn moves and moveArrs
  }
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
  rect(450,50,200,100);
  PFont scoreFont = createFont("ARCADE_R.ttf",20);
  textFont(scoreFont);
  fill(0);
  text("score: ", 500,90); 
  text(_score,540 - 10 * floor(log(_score) / log(10)),125);
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
