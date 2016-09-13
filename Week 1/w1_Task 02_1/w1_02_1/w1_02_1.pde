/* 
 * Creative Coding
 * * 
 * Week 1, 01 - Draw your name - part 2
 * * * 
 * Interpretation by Alfredo Delfino
 * * * * 
 * Based on code by Indae Hwang and Jon McCormack
 */

// variables for the angle (in radians) and increment 
float angle;
float inc;
float counterClockwiseBranchX, counterClockwiseBranchY;
float clockwiseBranchX, clockwiseBranchY;

void setup() {
  size(500, 500);
  background(0);
  rectMode(CENTER);  // rectangles drawn from the centre

  // initialise angle and inc to 0
  angle = 0;
  inc = 0;
  
}


void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  // map the mouse x position to the range (0.01, 0.08)
  inc = map(mouseX, 0, width, 0.01, 0.08);

  // incremment the current angle
  angle = angle + inc;

  if (mousePressed) {

    stroke(random(1,256),random(1,256),random(1,256)); 
    fill(random(1,256),random(1,256),random(1,256));

    rect(mouseX, mouseY, 2, 2);

    line(mouseX, mouseY, pmouseX, pmouseY); // pmouse is the mouse position at the previous frame

    // oscillate the radius over time
    float radius = random(1,256) * abs( sin(frameCount) );
    
    //Counter-clockwise branch
    //Look at https://commons.wikimedia.org/wiki/File:Circle_cos_sin.gif to remind yourself on the use of sin and cos
    counterClockwiseBranchX = mouseX + radius * cos( angle);
    counterClockwiseBranchY = mouseY + radius * sin( angle);
    
    //clockwise branch
    clockwiseBranchX = mouseX + radius * cos( -angle);
    clockwiseBranchY = mouseY + radius * sin( -angle);
    
    //set the brush to translucent white
    stroke(random(1,256),random(1,256),random(1,256));
    
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
    saveFrame("Alfredo w1=02.1.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}
