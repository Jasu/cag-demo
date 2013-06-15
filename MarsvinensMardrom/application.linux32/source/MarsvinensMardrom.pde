/*
 * This is basecode for 2D demo development.
 * TODO: write doc
 */
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// All these you can change!
// If you want to change the screen size, modify these,
// but keep width > height so my buggy scaling code works :P
int CANVAS_WIDTH = 1280;
int CANVAS_HEIGHT = 720;

int currentEffect = 0;
int beatCounter = 0;
Boolean isBeat = false;

BeatDetect beatDetector = new BeatDetect();


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
int[] kello = {2347, 4343, 6255, 8344, 10341, 12245, /*14442*/};
//int[] asdf = {16637, 17240, 17426, 17705, 19808, 17741, 18112, 18298, 18484, 18623, 19118, 19304, 19489, 19738, 19831, 20016, 20202, 21170, 21355, 21541, 21727, 21959, 22238, 22424, 22609, 23352, 23538, 23677, 24049, 24235};

/*
 * Sets up audio playing: call this last in setup()
 * so that the song doesn't start to play too early
 */
void setupAudio() {
  minim = new Minim(this);
  song = minim.loadFile("asdf.mp3", 2048);
  // Uncomment this if you want the demo to start instantly
  song.play();
  beatDetector = new BeatDetect();
}

void setup() {
  // Set up the drawing area size and renderer (usually P2D or P3D,
  // respectively for accelerated 2D/3D graphics).
  size(CANVAS_WIDTH, CANVAS_HEIGHT, P3D);
  
  // Drawing options that don't change, modify as you wish
  noStroke();
  frameRate(30);
  fill(255);
  smooth();
  //stroke(255);
  setupAudio();
  setupBackground();
  setupMarsu();
  setupSubdivisionEffect();
  textureMode(NORMAL);
}

void setMatrix()
{
  resetMatrix();
  float scaleWidth = (float)CANVAS_WIDTH / 800.0;
  float scaleHeight = (float)CANVAS_HEIGHT / 600.0;
  float scale_;
  if (scaleWidth < scaleHeight)
    scale_ = scaleWidth;
  else
    scale_ = scaleHeight;
  scale(scale_, -scale_, scale_);
  translate(-40,-40,-500);
}

void draw() {
  if (!song.isPlaying())
    exit();
  clear();
  pointLight(255, 255, 255, 400, 300, 0);
  ambientLight(30, 30, 30);
  beatDetector.detect(song.mix);

  float pos = song.position();

  isBeat = false;
  if (beatDetector.isOnset()) { if (beatCounter == 0) isBeat = true; beatCounter += 3; } else beatCounter = 0;
  //if (isBeat) currentEffect ^= 1;
  
  if (currentEffect == 0 && pos > 8000)
  {
    currentEffect = 2;
  }

  if (currentEffect == 2 && pos > 16438)
  {
    currentEffect = 1;
  }

  if (currentEffect == 1 && pos > 24000)
  {
    currentEffect = 3;
  }

  if (currentEffect == 3 && pos > 34000)
  {
    currentEffect = 4;
  }
  if (currentEffect == 4 && pos > 46500)
  {
    currentEffect = 1;
  }

  switch (currentEffect)
  {
    case 0:
      setMatrix();
      drawSky(song.position());
      setMatrix();
      drawTitleAndCredits(song.position());
      break;
      
    case 1:
      setMatrix();
      drawSky(song.position());
      setMatrix();
      drawMarsu(song.position());
      break;
      
    case 2:
      setMatrix();
      drawOrangeWall(song.position());
      setMatrix();
      drawCloud(song.position());
      break;
    
    case 3:
      setMatrix();
      drawPurpleLavaSky(song.position());
      setMatrix();
      drawTree(song.position());
      break;

    case 4:
      setMatrix();
      drawSubdivisionEffect(song.position());
      break;
  }
  if (pos > 46500)
  {
    int  alpha = ((int)pos - 46500) *255 / 1000 ;
    if (alpha > 255) alpha = 255;

    fill(0, 0, 0, alpha);
    //rect(-1500, -1500, 3000, 3000);
  }
}

void keyPressed() {
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
