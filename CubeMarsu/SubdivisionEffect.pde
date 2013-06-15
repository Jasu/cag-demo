
SubdivisionChain subdivisionChain;
PImage cubetex;
Ring ring;

void setupSubdivisionEffect()
{
  subdivisionChain = new SubdivisionChain(loadImage("electric.jpg"));
  cubetex = loadImage("lava.jpg");
  ring = new Ring(1000.0, 600.0, 128, loadImage("film.jpg"));
}

void drawSubdivisionEffect(float ms)
{
  float r = 600;

  camera(
      cos(ms / 1500) * r, 500 /*+ sin(ms / 1000.0) * 1000.0 / 3*/, sin(ms / 1500) * r,
      0, 200, 0,
      0, -1, 0
  );

  float height =(0.5 + sin(ms / 500) / 3 + 0.5) / 2;

  pushMatrix();
  rotateY(ms / 3000);
  ring.draw();
  popMatrix();

  pushMatrix();
  translate(0, 600 - 300 * height, 0);
  rotateX(ms / 1000);
  rotateY(ms / 800);
  rotateZ(ms / 1200);
  texbox(120,120,120,cubetex);
  popMatrix();

  scale(100,70,100);
  subdivisionChain.setSpread((0.7 + sin(ms / 700) / 5 + 0.2) / 2);
  subdivisionChain.setHeight(height);
  subdivisionChain.setOuterInnerBalance((0.5 + sin(ms / 300) / 3 + 0.5) / 2);
  subdivisionChain.setMidSideBalance((0.5 + sin(ms / 1000) / 5 + 0.5) / 2);
  subdivisionChain.draw();

}

