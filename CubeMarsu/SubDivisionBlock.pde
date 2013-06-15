int NE = 0;
int SE = 1;
int NW = 2;
int SW = 3;

int opposite(int direction)
{
  return direction ^ 3;
}

abstract class SubdivisionBlock
{
  PImage tex;
  float spread;
  float outerInnerBalance;
  float height;
  float midSideBalance;

  SubdivisionBlock(PImage tex_)
  {
    tex = tex_;
  }

  void draw(int side, float length)
  {
    float straightPart = 0.6;
    if (length > straightPart)
    {
      pushMatrix();

      pushMatrix();
      translate(0, straightPart / 2 * height, 0);
      texbox(1, straightPart * height , 1, tex);
      popMatrix();

      translate(0, straightPart * height, 0);
      drawDivider(side, length - straightPart * height);
      popMatrix();
    }
    else
    {
      translate(0, length / 2 * height, 0);
      texbox(1, length, 1 * height, tex);
    }
  }

  void setOuterInnerBalance(float outerInnerBalance_)
  {
    outerInnerBalance = outerInnerBalance_;
  }

  void setSpread(float spread_)
  {
    spread = spread_;
  }

  void setHeight(float height_)
  {
    height = height_;
  }

  void setMidSideBalance(float midSideBalance_)
  {
    midSideBalance = midSideBalance_;
  }

  abstract void drawDivider(int side, float length);
  abstract int  getNumSplits();
  abstract void transformSplit(int previousSide, int side, int i);
  abstract int  getSplitSide(int i, int side);
}


class SubdivisionBlock1 extends SubdivisionBlock
{
  SubdivisionBlock1(PImage tex)
  {
    super(tex);
  }

  void drawDivider(int side, float length)
  {
    //        [_|_|_]
    // [ ] -> |_|_|_|
    //        [ | | ], 1.2x size.
    

    beginShape(QUADS);
    texture(tex);

    //Lower part

    //-z
    vertex(-0.5 , 0           , -0.5 , 0, 0);
    vertex(-spread, length, -spread, 0, 1);
    vertex(spread , length, -spread, 1, 1);
    vertex(0.5  , 0           , -0.5 , 1, 0);

    //+z
    vertex(0.5  , 0           , 0.5  , 0, 0);
    vertex(spread , length, spread , 0, 1);
    vertex(-spread, length, spread , 1, 1);
    vertex(-0.5 , 0           , 0.5  , 1, 0);

    //+x
    vertex(0.5  , 0           , 0.5  , 0, 0);
    vertex(spread , length, spread , 0, 1);
    vertex(spread , length, -spread, 1, 1);
    vertex(0.5  , 0           , -0.5 , 1, 0);

    //-x
    vertex(-0.5 , 0           , -0.5 , 0, 0);
    vertex(-spread, length, -spread, 0, 1);
    vertex(-spread, length, spread , 1, 1);
    vertex(-0.5 , 0           , 0.5  , 1, 0);

    //Top
    vertex(-spread, length, -spread, 0, 0);
    vertex(+spread, length, -spread, 0, 1);
    vertex(+spread, length, +spread, 1, 1);
    vertex(-spread, length, +spread, 1, 0);

    endShape();
  }

  int getNumSplits()
  {
    return 4;
  }

  void transformSplit(int previousSide, int side, int i)
  {
    float scale_ = 0.65;

    if (previousSide == side)
    {
      scale_ = outerInnerBalance * scale_;
    }
    else if (previousSide == opposite(side))
    {
      scale_ = (1.0 - outerInnerBalance) * scale_;
    }

    if (previousSide != side && previousSide != opposite(side))
    {
      scale_ = (midSideBalance) * scale_;
    }
    else
    {
      scale_ = (2.0 - midSideBalance) * scale_;
    }

    float offset = spread - scale_ / 2;
    switch (i)
    { 
      case 0: translate(-offset, 1, -offset); break;
      case 1: translate(-offset, 1, offset); break;
      case 2: translate(offset, 1, offset); break;
      case 3: translate(offset, 1, -offset); break;
    }
    scale(scale_, scale_*1.5, scale_);
  }

  int getSplitSide(int i, int side)
  {
    switch (i)
    {
      case 0:
        return SW;
      case 1:
        return NW;
      case 2:
        return NE;
      case 3:
        return SE;
      default:
        return -1;
    }
  }
}

class SubdivisionBlock2 extends SubdivisionBlock
{
  SubdivisionBlock2(PImage tex)
  {
    super(tex);
  }

  void drawDivider(int side, float length)
  {
    float ncoord = 1.0 - spread,
          ecoord = 1.0 - spread,
          scoord = spread - 1.0,
          wcoord = spread - 1.0;

    if (side == NW) { 
      ncoord = spread;
      wcoord = -spread;
    }
    if (side == NE) {
      ncoord = spread;
      ecoord = spread;
    }
    if (side == SW) {
      scoord = -spread;
      wcoord = -spread;
    }
    if (side == SE) {
      scoord = -spread;
      ecoord = spread;
    }

    beginShape(QUADS);
    texture(tex);

    //Lower part

    //-z
    vertex(-0.5 , 0           , -0.5 , 0, 0);
    vertex(wcoord, length, scoord, 0, 1);
    vertex(ecoord , length, scoord, 1, 1);
    vertex(0.5  , 0           , -0.5 , 1, 0);

    //+z
    vertex(0.5  , 0           , 0.5  , 0, 0);
    vertex(ecoord , length, ncoord , 0, 1);
    vertex(wcoord, length, ncoord , 1, 1);
    vertex(-0.5 , 0           , 0.5  , 1, 0);

    //+x
    vertex(0.5  , 0           , 0.5  , 0, 0);
    vertex(ecoord , length, ncoord , 0, 1);
    vertex(ecoord , length, scoord, 1, 1);
    vertex(0.5  , 0           , -0.5 , 1, 0);

    //-x
    vertex(-0.5 , 0           , -0.5 , 0, 0);
    vertex(wcoord, length, scoord, 0, 1);
    vertex(wcoord, length, ncoord , 1, 1);
    vertex(-0.5 , 0           , 0.5  , 1, 0);

    //Top
    vertex(wcoord, length, scoord, 0, 0);
    vertex(ecoord, length, scoord, 0, 1);
    vertex(ecoord, length, ncoord, 1, 1);
    vertex(wcoord, length, ncoord, 1, 0);

    endShape();
  }

  int getNumSplits()
  {
    return 1;
  }

  void transformSplit(int previousSide, int side, int i)
  {
    float offset = spread - 0.5;
    if (side == NE) translate(offset, 1, offset);
    if (side == SE) translate(offset, 1, -offset);
    if (side == SW) translate(-offset, 1, -offset);
    if (side ==  NW) translate(-offset, 1, offset);
  }

  int getSplitSide(int i, int side)
  {
    return side;
  }

}class SubdivisionTerminalBlock extends SubdivisionBlock
{
  SubdivisionTerminalBlock(PImage tex)
  {
    super(tex);
  }

  void drawDivider(int side, float length)
  {
    beginShape(TRIANGLES);
    texture(tex);

    vertex(-0.5, 0, -0.5, 0, 0);
    vertex(-0.5, 0, 0.5, 1, 0);
    vertex(0, length, 0, 0.5, 1);

    vertex(-0.5, 0, 0.5, 0, 0);
    vertex(0.5, 0, -0.5, 1, 0);
    vertex(0, length, 0, 0.5, 1);

    vertex(0.5, 0, -0.5, 1, 0);
    vertex(0.5, 0, 0.5, 0, 0);
    vertex(0, length, 0, 0.5, 1);

    vertex(-0.5, 0, 0.5, 1, 0);
    vertex(0.5, 0, 0.5, 0, 0);
    vertex(0, length, 0, 0.5, 1);

    endShape();

  }

  int getNumSplits()
  {
    return 0;
  }

  void transformSplit(int previousSide, int side, int i)
  {
  }

  int getSplitSide(int i, int side)
  {
    return 0;
  }
}
