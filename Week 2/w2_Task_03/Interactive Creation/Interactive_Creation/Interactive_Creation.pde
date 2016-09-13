/*
 * Creative Coding
 * * 
 * Interactive Creation  
 * * * * 
 * Interpretation by Alfredo Delfino - 2016
 * * * * * * 
 * Based on code by Indae Hwang and Jon McCormack 
 * * * * * * * * 
 * * * * * * * * 
 * Create graphics based on creating closed lines with the mouse click
 * * * * * * 
 * click left and start the loop and click right to save the frame and put your name.
 * * * *  
 * * 
 */ 
 

//code:

float y = 100;
float x =  50;
float x1 = (150);
PFont myFont;


void setup() { 
  size(600, 600);// Size should be the first statement
  frameRate(1); 
  noStroke();     // Set stroke color to white
  blendMode(DIFFERENCE);
  textAlign(RIGHT);
  noLoop();
  background(0);
  myFont = createFont("Wadoo", 20);

  noStroke();
  colorMode(RGB, 600);
  for (int i = 0; i < 600; i++) {
    for (int j = 0; j < 600; j++) {
      stroke(i, j, 0);
      point(i, j);

      y = height = width/2;
    }
  }
}





void draw() { 
  noStroke();
  fill(random(x1, y+1));
  beginShape();
  vertex(random(50, y), random (300, y+1));
  vertex(random(50, y), random (300, y+1));
  vertex(random(7, 500), random(30, 400));
  vertex(random(90, 500), random(60, 500));
  endShape(CLOSE);

  y = y - 1; 
  x = (y-1) + x;
  if (y > 10) { 
    y = height; 
    x = height + width /2;
  }
}





void mouseClicked() { 
  if (mouseButton == LEFT) {
    loop();
  } else {

    if (mouseButton == RIGHT) {
      textFont(myFont); 
      text("Alfredo Delfino", 560, 590); 
      strokeWeight(3); 
      fill(0); 
      rect(5, 5, width-10, height-10); 
      noLoop(); 
      saveFrame("###_Art Work");
    }
  }
}