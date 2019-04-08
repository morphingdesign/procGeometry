// Class 
class LatLon {  
  
  // Class Variables 
  float radius = 300;
  float theta, phi;  
  int numOfLatLines = 20;
  int numOfLonLines = numOfLatLines;
  int numOfLatPts = 20;
  int numOfLonPts = numOfLatPts * 2;
  Lon[] lonLines = new Lon[numOfLonLines];
  Lat[] latLines = new Lat[numOfLatLines];
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  LatLon(){  
      // Create longitude lines
      for(int i=0; i < lonLines.length; i++){
           theta = map(i, 0, lonLines.length, 0, 2 * PI);
           lonLines[i] = new Lon(theta, radius, numOfLonPts);
      }

      // Create latitude lines
      for(int i=0; i < latLines.length; i++){
           phi = map(i, 0, latLines.length, 0, PI);
           latLines[i] = new Lat(phi, radius, numOfLatPts);
      }
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawPts(){
      strokeWeight(3);
      stroke(255, 0, 0);
      for(Lon i: lonLines){
          i.drawLonPts();
      }
      stroke(0, 0, 255);
      for(Lat j: latLines){
          j.drawLatPts();
      }      
  }
  
  void drawLines(){
      strokeWeight(1);
      stroke(0, 255, 0);
      for(Lon i: lonLines){
          i.drawLonLines();
      }
      stroke(0, 255, 255);
      for(Lat i: latLines){
          i.drawLatLines();
      }      
  }
}  
