// Class 
class Lat {  
  
  // Class Variables 
  float radius, theta, phi, x, y, z;
  int numPts;
  PVector[] rowPts;
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Create latitude lines
  Lat(float phi, float radius, int numPts){
      this.phi = phi;
      this.radius = radius;
      this.numPts = numPts;
    
      rowPts = new PVector[numPts];
    
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
  
  void drawLatLines(){
      for(int i=1; i < rowPts.length; i++){
         line(rowPts[i-1].x, rowPts[i-1].y, rowPts[i-1].z, rowPts[i].x, rowPts[i].y, rowPts[i].z);
      }
      int lastItem = rowPts.length - 1;
      line(rowPts[lastItem].x, rowPts[lastItem].y, rowPts[lastItem].z, rowPts[0].x, rowPts[0].y, rowPts[0].z);
  }
  
}  
