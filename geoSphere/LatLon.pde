// Class 
class LatLon {  
  
  // Class Variables 
  float radius = 100;
  float theta, phi;
  float x, y, z;
  float thetaIter = 0.2;  // Controls distance between latitude lines
  float phiIter = 0.2;    // Controls distance between longitude lines
  
  Lon[] lonLines = new Lon[12];
  Lat[] latLines = new Lat[12];
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  LatLon(){  

      // Create longitude lines
      for(int i=0; i < lonLines.length; i++){
           theta = map(i, 0, lonLines.length, 0, 2 * PI);
           lonLines[i] = new Lon(theta);
      }

      // Create latitude lines
      for(int i=0; i < latLines.length; i++){
           phi = map(i, 0, latLines.length, 0, 2 * PI);
           latLines[i] = new Lat(phi);
      }
          
     
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawShape(){
      
      stroke(0, 255, 0);
      strokeWeight(1);
      
      for(Lon i: lonLines){
          //i.drawLonPts();
      }
      
      for(Lat j: latLines){
          j.drawLatPts();
      }      
      
  }
  

}  
