


void setup() {
   size(512, 512);
   
}

void draw() {

int squareSize = 32;
  int x = 0;
int y = height - squareSize;
  rectMode(CORNERS);
    while (x < width){

    fill (100);
    stroke(255);
    rect(x, x, x + squareSize, x + squareSize);
    rect(x, y, x + squareSize, y + squareSize);
    x += squareSize;
    y -= squareSize;
}
}
