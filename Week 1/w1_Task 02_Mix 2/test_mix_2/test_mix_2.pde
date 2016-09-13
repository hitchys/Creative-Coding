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

float angle;
float inc;
float counterClockwiseBranchX, counterClockwiseBranchY;
float clockwiseBranchX, clockwiseBranchY;

void setup() {
  size(800, 600);
  background(9);
  rectMode(CENTER);

  angle = 0;
  inc = 8;
}

void draw() {
  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  if (mousePressed) {
    // draw a rectangle with a small random variation in size
    stroke(170); // set the stroke colour to a light grey
    fill(#FAFF00, 150); // set the fill colour to black with transparency
    rect(mouseX, mouseY, random(2), random(2));
  }

  
  

  // right arc
  fill(#0325FC);
  stroke(#ED00FF);
  strokeWeight(2);
  arc(550, 250, d, d, 0, PI, OPEN);

  // left arc
  noFill();
  stroke(#ED00FF);
  strokeWeight(2);
  arc(-50, 250, d, d, 0, PI, OPEN);

  // center arc
  fill(#ED00FF);
  arc(250, 250, 100, 100, PI+PI/2, PI+PI); 
  arc(250, 250, 100, 100, 3.142, 4.713);


noStroke();
  fill(255);
  arc(565, 130, 80, 80, PI+PI/2, PI+PI);
  arc(565, 130, 80, 80, 3.142, 4.713);
  
  fill(255); 
  arc(655, 90, 80, 80, PI+PI/2, PI+PI); 
  arc(655, 90, 80, 80, 3.142, 4.713);
  
  fill(255); 
  arc(745, 50, 80, 80, PI+PI/2, PI+PI); 
  arc(745, 50, 80, 80, 3.142, 4.713);


  // Quad center
  fill(#FAFF00,200);
  stroke(#ED00FF);
  strokeWeight(2);
  quad(250, 300, 300, 250, 250, 200, 200, 250);

  // Ellipse right side
 // noFill();
  //stroke(255);
  //strokeWeight(10);
  //ellipse(-20, 240, 250, 250);
  //strokeWeight(6);
  //ellipse(-20, 240, 200, 200);
  //strokeWeight(3);
  //ellipse(-20, 240, 150, 150);

  // Ellipse center
  //fill(#F3FC03, 1);
  //strokeWeight(1);
  //ellipse(-20, 240, 100, 100);
 
 
  // rect
  fill(255);
  noStroke();
  //strokeWeight(2);
  rect(565, 170, 80, 40);

  // rect
  fill(255);
  noStroke();
  //strokeWeight(2);
  rect(655, 150, 80, 80);

  // rect
  fill(255);
  noStroke();
  //strokeWeight(2);
  rect(745, 130, 80, 120);

  // rect 1
  fill(#FA0000, 30);
  noStroke();
  strokeWeight(2);
  rect(350, 250, 20, 100);

  // rect 2
  fill(#FA0000, 50);
  noStroke();
  strokeWeight(2);
  rect(400, 250, 40, 150);

  // rect 3
  fill(#FA0000, 80);
  noStroke();
  strokeWeight(2);
  rect(480, 250, 60, 200);
  
  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */









  strokeWeight(1);

  inc = map(mouseX, 0, width, 1, 8);
  angle = angle + inc;
  if (mousePressed) {

    stroke(random(1, 256), random(1, 256), random(1, 256)); 
    fill(random(1, 256), random(1, 256), random(1, 256));

    rect(mouseX, mouseY, 1, 1);

    line(mouseX, mouseY, pmouseX, pmouseY); // pmouse is the mouse position at the previous frame

    // oscillate the radius over time
    float radius = random(1, 5) * abs( sin(frameCount) );

    //Counter-clockwise branch
    //Look at https://commons.wikimedia.org/wiki/File:Circle_cos_sin.gif to remind yourself on the use of sin and cos
    counterClockwiseBranchX = mouseX + radius * cos( angle);
    counterClockwiseBranchY = mouseY + radius * sin( angle);

    //clockwise branch
    clockwiseBranchX = mouseX + radius * cos( -angle);
    clockwiseBranchY = mouseY + radius * sin( -angle);

    //set the brush to translucent white
    stroke(random(1, 256), random(1, 256), random(1, 256));

    // draw branches
    line(mouseX, mouseY, clockwiseBranchX, clockwiseBranchY);
    line(mouseX, mouseY, counterClockwiseBranchX, counterClockwiseBranchY);

    //draw randomly sized circles at the end of each branch
    float circleSize = random(3);
    ellipse(clockwiseBranchX, clockwiseBranchY, circleSize, circleSize);
    ellipse(counterClockwiseBranchX, counterClockwiseBranchY, circleSize, circleSize);
  }





  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("Test Mix 4.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}