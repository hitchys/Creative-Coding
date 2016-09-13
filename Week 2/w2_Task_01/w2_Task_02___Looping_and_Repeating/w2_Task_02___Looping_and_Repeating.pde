
 
 /* 
 * Creative Coding
 * * 
 * Week 2, 03 - 25 Squuares
 * * * 
 * Interpretation by Alfredo Delfino
 * * * * 
 * Based on code by Indae Hwang and Jon McCormack
 */
 
 

void setup() {
  randomSeed(hour() + minute() + second() + millis());
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1); // set the frame rate to 1 draw() call per second
}


void draw() {

  background(0); // clear the screen to grey


  int grid = (int)(5); // selects a random cellsize each frame)
  int gap = (int) random(5, 50); // select a random gap between each square)

  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (grid + 1) * gap ) / (float)grid;

  // print out the size of each square
  println("cellsize = " + cellsize);

  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;

  for (int i=0; i<grid; i++) {
    for (int j=0; j<grid; j++) {

      fill(80, 140); // shadow
      rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);
      float coppyX=random(-10, 10);
      float coppyY=random(-10, 10);

      fill(random(0, 30), random(0, 250), random(200, 255)); // rectangle
      rect(gap * (i+1) + cellsize * i + coppyX, gap * (j+1) + cellsize * j + coppyY, cellsize, cellsize);

      // save drawing when you press keyboard 's'
      if (keyPressed == true && key=='s') {
        // saveFrame("25squares.jpg");

        // Saves each frame as line-000001.png, line-000002.png, etc.
        saveFrame("line-######.png");
      }
    }
  }
}