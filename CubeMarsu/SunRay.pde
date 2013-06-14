class SunRay {
  
  private int x;
  private int y;
  private int z;
  
  public SunRay(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public void display() {
    pushMatrix();
    fill(#ffd700);
    noStroke();
    translate(x, y, z);
    rotateY(2*PI/4);
    if (frameCount % 600 == 0) {
      strike();
    }
    
    if (frameCount % 500 == 0) {
      strikeBack();
    }
    box(10, 60, 10);
    popMatrix();
  }
  
  public void strike() {
    translate(0, 50, 0);
  }
  
  public void strikeBack() {
    translate(0, -50, 0);
  }
  
}
