// Class for folder construction
class Spiral {

  PVector[] pos = new PVector[150];
  float dir;
  float iteration;
  boolean collision = false;
  float growth = 0;
  float growthIncrease = 0.1;
  int counter = 0;
  float angleStart = 0;
  float pscale = 0;

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
      //iteration = 15;
      iteration = map(mouseX, 0, width, 5, 30);
    
      
      float angle = sin(radians(iteration));
      float multiplier = sin(growth) * 20;
      growth = 1;
      
      growth+=growthIncrease;
      iteration+=1;
      
      
      pushMatrix();
      translate(width/2, height/2);
      for(counter=1; counter < pos.length; counter++){
          for (float i=0; i < dir * pos.length; i+=dir) {
            //if (counter%10==0) {
              angleStart+=angle;
            //}
            
            pscale = angle * counter / sin(angle);
            stroke(map(pscale, 0, 200, 0, 255));
            strokeWeight((pscale / counter) * (pow(angle, i) * multiplier));
            
            //strokeWeight((pscale / counter) * (i / multiplier) + radians(iteration * growth));
            
            pushMatrix();
            rotate(angleStart);
            float x = (0 + tan(angle/angleStart * i)) * multiplier;
            float y = (iteration + cos(angleStart) + tan(angleStart/angle)) * multiplier;
            pos[counter].x = x;
            pos[counter].y = y;
            
            point(pos[counter].x, pos[counter].y);
            
            popMatrix();
            //println("test " + angleStart);
            
          }     
      }
      popMatrix();
      
      
  }
}
