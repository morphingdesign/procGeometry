// Class 
class Lon {  
  
  // Class Variables 
  float radius = 300;
  float theta, phi;
  float x, y, z;
  float thetaIter = 0.2;  // Controls distance between latitude lines
  float phiIter = 0.2;    // Controls distance between longitude lines
  
  PVector[] colPts = new PVector[12];
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Create longitude lines
  Lon(float theta){
      this.theta = theta;
          for(int i=0; i < colPts.length; i++){
               phi = map(i, 0, colPts.length, 0, 2 * PI);
               x = radius * cos(theta) * sin(phi);
               y = radius * cos(phi);
               z = radius * sin(theta) * sin(phi);
               colPts[i] = new PVector(x, y, z);
          }
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Draw longitude lines
  void drawLonPts(){
      for(int i=0; i < colPts.length; i++){
         point(colPts[i].x, colPts[i].y, colPts[i].z);
      }
  } 
  
  void drawLonLines(){
      for(int i=1; i < colPts.length; i++){
         line(colPts[i-1].x, colPts[i-1].y, colPts[i-1].z, colPts[i].x, colPts[i].y, colPts[i].z);
      }
  }
  
  
 

}
