/* 
 * Creative Coding
 * * 
 * Week 2, 06 - Moving Patterns 2
 * * * 
 * Interpretation by Alfredo Delfino
 * * * * 
 * Based on code by Indae Hwang and Jon McCormack
 */
 
 

int frameRateValue; // variable used to store the current frame rate value
int gridSize = 20;
int margin = 0;
float gutter = 0; //distance between each cell
float cellsize; //declare cellsize

float cellsizeSetup; //save cellsize

int colorSwitch = 0;
// https://www.processing.org/discourse/beta/num_1174399976.html
color [] colarray = {
  color(#FF0000,18),
  color(#FF0000,30),
  color(#FF0000,80), 
  color(#FF0000,40),
  color(#FF0000,0),
 
};

void setup() {

  
 
  // make the display window the full size of the screen
  size(displayWidth, displayHeight);
  //size (600, 600);
  
  frameRateValue = 22;
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  background(#0700FF);
  cellsize = ( width - (2 * margin) - gutter * (gridSize - 1) ) / (gridSize - 1); //define cellsize
  cellsizeSetup = cellsize;
}


void draw() {

  background(#0700FF);
  int circleNumber = 0; // counter
  for (int i=0; i<gridSize; i++) {
    for (int j=0; j<gridSize; j++) {
      circleNumber = (i * gridSize) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * j;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
   //saveFrame("###_Art Work.png");
} //end of draw 

// 0000, 0001, 0002 ..., 9999
String getFrameName(int frameNumber){
  int lengthOfNumber = (int)(log(frameNumber)/log(10));
  switch(lengthOfNumber) {
  case 0: 
    return "000"+str(frameNumber);
  case 1: 
    return "00"+str(frameNumber);
  case 2: 
    return "0"+str(frameNumber);
  case 3: 
    return ""+str(frameNumber);
  default:
    return "0000";
  }
  // Linux: This command converts the images to a video  
  // avconv -framerate 10 -i %04d.jpg -b 5000k video.mp4
}


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frameRateValue;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod; // % is modulo operator 
  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);

  strokeWeight(0.5);
  stroke(255, lerp(255, 0, circleAge));
  //fill(lerp(230, 0, circleAge), lerp(160, 0, circleAge));

  switch(colorSwitch) {
  case 0: 
    fill(lerp(500, 0, circleAge), lerp(120, 0, circleAge));
    break;
  case 1:
    fill(random(255), random(255), random(255), lerp(120, 0, circleAge));
    break;
  default:
    fill(colarray[(int)random(colarray.length-1)], lerp(120, 0, circleAge));
    break;
  }

  rect(x-size/2, y-size/2, circleSize, circleSize);
  ellipse(x-size+2, y-size+2, circleSize, circleSize);

}


/*
 *
 * called automatically by Processing when a mouse is pressed
 */
void mousePressed() {

  // right mouseButton  -- increase frameRateValue
  if (mouseButton == RIGHT && frameRateValue < 22) {
    frameRateValue++;
  }

  // left mouseButton -- decrease frameRateValue
  if ( mouseButton == LEFT && frameRateValue >22 ) {
    frameRateValue--;
  }


// print the current value on the screen
  println("Current frame Rate is: " + frameRateValue);
}


// switch the color mode
void mouseWheel() {
  colorSwitch = ++colorSwitch % 4;
}