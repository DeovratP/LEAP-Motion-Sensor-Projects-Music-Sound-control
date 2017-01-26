import de.voidplus.leapmotion.*; //Leap Motion Library
import processing.serial.*; //Serial Library
import ddf.minim.*; //Minim Library
 
LeapMotion leap;
AudioPlayer player;
Minim minim;
int newPosition = 0;
float newGrab = 0;
float newPinch = 0;
int volume = 0;

void setup()
{
  size(1200, 720);
  background(255);
  leap = new LeapMotion(this);
  newPosition = 0;
  minim = new Minim(this);
  newPosition = constrain(newPosition, 1 , 500);
  
  // load a file
  player = minim.loadFile("vibraphon.aiff", 2048);
  
  // play the file
  player.play();
  player.loop();
  player.unmute();
}
 
void draw() {
  background(255);
  
  for (Hand hand : leap.getHands()) 
  {
    hand.draw();
    
    // Volume Code block
    newPosition = (int) map(hand.getPosition().x, 0, 1500, 0, 255);
    println("Position", newPosition);
    if (newPosition>0)
    {
      float volume = int(map((newPosition),0,100,-50,50));
      player.setGain(volume); 
      println(volume);
    }
    // End of Volume Segment
    
    // Grab action to control the Pause and Play options
    newGrab = (float) map(hand.getGrabStrength(), 0.0, 1.0, 0, 255);
    println("Grab", newGrab);
    
    if (newGrab < 130)
    {
      player.play(); 
      println("Grab Open",newGrab);
    }
    if (newGrab > 130 && player.isPlaying())
    {
      player.pause();
      println("Grabbed",newGrab);
    }
    // End of Grab Segment
    
    // Pinch action to control the Mute and Unmute options
    newPinch = (int) map(hand.getPinchStrength(), 0.0, 1.0, 0, 255);
    println("Pinch", newPinch);
    if (newPinch < 170)
    {
      player.unmute(); 
      println("Pinch Open",newPinch);
    }
    if (newPinch > 170 && player.isPlaying())
    {
      player.mute();
      println("Pinched",newPinch);
    }
    // End of Pinch segment
    
  }
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  super.stop();
}