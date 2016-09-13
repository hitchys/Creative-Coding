/*
 *  Week 2. 02 tanks " Conditions and Branching - if"
 *  Updated 2016 by Alfredo Delfino
 *
 *
 */

void setup() {
  size( 500, 300);
    noStroke();
  colorMode(RGB, 600);
  for (int i = 0; i < 600; i++) {
    for (int j = 0; j < 600; j++) {
      stroke( i, j, 0);
      point(i, j);
    }
  }
}
void draw() {
  //background(0);
  
  stroke(255);
  
  for (int i=0; i<width; i+=4) {
    if (i%3 == 0) {
      line(i, 0, i, 100);
      stroke(#FF0808);
    }
    else if (i%3 == 1) {
      line(i, 0, i, 200);
      stroke(#FFF703);
    }
    else if (i%3 == 2) {
      line(i, 0, i, 300);
      stroke(#0354FF);
    }
  }

      // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("w2_01.01 - if.jpg" );
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }
} 