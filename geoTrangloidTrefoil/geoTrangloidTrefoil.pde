float animSpeed = 0.03;  // Speed for animation

void setup() {
   size(1000, 1000, P3D);
   
}

void draw() {
   background(0);
   geoTrefoil();
}
    
// *******************************************************
// Creates a Tranguloid Trefoil shape as an abstract form
// to serve as a screen saver when program is not running
void geoTrefoil(){
  float x, y, z, u, v;
  float scalar = 75;
  float iteration = .04;
  
  color colorLight = color(0, 0, 255, 255);
  color colorDark = color(0, 255, 0, 255);
  
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(frameCount * animSpeed);
  rotateY(frameCount * animSpeed);
  rotateZ(frameCount * animSpeed);
  stroke(255);
  strokeWeight(1);
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Formula for Tranguloid Trefoil source citation below:
  // http://www.3d-meier.de/tut3/Seite57.html
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
  for(u=-PI; u < PI; u+=iteration){
    for(v=-PI; v < PI; v+=iteration){
      float gradRange = map(v, 0, PI, 0.0, 1.0);
      color gradient = lerpColor(colorLight, colorDark, gradRange);
      stroke(gradient);
      x = (2 * sin(3 * u) / (2 + cos(v))) * scalar;
      y = (2 * (sin(u) + 2 * sin(2 * u)) / (2 + cos(v + 2 * PI / 3))) * scalar;
      z = ((cos(u) - 2 * cos(2 * u)) * (2 + cos(v)) * (2 + cos(v + 2 * PI / 3)) / 4) * scalar;
      point(x, y, z);
      }
  }
  popMatrix();  
}
