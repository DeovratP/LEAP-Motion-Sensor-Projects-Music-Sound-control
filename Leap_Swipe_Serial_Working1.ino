int serialInput = 0;
const int ledPin1 = 11;  //+
const int ledPin2 = 12;
const int ledPin3 = 6; //+
const int ledPin4 = 7;

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
  // initialize the ledPin as an output:
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
}

void loop() {
    // check if data has been sent from the computer:
  if (Serial.available()) {
    // read the most recent byte (which will be from 0 to 255):
    serialInput = Serial.read();   
    // if our position has changed
    
    analogWrite(ledPin1, serialInput);
    digitalWrite(ledPin2,LOW); 
    analogWrite(ledPin3, 220 - serialInput);
    digitalWrite(ledPin4,LOW);
  }
  
//    digitalWrite(ledPin1, LOW);
//    digitalWrite(ledPin2,LOW); 
//    digitalWrite(ledPin3, LOW);
//    digitalWrite(ledPin4,LOW);

}








