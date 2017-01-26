import de.voidplus.leapmotion.*;
import processing.serial.*; 

Serial myPort;
LeapMotion leap;
int newPosition = 0;



void setup() {
  size(1280, 800, P3D);
  background(255);

  leap = new LeapMotion(this);
  myPort = new Serial(this, Serial.list()[3], 9600);
}

void draw() {
  background(255);
  
  for (Hand hand : leap.getHands()) {
    hand.draw();
    
    // scale the getPosition value to a range between 0 - 255
    newPosition = (int) map(hand.getPosition().x, 0, 1500, 0, 255);
    println("Position", newPosition);
    
    if (newPosition>0)
    
    {
      myPort.write(newPosition);
    }
  }
}