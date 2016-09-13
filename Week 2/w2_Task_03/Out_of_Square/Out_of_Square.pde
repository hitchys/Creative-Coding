/* 
 * Creative Coding
 * * 
 * Vera Molnar – 25 Squares
 * * * 
 * Interpretation by Alfredo Delfino
 * * * * 
 * Based on code by Indae Hwang and Jon McCormack
 */



void setup() {
  size(600, 600);
  noStroke();
  rectMode(CORNER);
  frameRate(1);  // set the frame rate to 1 draw() call per second
}

void draw() {
  randomSeed(hour() + minute() + second() + millis());
  noStroke();
  colorMode(HSB, 600);
  for (int i = 0; i < 600; i++) {
    for (int j = 0; j < 600; j++) {
      stroke(i, j, 600);
      point(i, j);
    }
  }
  // background(180); // clear the screen to grey

  int gap = (int)random(3, 15); // unlike in w2_03 sketch, gap is always same size here.

  // calculate the size of each square for the given number of squares and gap between them
  // this will always be the same number. I could have just given it a specific number, but left the calculation just to try different gap sizes.
  float cellsize = ( width - (5 + 1) * gap ) / 5; // if you do the math, this equals to 108.

  int blueCount = 0; // i want no more than 5 red squares. this declares the variable which will keep track of how many red squares there have been randomly generated so far.

  for (int i=0; i<5; i++) { // col
    for (int j=0; j<5; j++) { // row

      // To create the red squares, it starts by gnerating a random number between 0 and 5 which will be used to determine whether the square being created should be red or not.
      int blue = (int) random(0, 5);

      // Only when the random number "red" happens to be 0, the square will be red. And this will happen only if there are less than 5 red squares so far.
      if (blue == 0 && blueCount < 5) {
        noStroke();
        fill(#FF1A00, 210); // blue color
        blueCount++; // after each time that a red square is created (determined by the random number being 0), the counter which keeps track of how many red squares have been created so far, is increased by 1.
      } else {
        noStroke();
        fill(#000EFF, 210); // if the randomly generated number is not 0, or if there are 5 red squares already, then the next square to be generated will be brown.
      }

      rect( gap * (i+1) + cellsize * i + (int) random(-15, 15), // X position. the random number is what makes the squares keep moving slightly left to right.
        gap * (j+1) + cellsize * j + (int) random(-15, 15), // Y position. the random number is what makes the squares keep moving slightly up and down.
        cellsize, 
        cellsize);
        
        // save the frames
        saveFrame("####.jpg"); // or ".gif
        
    }
  }
} //end of draw