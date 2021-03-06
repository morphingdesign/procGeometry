// Class 
class SphereSpiral {  
  
  // Class Variables 
  float radius = 320;
  float theta, phi;
  float x, y, z;
  float thetaIter = 0.2;  // Controls distance between latitude lines
  float phiIter = 0.2;    // Controls distance between longitude lines
  PVector[] pts = new PVector[100];
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  SphereSpiral(){  
      for(int i=0; i < pts.length; i++){
         theta = map(i, 0, pts.length, 0, 2 * PI);
         phi = map(i, 0, pts.length, 0, PI);
         x = radius * cos(theta) * sin(phi);
         y = radius * cos(phi);
         z = radius * sin(theta) * sin(phi);   
         pts[i] = new PVector(x, y, z);
      }
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawPts(){
      stroke(255);
      strokeWeight(3);
      for(int i=0; i < pts.length; i++){
         point(pts[i].x, pts[i].y, pts[i].z);
      }
  }
  
  void drawLines(){
      stroke(255, 255, 0);
      strokeWeight(1);
      for(int i=1; i < pts.length; i++){
         line(pts[i-1].x, pts[i-1].y, pts[i-1].z, pts[i].x, pts[i].y, pts[i].z);
      }
  }
}  
