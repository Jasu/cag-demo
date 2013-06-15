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

color tryGetColor(JSONObject o, String name, color default_)
{
  try
  {
    JSONArray vec = o.getJSONArray(name);
    return color(vec.getInt(0), vec.getInt(1), vec.getInt(2));
  }
  catch (RuntimeException e)
  {
    return default_;
  }
}

PImage tryGetTexture(JSONObject o, String name)
{
  try
  {
    return loadImage(o.getString(name));
  }
  catch (RuntimeException e)
  {
    return null;
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

String tryGetString(JSONObject o, String name, String default_)
{
  try
  {
    return o.getString(name);
  }
  catch (RuntimeException e)
  {
    return default_;
  }
}

MarsunPalanen[] loadMarsu(String file)
{
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
                                  tryGetColor(pala, "color", color(0,0,0)),
                                  tryGetTexture(pala, "texture"),
                                  tryGetString(pala, "name", null));
  }
  return result;
}

MarsunPalanen[] marsu;
PImage stars;
PImage clouds;


void setupMarsu()
{
  marsu = loadMarsu("marsu.json");
  clouds = loadImage("clouds.jpg");
  stars = loadImage("stars.png");
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

void drawMarsu(float ms)
{
  noStroke();
  drawSky(ms);
  rotateY(ms / 1000);
  rotateX(0.5);

  for (MarsunPalanen pala : marsu)
  {
    pala.draw(ms);
  }

  drawLasers(ms);
}

void drawLasers(float ms)
{
  if ((int)(ms / 1000) % 2 != 0)
    return;
  for (MarsunPalanen pala : marsu)
  {
    if (pala.name != null && (pala.name.equals("eye1") || pala.name.equals("eye2")))
    {
      pushMatrix();
      pala.transform(ms);
      translate(250, 0, 0);
      fill(color(255,30,0));
      box(500, 3, 3);
      popMatrix();
    }
  }
}
