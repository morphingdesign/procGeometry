// Class 
class LatLon {  
  
  // Class Variables 
  float radius = 100;
  float theta, phi;
  float x, y, z;
  float thetaIter = 0.2;  // Controls distance between latitude lines
  float phiIter = 0.2;    // Controls distance between longitude lines
  
  PVector[] pts = new PVector[100];
  PVector[] rowPts = new PVector[6];
  PVector[] colPts = new PVector[12];
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  LatLon(){  
      
      // Create longitude lines
      for(theta=0; theta <= 2 * PI; theta+=thetaIter){        
          for(int i=0; i < colPts.length; i++){
               phi = map(i, 0, colPts.length, 0, 2 * PI);
               x = radius * cos(theta) * sin(phi);
               y = radius * cos(phi);
               z = radius * sin(theta) * sin(phi);
               //point(x, y, z);
               colPts[i] = new PVector(x, y, z);
          }
      }
          
      // Create latitude lines
      for(phi=0; phi <= PI; phi+=phiIter){        
          for(int i=0; i < rowPts.length; i++){
               theta = map(i, 0, rowPts.length, 0, 2 * PI);
               x = radius * cos(theta) * sin(phi);
               y = radius * cos(phi);
               z = radius * sin(theta) * sin(phi);
               //point(x, y, z);
               rowPts[i] = new PVector(x, y, z);
          }
      }    

     
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawShape(){
      
      stroke(0, 255, 0);
      strokeWeight(1);
    
      // Draw longitude lines
      for(int i=0; i < colPts.length; i++){
         //println(i + ": (" + pts[i].x + ", " + pts[i].y + ", " + pts[i].z + ")");
         point(colPts[i].x, colPts[i].y, colPts[i].z);
      }
      
      stroke(255, 255, 0);
      
      // Draw latitude lines
      for(int i=0; i < rowPts.length; i++){
         //println(i + ": (" + pts[i].x + ", " + pts[i].y + ", " + pts[i].z + ")");
         point(rowPts[i].x, rowPts[i].y, rowPts[i].z);
      }
  }
  

}  
