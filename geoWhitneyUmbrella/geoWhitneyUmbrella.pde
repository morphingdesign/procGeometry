
float x, y, z, u, v;
float scalar = 100;
float iteration = .05;

void setup() {
   size(800, 800, P3D);  
}

void draw() {  
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotateX(frameCount * 0.003  + mouseY * 0.003);
  rotateY(frameCount * 0.003 + mouseX * 0.003);
  rotateZ(frameCount * 0.003);
  stroke(255);
  strokeWeight(1);

  for(u=-1.5; u < 1.5; u+=iteration){
    for(v=-1.5; v < 1.5; v+=iteration){
      x = u * v * scalar;
      y = u * scalar;
      z = v * v * scalar;
      point(x, y, z);
    }
  }
  
  popMatrix();
}
