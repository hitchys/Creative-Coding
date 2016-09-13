/* 
 * Creative Coding
 * * 
 * Week 2, 05 - Animation Patterns
 * * * 
 * Interpretation by Alfredo Delfino
 * * * * 
 * Based on code by Indae Hwang and Jon McCormack
 */

int frameNumber = 0; // counter

int frameRateValue; // variable used to store the current frame rate value
int gridSize = 20; // number of circles in each column and row
int margin = 0; // margin in each circle cell
float gutter = 0; //distance between each cell
float cellsize; // declaring the variable here lets us access it in other functions in our program

void setup() {
  size(400, 400);

  frameRateValue =11;
  frameRate(frameRateValue);
  rectMode(CENTER);
  background(0);
  cellsize = ( width - (2 * margin) - gutter * (gridSize - 1) ) / (gridSize - 1); //defining the value of the cellsize
}

void draw() {

  background(random(233,70),random(0,120),random(0,20));
  
  int circleNumber = 0; // counter
  for (int i=0; i<gridSize; i++) {
    for (int j=0; j<gridSize; j++) {
      circleNumber = (i * gridSize) + j; // different way to calculate the circle number from w2_04

      float centerpointX = margin + cellsize * j + gutter * j;
      float centerpointY = margin + cellsize * i + gutter * i;
      movingCircle(centerpointX, centerpointY, cellsize, circleNumber);
    }
  }
 saveFrame(getFrameName(frameNumber++) + ".jpg");
}//end of draw 

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

void movingCircle(float centerpointX, float centerpointY, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the angle of rotation for each hand is affected by the frameRate and angle;  
  float endpointX = centerpointX + (size / 2) * sin(PI / frameRateValue * finalAngle);
  float endpointY = centerpointY + (size / 2) * cos(PI / frameRateValue * finalAngle);

  noStroke();
  fill(#000AF5,150);
  rect(endpointX, endpointY, size+5, size+5);
  rect(endpointX, endpointY, 1, size+5);
  noFill();
  stroke(0);
  line(centerpointX, centerpointY, endpointX, endpointY);
}

/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frameRateValue
  if (keyCode == RIGHT && frameRateValue < 11) {
    frameRateValue++;
  }

  // left arrow -- decrease frameRateValue
  if ( keyCode == LEFT && frameRateValue > 11) {
    frameRateValue--;
  }

  // set the frameRate and print current value on the screen
  frameRate(frameRateValue);
  println("Current frame Rate is: " + frameRateValue);
  
// Saves each frame as line-000001.png, line-000002.png, etc. 
if (keyPressed == true && key == 's') { 
saveFrame("line-######.png"); 
  
}
}