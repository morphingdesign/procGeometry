// Class for folder construction
class Geo {

  // Maintain a low number of pts
  PVector[] pos = new PVector[150];
  
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
      //dir = 0.05;
      //iteration = map(mouseX, 0, width, 5, 30);
      //int radius = 18;          // Controls the overall size of geo in canvas
      //float angle = sin(radians(iteration));
      //float multiplier = sin(growth) * radius;
      //growth = 1;
      //growth+=growthIncrease;
      //iteration+=1;
      float scalar = 2;
      pushMatrix();
      translate(width/2, height/2);
      
      for(counter=1; counter < pos.length; counter++){
          //for (float i=0; i < dir * pos.length; i+=dir) {
            //angleStart+=angle;
            //pscale = angle * counter / sin(angle);
            //stroke(map(mouseY, height * 2, -height * 2, 0, 255), map(pscale, 0, 100, 0, 255), map(multiplier, -TWO_PI, TWO_PI, 0, 255));
            //if(optionSet == 1){
            //   strokeWeight((pscale / counter) * (i / multiplier) + radians(iteration * growth));        // light pattern
            //}
            //else{
            //    strokeWeight((pscale / counter) * (pow(angle, i) * pscale / multiplier));                         // heavy pattern
            //}            
            //pushMatrix();
            //rotate(angleStart);
            //float x = (0 + tan(angle/angleStart * i)) * multiplier;
            //float y = (iteration + cos(angleStart) + tan(angleStart/angle)) * multiplier;
            
            // Use last pt's x-value in F(x) equation for new x
            float fx = a * pos[counter - 1].x + ((2 * (1 - a) * pos[counter - 1].x * pos[counter - 1].x) / (1 + pos[counter - 1].x * pos[counter - 1].x)); 
            x = ((b * pos[counter - 1].y) + fx);
            // Multiply by scalar, if necessary
            //println("point[" + counter + "]: (" + y + ")");
            // Use the current x in F(x) equation for use in new y
            fx = a * x + ((2 * (1 - a) * x * x) / (1 + x * x)); 
            y = (-pos[counter - 1].x + fx);
              
            pos[counter].x = x;
            pos[counter].y = y;
            point(pos[counter].x, pos[counter].y);
            println("point[" + counter + "]: (" + pos[counter].x + ", " + pos[counter].y + ")");
            //popMatrix();            
          
      }
      popMatrix();
  }
}
