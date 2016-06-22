//This program can be used and abused by anyone for any purpose. 
//Chris Miller

//minim stuff
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//globals
PShape trebleClef;
float noteX, noteY;
float noteMover;
//minim globals
Minim minim;
AudioOutput out;
Oscil wave;
Delay myDelay;
float freq;

float wide;
float high;

float noteProgressor;
float growerShrinker;



void setup() {

  size(450, 600);
  background(20,0,120);

  //setting off the minim
  minim = new Minim(this);
  out = minim.getLineOut();
  //setting up the wave
  wave = new Oscil(freq, 1f, Waves.SINE);
  //announcing/adding in the delay
  myDelay = new Delay(.1, .04, false, false);
  wave.patch(myDelay).patch(out);

  noteX = 25;
  noteY = 120;

  noteProgressor = (width-40)/13;

  high = 1;
  wide = 1;
}


void draw () {
  
    for (int j = 1; j<6; j++) {
    float y = 100;
    y = y*j;
    //horizontal lines
    for (int i = 0; i<5; i++) {
      float x1 = y+(i*10);
      strokeWeight(i*random(3));
      line(0, x1, width, x1);
    }
  }

  smooth();
  fill(random(200, 255), random(50), random(50, 100));

  growerShrinker = sin(frameCount*.05)*2;
  noteMover = int(noise(frameCount*.001)*3)*5;


  if (frameCount%20==0) {
    //advancing the notes
    noteX = noteX + noteProgressor;
    noteY = noteY + noteMover;

    //playing the music

    //this first unpatch seems to make it so that the notes only play
    //while noteY is in their range... which is OK)
    wave.unpatch(out);
    wave.patch(myDelay).patch(out);

    //each note needs each of its own coordinates for each staff
    //C
    if (noteY == 115 || noteY == 215 || noteY == 315 || noteY == 415 || noteY == 515) {
      wave = new Oscil(523.25, random(1), Waves.SINE);
      wave.patch(out);
    } 
    //D
    if (noteY == 110 || noteY == 210 || noteY == 310 || noteY == 410 || noteY == 510 || noteY == 145 || noteY == 245 || noteY == 345 || noteY == 445 || noteY == 545) {
      wave = new Oscil(587.33, random(.6), Waves.SINE);
      wave.patch(out);
    } 
    //E
    if (noteY == 105 || noteY == 205 || noteY == 305 || noteY == 405 || noteY == 505 || noteY == 140 || noteY == 240 || noteY == 340 || noteY == 440 || noteY == 540) {
      wave = new Oscil(329.63, random(.9), Waves.SINE);
      wave.patch(out);
    } 
    //F
    if (noteY == 100 || noteY == 200 || noteY == 300|| noteY == 400 || noteY == 500 || noteY == 135 || noteY == 235 || noteY == 335 || noteY == 435 || noteY == 535) {
      wave = new Oscil(698.46, random(1), Waves.SINE);
      wave.patch(out);
    }
    //G
    if (noteY == 130 || noteY == 230 || noteY == 330|| noteY == 430 || noteY == 530) {
      wave = new Oscil(392, random(1), Waves.SINE);
      wave.patch(out);
    } 

    //A
    if (noteY == 125 || noteY == 225 || noteY == 325|| noteY == 425 || noteY == 525) {
      wave = new Oscil(440, random(.3), Waves.SINE);
      wave.patch(out);
    } 
    //B
    if (noteY == 120 || noteY == 220 || noteY == 320|| noteY == 420 || noteY == 520) {
      wave = new Oscil(493.88, random(.2), Waves.SINE);
      wave.patch(out);
    } 

    //below is a VERY tedious way of managing real estate,
    //making sure the notes don't wander way off the staff
    if (noteY<105) {
      noteY = 120;
    }

    if (noteY>145&&noteY<165) {
      noteY = 120;
    }
    if (noteY>165&&noteY<195) {
      noteY = 220;
    }

    if (noteY>245&&noteY<270) {
      noteY = 220;
    }

    if (noteY>270&&noteY<295) {
      noteY = 320;
    }

    if (noteY>345&&noteY<370) {
      noteY = 320;
    }

    if (noteY>370&&noteY<395) {
      noteY = 420;
    }

    if (noteY>445&&noteY<470) {
      noteY = 420;
    }

    if (noteY>470&&noteY<495) {
      noteY = 520;
    }

    if (noteY>545) {
      noteY = 120;
    }

    //notes
    noStroke();
    wide = wide*growerShrinker;
    high = high*growerShrinker;
    ellipse(noteX, noteY, wide, high);


    //resetting to next lower staff
    if (noteX>width-70) {
      noteY = noteY+100;
      noteX = 25;
    }
  }
}
