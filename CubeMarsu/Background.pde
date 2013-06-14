ArrayList<Sun> suns = new ArrayList<Sun>();

void setupBackground() {
  Sun sun = new Sun(60);
  suns.add(sun);
}

void drawBackground(int ms)
{
  pointLight(255, 0, 0, width/2, height/2, 400);
  for (Sun current : suns) {
    current.draw();
  }
}
