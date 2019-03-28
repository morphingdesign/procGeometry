// Tranguloid Trefoil
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
float scalarZ = 10;
float iteration = .1;
float counter = 0;

void setup() {
   size(1200, 1200, P3D);  
   a = -1;
   b = 0;
   m = 3;
   n = -4;
   
   // A: fit($F, $FSTART, $FEND, -1, 0)
   // B: fit($F, $FSTART, $FEND, 0, 1)
   // M: fit($F, $FSTART, $FEND, 3, 4)
   // N: fit($F, $FSTART, $FEND, -4, 4)
   
}

void draw() {  
  background(0); 

  pushMatrix();
  translate(width/2, height/2);
  rotateX(frameCount * 0.003);
  rotateY(frameCount * 0.003);
  rotateZ(frameCount * 0.003);
  stroke(255);
  strokeWeight(1);
  for(u=-10; u <= 10 ; u+=iteration){
      for(v=-10; v <= 10; v+=iteration){
          
          a = map(counter, 0, 100, -1, 0);
          b = map(counter, 0, 100, 0, 1);
          m = map(counter, 0, 100, 3, 4);
          n = map(counter, 0, 100, -4, 4);
          
          
          
          x = u * scalar;
          y = v * scalar;
          z = a * sin(PI * n * x) * sin(PI * m * y) + b * sin(PI * m * x) * sin(PI * n * y) * scalarZ;
          point(x, y, z);
      }
  }
  popMatrix();
  
  if(counter == 100){
     counter = 0;
  }
  else{ 
     counter+=iteration;
  }
  
  
  
}
