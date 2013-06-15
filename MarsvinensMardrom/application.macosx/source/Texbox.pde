void texbox(float width, float height, float depth, PImage texture_)
{
  textureMode(NORMAL);
  fill(255);
  pushMatrix();

  scale(width / 2.0, height / 2.0, depth / 2.0);

  beginShape(QUADS);
  texture(texture_);

  // +Z "front" face
  vertex(-1, -1,  1, 0, 0.6666667);
  vertex( 1, -1,  1, 0.25, 0.6666667);
  vertex( 1,  1,  1, 0.25, 0.3333333);
  vertex(-1,  1,  1, 0, 0.3333333);

  // -Z "back" face
  vertex( 1, -1, -1, 0.5, 0.6666667);
  vertex(-1, -1, -1, 0.75, 0.6666667);
  vertex(-1,  1, -1, 0.75, 0.3333333);
  vertex( 1,  1, -1, 0.5, 0.3333333);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0.25, 0);
  vertex( 1,  1,  1, 0.25, 0.3333333);
  vertex( 1,  1, -1, 0.5, 0.3333333);
  vertex(-1,  1, -1, 0.5, 0);

  // -Y "top" face
  vertex(-1, -1, -1, 0.5, 1.0);
  vertex( 1, -1, -1, 0.5, 0.6666667);
  vertex( 1, -1,  1, 0.25, 0.666667);
  vertex(-1, -1,  1, 0.25, 1.0);

  // +X "right" face
  vertex( 1, -1,  1, 0.25, 0.6666667);
  vertex( 1, -1, -1, 0.5, 0.6666667);
  vertex( 1,  1, -1, 0.5, 0.3333333);
  vertex( 1,  1,  1, 0.25, 0.3333333);

  // -X "left" face
  vertex(-1, -1, -1, 0.75, 0.6666667);
  vertex(-1, -1,  1, 1, 0.6666667);
  vertex(-1,  1,  1, 1, 0.3333333);
  vertex(-1,  1, -1, 0.75, 0.3333333);

  endShape();

  popMatrix();
}

