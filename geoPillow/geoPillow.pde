
float x, y, z, u, v;
float scalar = 120;
float iteration = .3;


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
  for(u=-PI; u < PI; u+=iteration){
    for(v=-PI; v < PI; v+=iteration/3){
      x = sin(v) * cos(u) * scalar / 2;
      y = 2 * sin(u) * scalar;
      z = 2 * cos(v) * scalar;
      point(x, y, z);
    }
  }
  popMatrix();
}
