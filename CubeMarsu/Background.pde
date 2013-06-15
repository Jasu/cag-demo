Cloud cloud;
CubeTree tree;
PImage stars;
PImage clouds;
PImage purple_lava;
PImage orange_wall;

void setupBackground() {
  cloud = new Cloud(40, -400, 150, 0);
  tree = new CubeTree();
  pointLight(255, 0, 0, width/2, height/2, 400);
  
  clouds = loadImage("clouds.jpg");
  stars = loadImage("stars.png");
  purple_lava = loadImage("purple_lava.jpg");
  orange_wall = loadImage("orange_wall.jpg");
}

void drawCloud(float ms)
{
  cloud.display();
}

void drawTree(float ms) {
  tree.display();
}

void drawSky(float ms)
{
  noLights();
  fill(255);
  textureMode(NORMAL);
  textureWrap(REPEAT);
  pushMatrix();
  translate(0, 0, -1000);
  rotateX(PI/2);
  scale(1500, 1, 1500);

  beginShape(QUADS);

  texture(clouds);

  float texMod = ms / 3000.0 % 1.0;

  vertex(-1, 1, -1, 0, 0+ texMod);
  vertex(-1, 1, 1 , 0, 1+ texMod);
  vertex(1 , 0, 1 , 1, 1+ texMod);
  vertex(1 , 0, -1, 1, 0+ texMod);

  endShape();

  popMatrix();

  pushMatrix();
  translate(0, 0, -800);
  rotateX(PI/2);
  scale(1500, 1, 1500);
  beginShape(QUADS);

  texture(stars);

  texMod = ms / 2500.0 % 1.0;

  vertex(-1, 1, -1, 0+texMod, 0+ texMod);
  vertex(-1, 1, 1 , 0+texMod, 1+ texMod);
  vertex(1 , 0, 1 , 1+texMod, 1+ texMod);
  vertex(1 , 0, -1, 1+texMod, 0+ texMod);

  endShape();

  popMatrix();
  lights();
}

void drawPurpleLavaSky(float ms) {
  noLights();
  fill(255);
  textureMode(NORMAL);
  textureWrap(REPEAT);
  pushMatrix();
  translate(0, 0, -1000);
  rotateX(PI/2);
  scale(1500, 1, 1500);

  beginShape(QUADS);

  texture(purple_lava);

  float texMod = ms / 3000.0 % 1.0;

  vertex(-1, 1, -1, 0, 0+ texMod);
  vertex(-1, 1, 1 , 0, 1+ texMod);
  vertex(1 , 0, 1 , 1, 1+ texMod);
  vertex(1 , 0, -1, 1, 0+ texMod);

  endShape();

  popMatrix();  
  lights();
}

void drawOrangeWall(float ms) {
  noLights();
  fill(255);
  textureMode(NORMAL);
  textureWrap(REPEAT);
  pushMatrix();
  translate(0, 0, -1000);
  rotateX(PI/2);
  scale(1500, 1, 1500);

  beginShape(QUADS);

  texture(orange_wall);

  float texMod = ms / 3000.0 % 1.0;

  vertex(-1, 1, -1, 0, 0+ texMod);
  vertex(-1, 1, 1 , 0, 1+ texMod);
  vertex(1 , 0, 1 , 1, 1+ texMod);
  vertex(1 , 0, -1, 1, 0+ texMod);

  endShape();

  popMatrix();  
  lights();
}

void drawTitleAndCredits(float ms) {
  textSize(32);
  fill(255, 204);
  
  pushMatrix();
  scale(1, -1, 1);
  textSize(40);
  text("marsvins mardröm", 12, 45, -30);
  popMatrix();
  
  pushMatrix();
  textSize(30);
  rotate(ms*0.001f);
  scale(1, -1, 1);
  color(255, 50);
  text("kulmatapaukset", 12, 60, -30);
  popMatrix();
}
