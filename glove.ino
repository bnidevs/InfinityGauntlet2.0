#include <Keyboard.h>

bool middle = false;
bool index = false;
bool pinky = false;
bool ring = false;
bool middlep = false;
bool indexp = false;
bool pinkyp = false;
bool ringp = false;
  
void setup()
{
  Serial.begin(9600);
  Keyboard.begin();
}

void loop()
{
  if(analogRead(A0) > 800){ // middle
    middle = true;
  }else{
    middle = false;
  }
  if(middle == false and middlep == true){
    Serial.println("middle");
    Keyboard.write('s');
  }
  middlep = middle;
  
  if(analogRead(A1) > 800){ // index
    index = true;
  }else{
    index = false;
  }
  if(index == false and indexp == true){
    Serial.println("index");
    Keyboard.write('d');
  }
  indexp = index;
  
  if(analogRead(A2) > 800){ // pinky
    pinky = true;
  }else{
    pinky = false;
  }
  if(pinky == false and pinkyp == true){
    Serial.println("pinky");
    Keyboard.write('a');
  }
  pinkyp = pinky;
  
  if(analogRead(A3) > 800){ // ring
    ring = true;
  }else{
    ring = false;
  }
  if(ring == false and ringp == true){
    Serial.println("ring");
    Keyboard.write('w');
  }
  ringp = ring;
  
}
