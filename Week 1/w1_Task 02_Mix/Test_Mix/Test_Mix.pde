/*
 * 
 * by Alfredo Delfino
 * Updated 2016
 * Copyright (c)
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase your drawing and start with a blank screen
 * 
 */

float x = width/2;
float x1 = width;
float x2 = width;
float x3 = width;
float x4 = width;

float y = height/2;
float y1 = height;
float y2 = height;
float y3 = height;
float y4 = height;
float d = width * 5;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {



  // right arc
  noFill();
  stroke(#FF0000);
  strokeWeight(5);
  arc(500, 300, d, d, 0, PI, OPEN);

  // left arc
  noFill();
  stroke(#006CFF);
  strokeWeight(5);
  arc(0, 300, d, d, 0, PI, OPEN);

  // center arc
  fill(#FFF700);
  ;
  noStroke();
  strokeWeight(2);
  arc(250, -150, d, d, 0, PI, OPEN);
  



  // quad
  noFill();
  stroke(#ED00FF);
  strokeWeight(2);
  quad(50, 300, 100, 250, 50, 200, 0, 250);

  noFill();
  stroke(#ED00FF);
  strokeWeight(2);
  quad(250, 300, 300, 250, 250, 200, 200, 250);

  strokeWeight(1);
  line(0, 250, 200, 250);
  line(50, 300, 250, 300);
  line(50, 200, 250, 200);










  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("image.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}