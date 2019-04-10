float animSpeed = 0.002;  // Speed for screen saver animation

void setup() {
   size(1000, 1000, P3D);
   frameRate(30);
}

void draw() {
  
  background(0);
  
  /**
  
  pushMatrix();
  translate(width/2, -height*2, 0);
  //rotateX(frameCount * animSpeed);
   rotateY(frameCount * animSpeed);
  //rotateZ(frameCount * animSpeed);
  
  float x, y, z, u, v;
  float iteration = .2;
  float scalar = 7200;
  for(u=0; u < TWO_PI; u+=iteration){
    for(v=0; v < PI; v+=iteration){
      stroke(random(100, 200));
      strokeWeight(1);
      x = (2 + cos(u)) * cos(v) * cos(v) * cos(v) * sin(v) * scalar;
      y = (2 + cos(u + 2 * PI / 3)) * cos(v + 2 * PI / 3) * cos(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * scalar; 
      z = -(2 + cos(u - 2 * PI / 3)) * cos(v + 2 * PI / 3) * cos(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * scalar;
      //point(x, y, z);
      pushMatrix();
      translate(x, y, z);
      rotateY(random(0, PI));
      fill(100, 200);
      box(random(10, 25), random(10, 25), random(10, 25));
      popMatrix();
    }
  }
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2, 0);
  rotate(PI);
  //rotateX(frameCount * animSpeed);
  rotateY(frameCount * animSpeed * -1);
  //rotateZ(frameCount * animSpeed);
  
  
  float x2, y2, z2, u2, v2;
  float iteration2 = .4;
  float scalar2 = 600;
  float a = 1;
  for(u2=0; u2 < TWO_PI; u2+=iteration2){
    for(v2=0; v2 < PI; v2+=iteration2){
      stroke(random(100, 200));
      strokeWeight(3);
      x2 = (float)(Math.sinh(v2) * cos(a * u2) / (1 + Math.cosh(u2) * Math.cosh(v2))) * scalar2;
      y2 = (float)(Math.sinh(v2) * sin(a * u2) / (1 + Math.cosh(u2) * Math.cosh(v2))) * scalar2;
      z2 = (float)(Math.cosh(v2) * Math.sinh(u2) / (1 + Math.cosh(u2) * Math.cosh(v2))) * scalar2;
      point(x2, y2, z2);
    }
  }
  popMatrix();
  **/
  
  
  float xPos = map(mouseX, 0, width, 0, 2);
  
  int geoCase = int(xPos);
  
  
  float depth = -10;
  depth = map(mouseY, 0, height, 0, 2);
  
  pushMatrix();
  translate(width/2, height/2, depth);
  rotateX(frameCount * animSpeed);
   rotateY(frameCount * animSpeed);
  rotateZ(frameCount * animSpeed);
  stroke(0);
      strokeWeight(4);

  float x, y, z, u, v;
  float iteration = .4;
  float scalar = 800;
  float easing = 0.1;
  for(u=0; u < TWO_PI; u+=iteration){
    for(v=0; v < PI; v+=iteration){
      stroke(random(100, 255));
            strokeWeight(random(1, 3));
      
      
      x = (2 + cos(u)) * cos(v) * cos(v) * cos(v) * sin(v) * scalar;
      y = (2 + cos(u + 2 * PI / 3)) * cos(v + 2 * PI / 3) * cos(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * scalar; 
      z = -(2 + cos(u - 2 * PI / 3)) * cos(v + 2 * PI / 3) * cos(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * scalar;
      
      
      
        float x2, y2, z2, u2, v2;
        float iteration2 = .4;
        float scalar2 = 800;
        float a = 1;
        for(u2=0; u2 < TWO_PI; u2+=iteration2){
          for(v2=0; v2 < PI; v2+=iteration2){
            stroke(random(100, 255));
            strokeWeight(random(1, 3));
            x2 = (float)(Math.sinh(v2) * cos(a * u2) / (1 + Math.cosh(u2) * Math.cosh(v2))) * scalar2;
            y2 = (float)(Math.sinh(v2) * sin(a * u2) / (1 + Math.cosh(u2) * Math.cosh(v2))) * scalar2;
            z2 = (float)(Math.cosh(v2) * Math.sinh(u2) / (1 + Math.cosh(u2) * Math.cosh(v2))) * scalar2;
            
            //if(mouseX > width/2){
               point(x, y, z);
            //}
            //else{
            
              
            float mouseXPos = map(mouseX, 0, width, -1, 1);  
            float dX = mouseXPos * x2 - x;
            x += dX * easing;
            
            float mouseYPos = map(mouseY, 0, width, -1, 1);  
            float dY = mouseYPos * y2 - y;
            y += dY * easing;
            
            float mouseZPos = depth;
            float dZ = mouseZPos * z2 - z;
            z += dZ * easing;
            
            point(x, y, z);
            
            //}
          }
        }
        
        
            
        
      
      
    }
  }    
      

      
      
      
      /**
      switch(geoCase){
        case 0:
          x = (2 + cos(u)) * cos(v) * cos(v) * cos(v) * sin(v) * scalar;
          y = (2 + cos(u + 2 * PI / 3)) * cos(v + 2 * PI / 3) * cos(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * scalar; 
          z = -(2 + cos(u - 2 * PI / 3)) * cos(v + 2 * PI / 3) * cos(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * sin(v + 2 * PI / 3) * scalar;
          point(x, y, z);
          println("running 0");
          break;
        case 1:
          x = (float)(Math.sinh(v) * cos(a * u) / (1 + Math.cosh(u) * Math.cosh(v))) * scalar;
          y = (float)(Math.sinh(v) * sin(a * u) / (1 + Math.cosh(u) * Math.cosh(v))) * scalar;
          z = (float)(Math.cosh(v) * Math.sinh(u) / (1 + Math.cosh(u) * Math.cosh(v))) * scalar;        
          point(x, y, z);
          println("running 1");
          break;
      }
      
    }
  }
  **/
  
  popMatrix();
  
  
  
  
  
}
