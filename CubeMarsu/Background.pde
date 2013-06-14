ArrayList<Sun> suns = new ArrayList<Sun>();
SunRay ray = new SunRay();

void setupBackground() {
  Sun sun = new Sun(60);
  suns.add(sun);
}

void drawBackground(int ms)
{
  pointLight(255, 0, 0, width/2, height/2, 400);
  for (Sun current : suns) {
    current.display();
  }
  stroke(255);
  
  pushMatrix();
  noFill();
  bezier(-100, 200, 0, 0, 150, 0, 400, 500, 0, 200, 200, 0);
  popMatrix();
  ray.display();
}
