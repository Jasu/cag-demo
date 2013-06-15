class SubdivisionChain
{
  PImage tex;
  double length;

  ArrayList<SubdivisionBlock> blocks;

  ArrayList<Float> heightWeights;
  ArrayList<Float> outerInnerWeights;
  ArrayList<Float> spreadWeights;

  SubdivisionBlock terminator;

  SubdivisionChain(PImage tex_)
  {
    blocks = new ArrayList<SubdivisionBlock>();
    heightWeights = new ArrayList<Float>();
    outerInnerWeights = new ArrayList<Float>();
    spreadWeights = new ArrayList<Float>();


    tex = tex_;
    terminator = new SubdivisionTerminalBlock(tex, 0, 0, 0);
    length = 0;
    float k = 2;
    for (int i = 0; i < 3; ++i)
    {
      blocks.add(new SubdivisionBlock2(tex, 0.9, 1.0, 0.4));
      blocks.add(new SubdivisionBlock1(tex, 0.9, 1.0, 0.4));
      spreadWeights.add(k + random(-0.1, 0.1));
      outerInnerWeights.add(k + random(-0.1, 0.1));
      heightWeights.add(k + random(-0.1, 0.1));
      k /= 1.1;
      spreadWeights.add(k + random(-0.1, 0.1));
      outerInnerWeights.add(k + random(-0.1, 0.1));
      heightWeights.add(k + random(-0.1, 0.1));
      k /= 1.1;
    }
  }

  void setSpread(float spread)
  {
    for (int i = 0; i < blocks.size(); ++i)
    {
      blocks.get(i).setSpread(spreadWeights.get(i) * spread);
    }
  }

  void setOuterInnerBalance(float balance)
  {
    for (int i = 0; i < blocks.size(); ++i)
    {
      blocks.get(i).setOuterInnerBalance(outerInnerWeights.get(i) * balance);
    }
  }

  void setHeight(float height)
  {
    for (int i = 0; i < blocks.size(); ++i)
    {
      blocks.get(i).setOuterInnerBalance(heightWeights.get(i) * height);
    }
  }


  void draw()
  {
    blocks.get(0).draw(-1, 1.0);
    renderBlocks(1, -1);
  }


  void terminate(int side)
  {
    SubdivisionBlock previous = blocks.get(blocks.size() - 1);

    int previousSide = side;

    for (int i = 0; i < previous.getNumSplits(); ++i)
    {
      pushMatrix();

      side = previous.getSplitSide(i, 0);

      previous.transformSplit(previousSide, side, i);

      terminator.draw(side, 1.0);

      popMatrix();
    }
  }

  void renderBlocks(int index, int side)
  {
    if (index >= blocks.size())
    {
      terminate(side);
      return;
    }

    SubdivisionBlock previous = blocks.get(index - 1);

    int previousSide = side;

    for (int i = 0; i < previous.getNumSplits(); ++i)
    {
      pushMatrix();

      side = previous.getSplitSide(i, previousSide);

      previous.transformSplit(previousSide, side, i);

      blocks.get(index).draw(side, 1.0);

      renderBlocks(index+1, side);
      popMatrix();
    }
  }
}
