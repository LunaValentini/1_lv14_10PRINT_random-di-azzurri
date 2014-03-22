// This code was modified from 10Print by Casey Reas, for school projects
//  by Università di San Marino. Non commercial use.

import processing.pdf.*;
import java.util.Calendar;

int w = 16;
int h = 16;
int index = 0;

boolean savePDF = false;


void setup() {
  size(640, 384);
  colorMode(HSB, 360, 100, 100); // cambiato il color mode
  background(175, 0, 0); //sfondo nero
  strokeWeight(3);
  stroke(224);
  smooth();
}

void draw() {
  int x1= w*index;
  int x2 = x1 + w;
  int y1 = h*23; 
  int y2 = h*24; // 384:16=24 > multipli di 16 fino al bordo
  float c= random(150,200); //dichiarato variabile c colore random in un range tra 150 e 200

  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  if (random(2) < 1) {
    line (x2, y1, x1, y2);
    stroke(c, 100, 100); // tratto è: H random e S e B fissi a 100
  } 
  else {
    line (x1, y1, x2, y2);
    stroke(c, 100, 100);
  }

  index++; // successiva righetta
  if (index == width/w) { //quando ho riempito riga sposta in su e torna all'inizio
    PImage p = get (0, h, width, h*23);  //??? capire meglio
    background(175, 0, 0);
    set (0, 0, p);
    index=0;
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyPressed() {1_lv14_10PRINT_random di azzurri
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;
}


String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

