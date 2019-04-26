
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


PVector[] pos = new PVector[600];
//int[] y;
float dir;
int iteration;
boolean collision = false;
float growth = 0;
float growthIncrease = 0.1;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void setup() {
  size(1000, 1000);
}


// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void draw() {
  background(blackSolid);

  stroke(whiteSolid);
  strokeWeight(1);

  dir = 0.05;
  iteration = 15;

  float angleStart = 0;
  float angle = radians(10);
  float multiplier = sin(growth) * 20;
  growth+=growthIncrease;
  int counter = 0;
  
  pushMatrix();
  translate(width/2, height/2);
  pos[0] = new PVector(0, 0);
  for(counter=1; counter < pos.length; counter++){
      for (float i=0; i < dir * pos.length; i+=dir) {
    
        
        if (counter%10==0) {
          angleStart+=angle;
          
        }
    
        pushMatrix();
        rotate(angleStart);
        float x = (0 + tan(angle/angleStart * i)) * multiplier;
        float y = (iteration + cos(angleStart) + tan(angleStart/angle)) * multiplier;
        pos[counter] = new PVector(x, y);
        //pos[i].x = 0;
        //pos[i].y = i + iteration;
        point(pos[counter].x, pos[counter].y);
        
        //line(pos[counter-1].x, pos[counter-1].y, pos[counter].x, pos[counter].y);
        popMatrix();
        
      }     
      
  }

  popMatrix();

}



// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
