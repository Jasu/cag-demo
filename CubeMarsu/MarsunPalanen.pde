class MarsunPalanen
{
  PVector offset;
  PVector size;
  PVector axis;

  PVector oscillationMagnitude;
  PVector scaleMagnitude;

  float rotationSpeed;
  float oscillationSpeed;
  float scaleSpeed;

  color clr;
  PImage tex;

  MarsunPalanen(PVector offset_, 
                PVector size_, 
                PVector axis_,
                PVector oscillationMagnitude_,
                PVector scaleMagnitude_,
                float rotationSpeed_,
                float oscillationSpeed_,
                float scaleSpeed_,
                color clr_,
                PImage tex_)
  {
    offset = offset_;
    size = size_;
    axis = axis_;
    oscillationMagnitude = oscillationMagnitude_;
    scaleMagnitude = scaleMagnitude_;
    rotationSpeed = rotationSpeed_;
    oscillationSpeed = oscillationSpeed_;
    scaleSpeed = scaleSpeed_;
    tex = tex_;
    clr = clr_;
  }

  void draw(float time)
  {
    pushMatrix();

    translate(offset.x + oscillationMagnitude.x * sin(time / 1000.0 * TAU * oscillationSpeed), 
              offset.y + oscillationMagnitude.y * sin(time / 1000.0 * TAU * oscillationSpeed), 
              offset.z + oscillationMagnitude.z * sin(time / 1000.0 * TAU * oscillationSpeed));

    rotate(rotationSpeed / 1000.0 * TAU * time, axis.x, axis.y, axis.z);

    scale(1.0 + scaleMagnitude.x * sin(time / 1000.0 * TAU * scaleSpeed), 
          1.0 + scaleMagnitude.y * sin(time / 1000.0 * TAU * scaleSpeed), 
          1.0 + scaleMagnitude.z * sin(time / 1000.0 * TAU * scaleSpeed));

    rectMode(CENTER);

    if (tex != null)
      texbox(size.x, size.y, size.z, tex);
    else
    {
      fill(clr);
      box(size.x, size.y, size.z);
    }

    popMatrix();
  }
}
