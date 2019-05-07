// Class for folder construction
class Spiral {

  PVector[] pos = new PVector[600];
  float dir;
  int iteration;
  boolean collision = false;
  float growth = 0;
  float growthIncrease = 0.1;
  int counter = 0;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  Spiral(){
      pushMatrix();
      translate(width/2, height/2);
      pos[0] = new PVector(0, 0);
      for(int i=0; i < pos.length; i++){

            float x = 0;
            float y = 0;
            pos[i] = new PVector(x, y);
      }
      popMatrix();
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  
  void draw(){
      stroke(whiteSolid);
      strokeWeight(1);
    
      dir = 0.05;
      iteration = 15;
    
      float angleStart = 0;
      float angle = radians(10);
      float multiplier = sin(growth) * 20;
      growth+=growthIncrease;
      
      pushMatrix();
      translate(width/2, height/2);
      for(counter=1; counter < pos.length; counter++){
          for (float i=0; i < dir * pos.length; i+=dir) {
            if (counter%10==0) {
              angleStart+=angle;
            }
            pushMatrix();
            rotate(angleStart);
            float x = (0 + tan(angle/angleStart * i)) * multiplier;
            float y = (iteration + cos(angleStart) + tan(angleStart/angle)) * multiplier;
            pos[counter].x = x;
            pos[counter].y = y;
            
            point(pos[counter].x, pos[counter].y);
            
            popMatrix();
          }     
      }
      popMatrix();
  }
}
