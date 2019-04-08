// Class 
class Lat {  
  
  // Class Variables 
  float radius = 100;
  float theta, phi;
  float x, y, z;
  float thetaIter = 0.2;  // Controls distance between latitude lines
  float phiIter = 0.2;    // Controls distance between longitude lines
  
  PVector[] rowPts = new PVector[6];
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Create latitude lines
  Lat(float phi){
      this.phi = phi;
      for(int i=0; i < rowPts.length; i++){
           theta = map(i, 0, rowPts.length, 0, 2 * PI);
           x = radius * cos(theta) * sin(phi);
           y = radius * cos(phi);
           z = radius * sin(theta) * sin(phi);
           rowPts[i] = new PVector(x, y, z);
      }
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Draw latitude lines
  void drawLatPts(){
      for(int i=0; i < rowPts.length; i++){
         point(rowPts[i].x, rowPts[i].y, rowPts[i].z);
      }
  }
}  
