import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.spi.*; 
import ddf.minim.signals.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.ugens.*; 
import ddf.minim.effects.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CubeMarsu extends PApplet {

/*
 * This is basecode for 2D demo development.
 * TODO: write doc
 */







// All these you can change!
// If you want to change the screen size, modify these,
// but keep width > height so my buggy scaling code works :P
int CANVAS_WIDTH = 800;
int CANVAS_HEIGHT = 600;

// You can skip backwards/forwards in you demo by using the 
// arrow keys; this controls how many milliseconds you skip
// at one push.
int SONG_SKIP_MILLISECONDS = 2000;

// Don't change
float ASPECT_RATIO = (float)CANVAS_WIDTH/CANVAS_HEIGHT;

// Audio
Minim minim;
AudioPlayer song;

// Syncdata
int[] exampleSync = {2229, 3227, 4202, 5201, 6199, 7151, 8219, 9195, 10216, 11192, 12213, 13188, 14187, 15209};

/*
 * Sets up audio playing: call this last in setup()
 * so that the song doesn't start to play too early
 */
public void setupAudio() {
  minim = new Minim(this);
  song = minim.loadFile("soundtrack.mp3");
  // Uncomment this if you want the demo to start instantly
  song.play();
}

public void setup() {
  // Set up the drawing area size and renderer (usually P2D or P3D,
  // respectively for accelerated 2D/3D graphics).
  size(CANVAS_WIDTH, CANVAS_HEIGHT, P3D);
  
  // Drawing options that don't change, modify as you wish
 //  noStroke();
  frameRate(30);
  fill(255);
  smooth();
  stroke(255);
  setupAudio();
}

public void setMatrix()
{
  resetMatrix();
  float scaleWidth = (float)CANVAS_WIDTH / 800.0f;
  float scaleHeight = (float)CANVAS_HEIGHT / 600.0f;
  float scale_;
  if (scaleWidth < scaleHeight)
    scale_ = scaleWidth;
  else
    scale_ = scaleHeight;
  print(scale_);

  scale(scale_, scale_, scale_);
  translate(-40,-40,-500);
}

public void draw() {
  clear();
  setMatrix();
  drawBackground(song.position());
  setMatrix();
  drawMarsu(song.position());
}

public void keyPressed() {
  if (key == CODED) {
    // Left/right arrow keys: seek song
    if (keyCode == LEFT) {
      song.skip(-SONG_SKIP_MILLISECONDS); 
    } else if (keyCode == RIGHT) {
      song.skip(SONG_SKIP_MILLISECONDS);
    }
  }
  // Space bar: play/payse
  else if (key == ' ') {
    if (song.isPlaying())
      song.pause();
    else
      song.play();
  }
  // Enter: spit out the current position
  else if (key == ENTER) {
    print(song.position() + ", "); 
  }
}
public void drawBackground(int ms)
{
  noFill();
  stroke(255);
  box(60);
}

public void drawMarsu(int ms)
{
  noFill();
  stroke(255);
  box(80);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CubeMarsu" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
