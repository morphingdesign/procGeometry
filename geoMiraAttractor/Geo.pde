// Class for folder construction
class Geo {

  // Maintain a low number of pts
  PVector[] pos = new PVector[10000];
  
  float x, y, xBegin, yBegin, z, a, b;
  
  float dir;
  float iteration;
  boolean collision = false;
  float growth = 0;
  float growthIncrease = 0.1;
  int counter = 0;
  float angleStart = 0;
  float pscale = 0;
  int optionSet;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  Geo(int option, float xOne, float yOne, float z, float a, float b){
      
      this.optionSet = option;
      this.xBegin = xOne;
      this.yBegin = yOne;
      this.z = z;
      this.a = a;
      this.b = b;

      pushMatrix();
      translate(width/2, height/2);
      pos[0] = new PVector(xBegin, yBegin);
      for(int i=1; i < pos.length; i++){

            float xSet = x;
            float ySet = y;
            pos[i] = new PVector(xSet, ySet);
      }
      popMatrix();
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Draw the geo
  
  void draw(){
      stroke(whiteSolid);
      strokeWeight(1);
      
      // Controls for pattern definition
      a = map(mouseX, 0, width, 0.15, 0.95);
      b = map(mouseY, 0, height, 0.9, 0.99);
      float multiplier = map(mouseY, 0, height, 1.05, 1.01);

      pushMatrix();
      translate(width/2, height/2);
      
      for(counter=1; counter < pos.length; counter++){
            
            // Use last pt's x-value in F(x) equation for new x
            float fx = a * pos[counter - 1].x + ((2 * (1 - a) * pos[counter - 1].x * pos[counter - 1].x) / (1 + pos[counter - 1].x * pos[counter - 1].x)); 
            x = ((b * pos[counter - 1].y) + fx);                    // Use the previous point's y and latest fx in new x
            fx = a * x + ((2 * (1 - a) * x * x) / (1 + x * x));     // Use the current x in F(x) equation for use in new y
            y = (-pos[counter - 1].x + fx);                         // Use the previous point's x and latest fx in new y
              
            pos[counter].x = x * multiplier;
            pos[counter].y = y * multiplier;
            point(pos[counter].x, pos[counter].y);
            //println("point[" + counter + "]: (" + pos[counter].x + ", " + pos[counter].y + ")");
      }
      popMatrix();
  }
}
