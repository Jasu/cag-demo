class Ring
{
  float radius;
  float height;
  int segments;
  PImage tex;

  Ring(float radius_, float height_, int segments_, PImage tex_)
  {
    radius = radius_;
    height = height_;
    segments = segments_;
    tex = tex_;
  }

  void draw()
  {
    beginShape(QUADS);
    texture(tex);
    float angleDiff = -TAU / (float)segments;
    float prevX = cos(angleDiff * -1) * radius, 
          prevZ = sin(angleDiff * -1) * radius;
    for (int i = 0; i < segments; ++i)
    {
      float x = cos(angleDiff * i) * radius, 
            z = sin(angleDiff * i) * radius;

      vertex(prevX, -height / 2.0, prevZ, (float)i / (float)segments, 1);
      vertex(x, -height / 2.0, z, (float)(i + 1) / (float)segments, 1);
      vertex(x, height / 2.0, z, (float)(i + 1) / (float)segments, 0);
      vertex(prevX, height / 2.0, prevZ, (float)i / (float)segments, 0);

      prevX = x;
      prevZ = z;
    }
    endShape();
  }
}
