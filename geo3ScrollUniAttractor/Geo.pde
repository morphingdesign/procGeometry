// Class for folder construction
class Geo {

  // Maintain a low number of pts
  PVector[] pos = new PVector[60000];

  float x, y, z, xBegin, yBegin, zBegin, dx, dy, dz, a, b, c, d, e, f;

  float dir;
  float angleStart = 0;
  float pscale = 0;
  int optionSet;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  Geo(int option, float xOne, float yOne, float zOne) {

    this.optionSet = option;
    this.xBegin = xOne;
    this.yBegin = yOne;
    this.zBegin = zOne;

    pushMatrix();
    translate(width/2, height/2, 800);
    pos[0] = new PVector(xBegin, yBegin, zBegin);
    for (int i=1; i < pos.length; i++) {
      float xSet = x;
      float ySet = y;
      float zSet = z;
      pos[i] = new PVector(xSet, ySet, zSet);
      println("point[0]: (" + pos[0].x + ", " + pos[0].y + ", " + pos[0].z + ")");
    }
    popMatrix();
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods

  // *******************************************************
  // Draw the geo

  void draw() {
    stroke(whiteSolid);
    strokeWeight(1);

    // Controls for pattern definition
    // a = map(mouseX, 0, width, 0.15, 0.95);
    a = 40.0;
    //a = map(mouseY, 0, height, 30, 50);  // Change in size and density
    c = 0.833;
    //c = map(mouseY, 0, height, 0.5, 1.0);  // Similar to density of pts; no change in overall shape
    d = 0.5;
    //d = map(mouseY, 0, height, 0.1, 1.0);
    e = 0.65;
    //e = map(mouseY, 0, height, 0.5, 0.75);
    f = 20.0;
    //f = map(mouseY, 0, height, 10, 30);
    float multiplier = 0.001;
    //float multiplier = map(mouseY, 0, height, 0.0005, 0.001);

    pushMatrix();
    translate(width/2, height/2, 800);
    rotateX(frameCount * animSpeed);
    rotateY(frameCount * animSpeed);
    rotateZ(frameCount * animSpeed);
    for (counter=1; counter < pos.length; counter++) {

      dx = (a * (pos[counter - 1].y - pos[counter - 1].x) + ( d * pos[counter - 1].x * pos[counter - 1].z));  
      dy = (f * pos[counter - 1].y - pos[counter - 1].x * pos[counter - 1].z);
      dz = (c * pos[counter - 1].z + pos[counter - 1].x * pos[counter - 1].y - e * pos[counter - 1].x * pos[counter - 1].x);

      pos[counter].x = pos[counter - 1].x + dx * multiplier;
      pos[counter].y = pos[counter - 1].y + dy * multiplier;
      pos[counter].z = pos[counter - 1].z + dz * multiplier;
      point(pos[counter].x, pos[counter].y, pos[counter].z);
      //println("point[" + counter + "]: (" + pos[counter].x + ", " + pos[counter].y + ", " + pos[counter].z + ")");
    }

    popMatrix();
  }
}
