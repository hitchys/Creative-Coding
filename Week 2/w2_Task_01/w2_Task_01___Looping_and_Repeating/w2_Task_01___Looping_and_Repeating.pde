
 /* 
 * Creative Coding
 * * 
 * Week 2, 01 - Looping and Repeating
 * * * 
 * Interpretation by Alfredo Delfino
 * * * * 
 * Based on code by Indae Hwang and Jon McCormack
 */
 
 


void setup() { 
  size(600, 600);
  noStroke();
  colorMode(RGB, 600);
  for (int i = 0; i < 600; i++) {
    for (int j = 0; j < 600; j++) {
      stroke( i, j, 0);
      point(i, j);

      //noLoop();  // only execute the draw function once
      rectMode(CENTER); // set the rectangle drawing mode to specify the rectangle's centre
    }
  }
}


void draw() {

  //  shadow row 1

  fill(0, 0, 255, 10);
  noStroke();
  rect(70, 70, 100, 100);
  rect(187.5, 70, 100, 100);
  rect(305, 70, 100, 100);
  rect(422.5, 70, 100, 100);
  rect(540, 70, 100, 100);

  // row 1

  fill(#00D7FF);
  noStroke();
  rect(65, 65, 100, 100);
  rect(182.5, 65, 100, 100);
  rect(300, 65, 100, 100);
  rect(417.5, 65, 100, 100);
  rect(535, 65, 100, 100);

  //  shadow row 2

  fill(255, 0, 255, 10);
  noStroke();
  rect(70, 187.5, 100, 100);
  rect(187.5, 187.5, 100, 100);
  rect(305, 187.5, 100, 100);
  rect(422.5, 187.5, 100, 100);
  rect(540, 187.5, 100, 100);

  // row 2

  fill(#81BAC4);
  noStroke();
  rect(65, 182.5, 100, 100);
  rect(182.5, 182.5, 100, 100);
  rect(300, 182.5, 100, 100);
  rect(417.5, 182.5, 100, 100);
  rect(535, 182.5, 100, 100);

  //  shadow row 3

  fill(255, 0, 255, 10);
  noStroke();
  rect(70, 305, 100, 100);
  rect(187.5, 305, 100, 100);
  rect(305, 305, 100, 100);
  rect(422.5, 305, 100, 100);
  rect(540, 305, 100, 100);

  // row 3

  fill(#00D7FF);
  noStroke();
  rect(65, 300, 100, 100);
  rect(182.5, 300, 100, 100);
  rect(300, 300, 100, 100);
  rect(417.5, 300, 100, 100);
  rect(535, 300, 100, 100);

  //  shadow row 4

  fill(255, 0, 255, 10);
  noStroke();
  rect(70, 422.5, 100, 100);
  rect(187.5, 422.5, 100, 100);
  rect(305, 422.5, 100, 100);
  rect(422.5, 422.5, 100, 100);
  rect(540, 422.5, 100, 100);

  // row 4

  fill(#80EABF);
  noStroke();
  rect(65, 417.5, 100, 100);
  rect(182.5, 417.5, 100, 100);
  rect(300, 417.5, 100, 100);
  rect(417.5, 417.5, 100, 100);
  rect(535, 417.5, 100, 100);

  //  shadow row 5

  fill(255, 0, 255, 10);
  noStroke();
  rect(70, 540, 100, 100);
  rect(187.5, 540, 100, 100);
  rect(305, 540, 100, 100);
  rect(422.5, 540, 100, 100);
  rect(540, 540, 100, 100);

  // row 5

  fill(#00D7FF);
  noStroke();
  rect(65, 535, 100, 100);
  rect(182.5, 535, 100, 100);
  rect(300, 535, 100, 100);
  rect(417.5, 535, 100, 100);
  rect(535, 535, 100, 100);





  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("w2_01_1_25_Squares.jpg" );
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }
}