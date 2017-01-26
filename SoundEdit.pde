/*
This is a sound file player. 
*/


import processing.sound.*;
import de.voidplus.leapmotion.*;

SoundFile soundfile;
LeapMotion leap;
int newPosition = 0;

void setup() {
    size(640,360);
    background(255);
        
        
    leap = new LeapMotion(this);
    //Load a soundfile
    soundfile = new SoundFile(this, "vibraphon.aiff");

    // These methods return useful infos about the file
    println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
    println("SFSamples= " + soundfile.frames() + " samples");
    println("SFDuration= " + soundfile.duration() + " seconds");

    // Play the file in a loop
    soundfile.loop();
}      


void draw() {
  // Map mouseX from 0.25 to 4.0 for playback rate. 1 equals original playback 
  // speed 2 is an octave up 0.5 is an octave down.
 // soundfile.rate(map(mouseX, 0, width, 0.25, 4.0)); 
  
  // Map mouseY from 0.2 to 1.0 for amplitude  
  //soundfile.amp(map(mouseY, 0, width, 0.2, 1.0)); 
 
  // Map mouseY from -1.0 to 1.0 for left to right 
  //soundfile.pan(map(mouseY, 0, width, -1.0, 1.0)); 
  
  background(255);
  
  for (Hand hand : leap.getHands()) {
    hand.draw();
    
    // scale the getPosition value to a range between 0 - 255
    soundfile.amp(map(hand.getPosition().x, 0, width, 0.2, 2.0));
    soundfile.rate(map(hand.getPosition().y, 0, width, 0.25, 4.0));
    
    
    
  
}
}