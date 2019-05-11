
// Color scheme
color blackSolid = color(0);
color whiteSolid = color(255);
Spiral spiralGeo1, spiralGeo2;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void setup() {
  size(1920, 1080);
  spiralGeo1 = new Spiral(1);
  spiralGeo2 = new Spiral(0);
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void draw() {
  background(blackSolid);
  spiralGeo1.draw();
  spiralGeo2.draw();
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
