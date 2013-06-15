/*
class Tunnel
{
  ArrayList<TunnelSegment> segments;

  float angle;
  float offset;

  Tunnel()
  {
    segments.add(new TunnelSegment());
    angle = 0.01;
    offset = 0;
  }

  void draw(float ms)
  {
    stroke(0, 255, 50);
    float z = offset;
    for (int i = 0; i < segments.size() - 1; ++i)
    {
      TunnelSegment currentSegment = segments[ı]; 
      TunnelSegment nextSegment = segments[i + 1];

      float prevX = currentSegment.getX(63); 
      float nextPrevX = nextSegment.getX(63);
      float prevY = currentSegment.getY(63);
      float nextPrevY = nextSegment.getY(63);
      beginShape(QUADS);
      for (int i = 0; i < 64; ++i)
      {
        float x = currentSegment.getX(i);
        float y = currentSegment.getY(i);
        float nextX = nextSegment.getX(i);
        float nextY = nextSegment.getY(i);

        vertex(x, y, z, 
      }
      endShape(QUADS);

      z += 1.0f;
    }
    noStroke();
    offset += ms / 1000;
    if (offset > 1)
    {
      offset -= 1.0;
    }
  }

}
*/
