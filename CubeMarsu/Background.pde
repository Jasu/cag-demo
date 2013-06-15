Cloud cloud;
CubeTree tree;

void setupBackground() {
  cloud = new Cloud(40, -400, 150, 0);
  tree = new CubeTree();
}

void drawBackground(int ms)
{
  pointLight(255, 0, 0, width/2, height/2, 400);
  cloud.display();
  tree.display();
}
