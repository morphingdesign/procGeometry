// MiraAttractor
// Source: http://www.3d-meier.de/tut3/Seite57.html

// Color scheme
color blackSolid = color(0);
color blackGrad0 = color(0, 0);
color blueGrad50 = color(0, 0, 255, 50);
color blueGrad10 = color(0, 0, 255, 10);
color blueSolid = color(0, 0, 255);
color blueSolid150 = color(0, 0, 150);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);
color whiteGrad100 = color(255, 100);
color whiteGrad50 = color(255, 50);
color whiteGrad15 = color(255, 15);
color whiteGrad5 = color(255, 5);
color whiteSolid = color(255);

float xStart = 12.0;
float yStart = 0.0;
float zVar = 0.0;
float aVar = 0.2;
float bVar = 1.0;

float scalar = 50;
float scalarZ = 20;
float iteration = .1;
float counter = 0;
int gridSize = 10;

Geo geoShape;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void setup() {
   size(1200, 1200);    
   geoShape = new Geo(0, xStart, yStart, zVar, aVar, bVar);
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void draw() {  
  background(blackSolid);
  geoShape.draw();
}
