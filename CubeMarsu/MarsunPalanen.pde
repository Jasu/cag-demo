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

  PImage tex;

  MarsunPalanen(PVector offset_, 
                PVector size_, 
                PVector axis_,
                PVector oscillationMagnitude_,
                PVector scaleMagnitude_,
                float rotationSpeed_,
                float oscillationSpeed_,
                float scaleSpeed_,
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
  }

  void draw(float time)
  {
    pushMatrix();

    translate(offset.x + oscillationMagnitude.x * time * oscillationSpeed, 
              offset.y + oscillationMagnitude.y * time * oscillationSpeed, 
              offset.z + oscillationMagnitude.z * time * oscillationSpeed);

    rotate(rotationSpeed * time, axis.x, axis.y, axis.z);

    scale(1.0 + scaleMagnitude.x * time * scaleSpeed, 
          1.0 + scaleMagnitude.y * time * scaleSpeed, 
          1.0 + scaleMagnitude.z * time * scaleSpeed);

    rectMode(CENTER);

    if (tex != null)
      texbox(size.x, size.y, size.z, tex);
    else
      box(size.x, size.y, size.z);

    popMatrix();
  }
}
