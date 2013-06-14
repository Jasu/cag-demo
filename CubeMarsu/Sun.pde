class Sun {
  
  private int size;
  
  public Sun(int size) {
    this.size = size;
  }
  
  public void display() {
    pushMatrix();
    fill(#ffff00);
    noStroke();
    translate(0, sin(frameCount * 0.1f)*10);
    rotateX(frameCount * 0.01f);
    rotateY(frameCount * 0.01f);
    rotateZ(frameCount * 0.01f);
    box(60);
    popMatrix();
  }
}
