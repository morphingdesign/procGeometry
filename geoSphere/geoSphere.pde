Table airports;
SphereSpiral spiralShape;
LatLon sphereGrid;

void setup() {
  size(800, 800, P3D);
  //frameRate(240);
  airports = loadTable("airports.csv");
  spiralShape = new SphereSpiral();
  sphereGrid = new LatLon();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  //rotateX(frameCount*0.001);
  rotateY(frameCount*0.01);
  
  spiralShape.drawPts();
  spiralShape.drawLines();
  
  sphereGrid.drawPts();
  sphereGrid.drawLines();
  
  /**
  randomSeed(4);
  for (int i = 0; i < 1000; i++) {
    PVector v = random3D();
    v.mult(100);
    stroke(255);
    strokeWeight(4);
    point(v.x, v.y, v.z);
  }
  **/
  
  //sphere3D();
  
  /**
  for(int i=0; i < airports.getRowCount(); i++){
     float latitude = airports.getFloat(i, 6);
     float longitude = airports.getFloat(i, 7);
     PVector aPt = sphereToCart(radians(latitude), radians(longitude), 1.0);
     aPt.mult(200);
     stroke(255);
     strokeWeight(1);
     point(aPt.x, aPt.y, aPt.z);
  }
  **/

  
  //v@P = sphereToCart(radians(lat), radians(lon), 1.0);
  
  
}

void sphere3D(){
  float radius = 100;
  float theta, phi;
  float x, y, z;
  float thetaIter = 0.2;  // Controls distance between latitude lines
  float phiIter = 0.2;    // Controls distance between longitude lines
  
  stroke(255);
  strokeWeight(1);
  
  for(theta=0; theta <= 2 * PI; theta+=thetaIter){
    for(phi=0; phi <= PI; phi+=phiIter){        
       x = radius * cos(theta) * sin(phi);
       y = radius * cos(phi);
       z = radius * sin(theta) * sin(phi);
       point(x, y, z);
    }
  }
  
}



PVector random3D() {
  float angle = random(0,TWO_PI);
  float vz = random(-1,1);
  float vx = sqrt(1-vz*vz)*sin(angle);
  float vy = sqrt(1-vz*vz)*cos(angle);
  PVector  v = new PVector(vx, vy, vz);
  return v;
}


PVector sphereToCart(float lat, float lon, float rad){
  // Algorithms for mapping spherical coordinates to three-dimensional Cartesian
  // coordinates derived from the following resource link:
  // https://www.mathworks.com/help/matlab/ref/sph2cart.html
  // Formulas from this reference were then converted to align elevation to latitude
  // and azimuth to longitude
  PVector vNew = new PVector(-cos(lat) * cos(lon), -sin(lat), cos(lat) * sin(lon));
  return vNew;
}
