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
    Serial.println("middle");
    Keyboard.write('W');
  }
  
  if(analogRead(A1) > 800){ // index
    Serial.println("index");
    Keyboard.write('A');
  }
  
  if(analogRead(A2) > 800){ // pinky
    Serial.println("pinky");
    Keyboard.write('S');
  }
  
  if(analogRead(A3) > 800){ // ring
    Serial.println("ring");
    Keyboard.write('D');
  }
  
}
