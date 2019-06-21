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
  Geo(int option, float xOne, float yOne, float zOne){
      
      this.optionSet = option;
      this.xBegin = xOne;
      this.yBegin = yOne;
      this.zBegin = zOne;

      pushMatrix();
      translate(width/2, height/2, 0);
      pos[0] = new PVector(xBegin, yBegin, zBegin);
      for(int i=1; i < pos.length; i++){
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
  
  void draw(){
      stroke(whiteSolid);
      strokeWeight(1);
      
      // Controls for pattern definition
      // a = map(mouseX, 0, width, 0.15, 0.95);
      a = 40.0;
      c = 0.833;
      d = 0.5;
      e = 0.65;
      f = 20.0;
      // b = map(mouseY, 0, height, 0.9, 0.99);
      // float multiplier = map(mouseY, 0, height, 1.05, 1.01);
      float multiplier = 0.001;

      pushMatrix();
      translate(width/2, height/2, 800);
      rotateX(frameCount * animSpeed);
      rotateY(frameCount * animSpeed);
      rotateZ(frameCount * animSpeed);
      for(counter=1; counter < pos.length; counter++){
                        
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
