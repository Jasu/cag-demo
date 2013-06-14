PVector tryGetVector(JSONObject o, String name, PVector default_)
{
  try
  {
    JSONArray vec = o.getJSONArray(name);
    return new PVector(vec.getFloat(0), vec.getFloat(1), vec.getFloat(2));
  }
  catch (RuntimeException e)
  {
    return default_;
  }
}

float tryGetFloat(JSONObject o, String name, float default_)
{
  try
  {
    return o.getFloat(name);
  }
  catch (RuntimeException e)
  {
    return default_;
  }
}

MarsunPalanen[] loadMarsu(String file)
{
  PImage tex = loadImage("kuutio.jpg");
  JSONArray palaset = loadJSONArray(file);
  MarsunPalanen[] result = new MarsunPalanen[palaset.size()];
  for (int i = 0; i < palaset.size(); i++)
  {
    JSONObject pala = palaset.getJSONObject(i);
    PVector offset = new PVector(0,0,0), 
            size = new PVector(1,1,1), 
            axis = new PVector(0,0,1), 
            oscillationMagnitude = new PVector(0,0,0), 
            scaleMagnitude = new PVector(0,0,0);
    offset = tryGetVector(pala, "offset", offset);
    size = tryGetVector(pala, "size", size);
    axis = tryGetVector(pala, "axis", axis);
    oscillationMagnitude = tryGetVector(pala, "oscillationMagnitude", oscillationMagnitude);
    scaleMagnitude = tryGetVector(pala, "scaleMagnitude", scaleMagnitude);

    float rotationSpeed = tryGetFloat(pala, "rotationSpeed", 0.0);
    float oscillationSpeed = tryGetFloat(pala, "oscillationSpeed", 0.0);
    float scaleSpeed = tryGetFloat(pala, "scaleSpeed", 0.0);

    result[i] = new MarsunPalanen(offset,
                                  size,
                                  axis,
                                  oscillationMagnitude,
                                  scaleMagnitude,
                                  rotationSpeed,
                                  oscillationSpeed,
                                  scaleSpeed,
                                  tex);
  }
  return result;
}

MarsunPalanen[] marsu;

void setupMarsu()
{
  marsu = loadMarsu("marsu.json");
}

void drawMarsu(float ms)
{
  rotateY(ms / 2000);

  for (MarsunPalanen pala : marsu)
  {
    pala.draw(ms);
  }
}
