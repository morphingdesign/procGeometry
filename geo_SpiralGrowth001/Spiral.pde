// Class for folder construction
class Spiral {

  // Opt1 uses 150 array values
  // Opt2 uses 250 array values
  PVector[] pos = new PVector[150];
  
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
  Spiral(int option){
      this.optionSet = option;
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
      int radius = 18;          // Controls the overall size of geo in canvas
    
      
      float angle = sin(radians(iteration));
      float multiplier = sin(growth) * radius;
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
            //stroke(map(pscale, 0, 200, 0, 255), map(angle, -PI, PI, 0, 255), map(multiplier, -TWO_PI, TWO_PI, 0, 255));
            
            stroke(map(mouseY, height * 2, -height * 2, 0, 255), map(mouseY, 0, height/2, 0, 255), map(multiplier, -TWO_PI, TWO_PI, 0, 255));
            
            if(optionSet == 1){
               strokeWeight((pscale / counter) * (i / multiplier) + radians(iteration * growth));        // light pattern
            }
            else{
                strokeWeight((pscale / counter) * (pow(angle, i) * pscale / multiplier));                         // heavy pattern
            }            
            
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
