// Class 
class LatLon {  
  
  // Class Variables 
  float radius = 100;
  float theta, phi;
  float x, y, z;
  float thetaIter = 0.2;  // Controls distance between latitude lines
  float phiIter = 0.2;    // Controls distance between longitude lines
  
  PVector[] pts = new PVector[100];
  PVector[] rows = new PVector[6];
  PVector[] cols = new PVector[12];
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  LatLon(){  
      
      for(theta=0; theta <= 2 * PI; theta+=thetaIter){        
          for(int i=0; i < cols.length; i++){
               //theta = map(i, 0, rows.length, 0, 2 * PI);
               phi = map(i, 0, cols.length, 0, 2 * PI);
               x = radius * cos(theta) * sin(phi);
               y = radius * cos(phi);
               z = radius * sin(theta) * sin(phi);
               //point(x, y, z);
               cols[i] = new PVector(x, y, z);
          }
      }
          
    
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
  void drawShape(){
      
      stroke(255);
      strokeWeight(1);
     
         //println(0 + ": (" + pts[0].x + ", " + pts[0].y + ", " + pts[0].z + ")");
         //println(1 + ": (" + pts[1].x + ", " + pts[1].y + ", " + pts[1].z + ")");
     
     
      for(int i=0; i < pts.length; i++){
         //println(i + ": (" + pts[i].x + ", " + pts[i].y + ", " + pts[i].z + ")");
         //point(pts[i].x, pts[i].y, pts[i].z);
      }
    
    
      for(int i=0; i < cols.length; i++){
         //println(i + ": (" + pts[i].x + ", " + pts[i].y + ", " + pts[i].z + ")");
         point(cols[i].x, cols[i].y, cols[i].z);
      }

  }
  

}  
