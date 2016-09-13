/*
 *  Week 2. 02 task" Conditions and Branching - Switch"
 *  Updated 2016 by Alfredo Delfino
 *
 *
 */


void setup() {
  size (500,300);
    noStroke();
  colorMode(RGB, 500);
  for (int i = 0; i < 500; i++) {
    for (int j = 0; j < 500; j++) {
      stroke( i, j, 0);
      point(i, j);
    }  
  }
}

void draw() {
  background(0);
  //stroke(255);

  
  for (int i=0; i<width; i+=4) {
    int style = i%3;
    
    switch(style) {
      case 0:
      line(i, 0, i ,100);
      break;
       case 1:
      line(i, 0, i ,200);
      break;
       case 2:
      line(i, 0, i ,300);
      break;
    }
  }
  
        // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("w2_02_01 - Switch.jpg" );
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }
} 