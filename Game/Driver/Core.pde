import processing.sound.*;
import java.util.ArrayList;
import java.io.File;
import java.util.Scanner;

Hole[] matchHs; //four arrows on top left corner
ArrayList<String> moves; //wasd coordination of moves
ArrayList<Button> moveBtts;
long ctr;
int _score;
color backgroundcolor;
String word;
guitar_driver g;
int bpm;
String data;
int pos = 1;

int offset = width / 16;
int ellOffset = width / 32;
int yPos = 0;
float wE = 30;
float hE = 20;
float shift = 0;
double speed = 1.3;
PFont scoreFont;

long cmtime = 0;
boolean played = false;

int difficulty;
int endCt;
SoundFile music;
int streak = 0;

int mtp = 1;

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
  scoreFont = createFont("ARCADE_R.ttf",20);
}

void coreDraw(){
  if(cmtime == 0){
    cmtime = millis();
  }
  if(difficulty == 0){
    if(millis() - cmtime > 5200 && !played){
      playSong();
      played = true;
    }
  }else if(difficulty == 1){
    if(millis() - cmtime > 6700 && !played){
      playSong();
      played = true;
    }
  }
  else if(difficulty == 2){
    if(millis() - cmtime > 5000 && !played){
      playSong();
      played = true;
    }
  }
  
  background(backgroundcolor);
  displayScore();
  g.stringDraw();
  arrowDraw();
  multiplier();
  if(moves.size() > 0){
    checkMove();
  }
  if(difficulty == 0){
    if(millis() - ctr >= 520 && endCt > 0){
      addMove();
      endCt--;
      ctr = millis();
    }
  }else if(difficulty == 1){
    if(millis() - ctr >= 420 && endCt > 0){
      addMove();
      endCt--;
      ctr = millis();
    }
  }else if(difficulty == 2){
    if(millis() - ctr >= 320 && endCt > 0){
      addMove();
      endCt--;
      ctr = millis();
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

void multiplier(){
  if(streak >= 25 && streak < 50){
    mtp = 2;
  }else if(streak >= 50 && streak < 100){
    mtp = 4;
  }else if(streak >= 100){
    mtp = 8;
  }else{
    mtp = 1;
  }
  
  stroke(255);
  strokeWeight(3);
  fill(0);
  circle(80, 140, 100);
  textFont(scoreFont);
  fill(255);
  text("x" + Integer.toString(mtp), 65, 150);
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
    b.yPos+=speed;
    b.shift+=0.063;
    b.wE+=0.06;
    b.hE+=0.04;
  }
}

void loadSong(String s){
  try {
    File f = new File(dataPath(s + ".txt"));
    Scanner sc = new Scanner(f);
    bpm = Integer.parseInt(sc.nextLine());
    data = "";
    while (sc.hasNextLine()) {
      data += sc.nextLine();
    }
    endCt = data.length()-1;
    sc.close();
    music = new SoundFile(this, dataPath(s + ".mp3"));
    } catch(Exception e){
      e.printStackTrace();
    }
}

void playSong(){
  music.play();
}

void addMove(){
  String s = data.substring(pos,pos+1);
  pos++;
  if(s.equals("a")){
    moves.add("a");
    Button temp = new Button(width/2-3*(ellOffset+shift), 0, 0);
    moveBtts.add(temp);
  }else if(s.equals("s")){
    moves.add("s");
    Button temp = new Button(width/2-(ellOffset+shift), 0, 1);
    moveBtts.add(temp);
  }else if(s.equals("d")){
    moves.add("d");
    Button temp = new Button(width/2+(ellOffset+shift), 0, 2);
    moveBtts.add(temp);
  }else if(s.equals("f")){
    moves.add("f");
    Button temp = new Button(width/2+3*(ellOffset+shift), 0, 3);
    moveBtts.add(temp);
  }
}

void beginRemove(int pos, boolean trigger){
  score(pos);
  moves.remove(pos);
  moveBtts.remove(pos);
}

void keyPressed(){
  int pos = find(key + "", moves);
  if(pos != -1 && moveBtts.get(pos).yPos > 430){
    beginRemove(pos, true);
  }else{
    return;
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

void checkMove(){
  if(moveBtts.get(0).yPos > 510){
    beginRemove(0, false);
  }
}
void score(int pos) {
  float ydiff;
  PFont scoreFont = createFont("ARCADE_R.ttf",20);
  textFont(scoreFont);
  ydiff = abs(moveBtts.get(pos).yPos - 462);//distance bwtn moves and moveArrs
  int addtoscor = 0;
  if ((int)ydiff == 0) {
    addtoscor = 7; //flawless 
    word = "FLAWLESS"; 
    scoreTypeContainer[0]++;
    streak++;
  }
  else if (ydiff < 5) {
    addtoscor = 6; //perfect
    word = "PERFECT";
    scoreTypeContainer[1]++;
    streak++;
  }
  else if (ydiff < 10) {
    addtoscor = 5; //excellent
    word = "EXCELLENT";
    scoreTypeContainer[2]++;
    streak++;
  }
  else if (ydiff < 15) {
    addtoscor = 4; //great
    word = "GREAT";
    scoreTypeContainer[3]++;
    streak++;
  }
  else if (ydiff < 20) {
    addtoscor = 3; //good 
    word = "GOOD";
    scoreTypeContainer[4]++;
    streak++;
  }
  else if (ydiff < 25) {
    addtoscor = 2; //okay
    word = "OK";
    scoreTypeContainer[5]++;
    streak=0;
  }
  else if (ydiff < 30) {
    addtoscor = 1; //almost
    word = "ALMOST";
    scoreTypeContainer[6]++;
    streak=0;
  }
  else if (ydiff < 35) {
    addtoscor = -1; //bad
    word = "BAD";
    scoreTypeContainer[7]++;
    streak=0;
  }
  else if (ydiff < 50){
    addtoscor = -2; //miss
    word = "MISS";
    scoreTypeContainer[8]++;
    streak=0;
  }
  if(addtoscor > 0){
    _score += addtoscor * mtp;
  }else{
    _score += addtoscor;
  }
  if(streak > scoreTypeContainer[9]) scoreTypeContainer[9] = streak;
  println(_score);
}

void displayScore() {
  color g = color(96,0,193);
  fill(g);
  rect(470,15,220,65);
  textFont(scoreFont);
  fill(0);
  text("score: ", 525,45); 
  if(_score > 0){
    text(_score,565 - 10 * floor(log(_score) / log(10)),70);
  } else {
    text(_score,565 - 10 * floor(log(abs(_score)) / log(10) + 1),70);
  }
  textSize(20);
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
  text(word, 500, 150);
  
  fill(255);
  text("Streak: ", 20,40); 
  text(streak, 70 - 10 * floor(log(_score) / log(10)),70);
}
