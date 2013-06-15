class RainBox {
  float g = -9.81;
  float x;
  float y;
  float z;
  float size;
  
  int startMillis;
  
  float rotX = random(0, 2*PI);
  float rotY = random(0, 2*PI);
  float rotZ = random(0, 2*PI);
  
  public RainBox(float size, float x, float y, float z) {
    this.size = size;
    this.x = x;
    this.y = 50;
    this.z = z;
    
    this.startMillis = millis();
  }
  
  public void display() {
    pushMatrix();
    noStroke();
    fill(#4169e1);
    translate(x, y, z);
    translate(0, y+g*(millis()-startMillis)*0.1f, 0);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    box(size);
    popMatrix();
  }
}
