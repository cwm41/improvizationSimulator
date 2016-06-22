//Anyone can use and abuse this code for any purpose, credit for appropriation is appreciated. 
//Chris Miller

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PShape trebleClef;
float noteX, noteY;
float noteMover;

Minim minim;
AudioOutput out;
Oscil wave;

float freq;



void setup() {

  size(450, 600);
  background(255);

  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil(freq, 0.5f, Waves.SINE);

  freq = 0;

  noteX = 25;
  noteY = 120;

  //draw that sweet sweet clef
  trebleClef = loadShape("goodtrebleclef.svg");
  trebleClef.scale(.02);
  shape(trebleClef, 20, 89);

  drawStaff();
  writeText();
}


void draw () {

  smooth();
  fill(0);
  
  noteMover = int(random(-3, 3))*5;

  //arbitrarily sets the speed of the music against the number of frames
  if (frameCount%10==0) {
    //advancing the notes
    noteX = noteX + ((width-40)/13);
    noteY = noteY + noteMover;

    //playing the music

    //this first unpatch seems to make it so that the notes only play
    //while noteY is in their range... which is OK)
    wave.unpatch(out);

    //each note needs each of its own coordinates for each staff
    //C
    if (noteY == 115 || noteY == 215 || noteY == 315 || noteY == 415 || noteY == 515) {
      wave = new Oscil(523.25, 0.5f, Waves.SINE);
      wave.patch(out);
    } 
    //HIGH D
    if (noteY == 110 || noteY == 210 || noteY == 310 || noteY == 410 || noteY == 510) {
      wave = new Oscil(587.33, 0.5f, Waves.SINE);
      wave.patch(out);
    } 
    //LOW D
    if (noteY == 145 || noteY == 245 || noteY == 345 || noteY == 445 || noteY == 545) {
      wave = new Oscil(293.66, 0.5f, Waves.SINE);
      wave.patch(out);
    } 
    //HIGH E
    if (noteY == 105 || noteY == 205 || noteY == 305 || noteY == 405 || noteY == 505) {
      wave = new Oscil(659.25, 0.5f, Waves.SINE);
      wave.patch(out);
    } 
    //LOW E
    if (noteY == 140 || noteY == 240 || noteY == 340 || noteY == 440 || noteY == 540) {
      wave = new Oscil(329.63, 0.5f, Waves.SINE);
      wave.patch(out);
    } 
    //HIGH F
    if (noteY == 100 || noteY == 200 || noteY == 300|| noteY == 400 || noteY == 500) {
      wave = new Oscil(698.46, 0.5f, Waves.SINE);
      wave.patch(out);
    }
    //LOW F
    if (noteY == 135 || noteY == 235 || noteY == 335 || noteY == 435 || noteY == 535) {
      wave = new Oscil(349.23, 0.5f, Waves.SINE);
      wave.patch(out);
    }
    //HIGH G
    if (noteY == 130 || noteY == 230 || noteY == 330|| noteY == 430 || noteY == 530) {
      wave = new Oscil(392, 0.5f, Waves.SINE);
      wave.patch(out);
    } 
    //LOW G
    if (noteY == 95 || noteY == 195 || noteY == 295|| noteY == 395 || noteY == 495) {
      wave = new Oscil(783.99, 0.5f, Waves.SINE);
      wave.patch(out);
    } 
    //A
    if (noteY == 125 || noteY == 225 || noteY == 325|| noteY == 425 || noteY == 525) {
      wave = new Oscil(440, 0.5f, Waves.SINE);
      wave.patch(out);
    } 
    //B
    if (noteY == 120 || noteY == 220 || noteY == 320|| noteY == 420 || noteY == 520) {
      wave = new Oscil(493.88, 0.5f, Waves.SINE);
      wave.patch(out);
    } 

    //below is a VERY tedious way of managing real estate,
    //making sure the notes don't wander way off the staff.
    //Currently re-locates errant notes to a C
    if (noteY<105) {
      noteY = 115;
    }

    if (noteY>145&&noteY<165) {
      noteY = 115;
    }
    if (noteY>165&&noteY<195) {
      noteY = 215;
    }

    if (noteY>245&&noteY<270) {
      noteY = 215;
    }

    if (noteY>270&&noteY<295) {
      noteY = 315;
    }

    if (noteY>345&&noteY<370) {
      noteY = 315;
    }

    if (noteY>370&&noteY<395) {
      noteY = 415;
    }

    if (noteY>445&&noteY<470) {
      noteY = 415;
    }

    if (noteY>470&&noteY<495) {
      noteY = 515;
    }

    //when the note goes off the bottom staff, either at the end of the line
    //or because it went too far down, go ahead and re-set the whole page
    if (noteY>545) {
      noteY = 115;
      fill(255);
      rect(0, 0, width, height);
      drawStaff();
      writeText();
      shape(trebleClef, 20, 89);
    }

    //note and bar
    ellipse(noteX, noteY, 10, 7);
    line(noteX+4, noteY+3, noteX+4, noteY+22);
    //resetting to next lower staff
    if (noteX>width-70) {
      noteY = noteY+100;
      noteX = 25;
    }
  }
}

void drawStaff() {
  fill(0);
  for (int j = 1; j<6; j++) {
    float y = 100;
    y = y*j;
    //vertical lines
    for (int k = 0; k<4; k++) {
      float w = 20;
      w = 20+(k*137);
      line(w, y, w, y+40);
    }
    //horizontal lines
    for (int i = 0; i<5; i++) {
      float x1 = y+(i*10);
      line(20, x1, width-20, x1);
    }
  }
}

void writeText() {
  fill(0);
  String s = "The Computer as a Composition Device";
  text(s, 175, 30, 150, 40);
  String f = "CM + His Dell";
  text(f, 360, 73, 100, 20);
}
