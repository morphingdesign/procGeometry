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

float x, y, z, a, b, n, m, u, v;
float scalar = 50;
float scalarZ = 20;
float iteration = .1;
float counter = 0;
int gridSize = 10;

void setup() {
   size(1200, 1200);  
   x = 12.0;
   y = 0.0;
   a = 0.2;
   b = 1;   
}

void draw() {  
  background(0); 
  pushMatrix();
  
  translate(width/2, height/2);
  //rotateX(radians(45));
  
  stroke(255);
  strokeWeight(1);
  
  // Check if last point
  // Only allow last point to run through condition
  if(){
    
    // Mouse Ctrls
    a = map(mouseX, 0, width, 0, 1);
    b = map(mouseY, 0, height, 0, 1);
    
    // Use last pt's x-value in F(x) equation for new x
    // fx = a * thisPt[0] + ((2 * (1 - a) * thisPt[0] * thisPt[0]) / (1 + thisPt[0] * thisPt[0])); 
    // x = (b * thisPt[1]) + fx;
    // Multiply by scalar, if necessary
    
    // Use the current x in F(x) equation for use in new y
    // fx = a * x + ((2 * (1 - a) * x * x) / (1 + x * x)); 
    // y = -thisPt[0] + fx;
    
    // Add new point based on new x, y, z values
    point(x, y);
  }
  popMatrix();
  
  if(counter == 100){
     counter = 0;
  }
  else{ 
     counter+=iteration;
  }  
}
