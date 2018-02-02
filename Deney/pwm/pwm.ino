const int analogInPin1 = A1; const int analogInPin2 = A2; 
const int analogOutPin1 = 9; const int analogOutPin2 = 10;
const int analogOutPin3 = 8; const int analogOutPin4 = 7;
unsigned long previousMillis = 0;
unsigned long previousMillis2 = 0;
unsigned long previousMillis3 = 0;
unsigned long previousMillis4 = 0;
int sensorValue1 = 0; int sensorValue2 = 0;
int outputValue1 = 0; int outputValue2 = 0;
int valve1 = 0; int valve2 = 0;
int pin1state = 0; int pin2state = 0;
int pin1state2 = 0; int pin2state2 = 0;
int pin1state3 = 0; int pin2state3 = 0;
int pin1state4 = 0; int pin2state4 = 0;
int currentMillis; 
void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600);
}

int wait1(int interval, int pin1, int pin2){
unsigned long currentMillis = millis();
if(pin1state == 255 && pin2state == 0){
if(currentMillis - previousMillis >= 50+interval*(90-interval)/100) {
  previousMillis=currentMillis;
  pin1state=0;
}
}
else{
  if(currentMillis - previousMillis >= 50+interval*(10+interval)/100){
      previousMillis=currentMillis;
    pin1state=255;
    pin2state=0;
  }
}
  
  analogWrite(pin1,pin1state);
  analogWrite(pin2,pin2state);
  delay(2);
}

int wait2(int interval2, int pin3, int pin4){
unsigned long currentMillis2 = millis();
if(pin1state2 == 255 && pin2state2 == 0){
if(currentMillis2 - previousMillis2 >= 252-interval2) {
  previousMillis2=currentMillis2;
  pin1state2=0;
  pin2state2=0;l
}
}
else{
  if(currentMillis2 - previousMillis2 >= 156+interval2){
      previousMillis2=currentMillis2;
    pin1state2=255;
    pin2state2=0;
  }
}  
  analogWrite(pin3,pin1state2);
  analogWrite(pin4,pin2state2);
  delay(3);
}

int wait3(int interval3, int pin5, int pin6){
unsigned long currentMillis3 = millis();
if(pin1state3 == 255 && pin2state3 == 0){
if(currentMillis3 - previousMillis3 >= 150-interval3) {
  previousMillis3=currentMillis3;
  pin1state3=0;
}
}
else{
  if(currentMillis3 - previousMillis3 >= 55+interval3){
      previousMillis3=currentMillis3;
    pin1state3=255;
    pin2state3=0;
  }
}
  
  analogWrite(pin5,pin1state3);
  analogWrite(pin6,pin2state3);
  delay(4);
}
int wait4(int interval4, int pin7, int pin8){
unsigned long currentMillis4 = millis();
if(pin1state4 == 255 && pin2state4 == 0){
if(currentMillis4 - previousMillis4 >= 292-interval4) {
  previousMillis4=currentMillis4;
  pin1state4=0;
}
}
else{
  if(currentMillis4 - previousMillis4 >= 196+interval4){
      previousMillis4=currentMillis4;
    pin1state4=255;
    pin2state4=0;
  }
}  
  analogWrite(pin7,pin1state4);
  analogWrite(pin8,pin2state4);
  delay(5);
}


void loop() {
  int present=millis();  
  sensorValue1 = analogRead(analogInPin1);
  outputValue1 = map(sensorValue1, 0, 1023, 0, 255); 
 
  if(outputValue1 < 11){
  analogWrite(analogOutPin1, 0);analogWrite(analogOutPin2, 255);
   }
  if(outputValue1 < 100 && outputValue1 > 10){   
    wait1(outputValue1,10,9);   // exhaust mode
  }
  
  if(outputValue1 > 100){
    if(outputValue1 <156){
    analogWrite(analogOutPin1, 0);
    analogWrite(analogOutPin2, 0);
    }
    if(outputValue1 > 252){
    analogWrite(analogOutPin1, 255);
    analogWrite(analogOutPin2, 0);
    }  
    if(outputValue1 > 155 && outputValue1 < 253){   //THIS IS THE INFLATOIION PART
    wait2(outputValue1,9,10);  //inflation mode
    }
  }
    
  sensorValue2 = analogRead(analogInPin2);
  outputValue2 = map(sensorValue2, 0, 1023, 0, 255); 
  if(outputValue2 < 11){
  analogWrite(analogOutPin3, 0);analogWrite(analogOutPin4, 255);}
  if(outputValue2 < 100 && outputValue2 > 10){
    wait3(outputValue2, 7, 8);
  }
  if(outputValue2 > 100){
    if(outputValue2 <156){
    analogWrite(analogOutPin3, 0);
    analogWrite(analogOutPin4, 0);
    }
    
    if(outputValue2 > 252){
    analogWrite(analogOutPin3, 255);
    analogWrite(analogOutPin4, 0);
    }  
    if(outputValue2 > 155 && outputValue2 < 253){
      wait4(outputValue2, 8, 7);
    }
  }
  Serial.print("  outputValue1= ");
  Serial.print(outputValue1);
  //Serial.print("  pin1state2= ");
  //Serial.print(pin1state2);
  Serial.print("\t timediff = ");
  Serial.println((currentMillis - previousMillis));  

  delay(2);
}
