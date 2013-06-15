class RainBox {
  float g = -9.81;
  float x;
  float y;
  float z;
  float size;
  
  float rotX = random(0, 2*PI);
  float rotY = random(0, 2*PI);
  float rotZ = random(0, 2*PI);
  
  public RainBox(float size, float x, float y, float z) {
    this.size = size;
    this.x = x;
    this.y = 0;
    this.z = z;
  }
  
  public void display() {
    pushMatrix();
    noStroke();
    fill(255);
    translate(x, y, z);
    translate(0, g*frameCount, 0);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    box(size);
    //println(g*frameCount);
    popMatrix();
  }
}
