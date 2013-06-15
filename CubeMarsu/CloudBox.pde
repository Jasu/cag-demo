class CloudBox {
  
  float x;
  float y;
  float z;
  float size;
  float g = 9.81;
  
  float rotX = random(0, 2*PI);
  float rotY = random(0, 2*PI);
  float rotZ = random(0, 2*PI);
  
  public CloudBox(float size, float x, float y, float z) {
    this.size = size;
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public void display() {
    pushMatrix();
    noStroke();
    fill(#4169e1);
    translate(x, y, z);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    box(size);
    popMatrix();
  }
}
