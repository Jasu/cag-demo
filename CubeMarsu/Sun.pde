class Sun {
  
  private int size;
  
  public Sun(int size) {
    this.size = size;
  }
  
  public void draw() {
    fill(#ffff00);
    noStroke();
    translate(0, sin(frameCount * 1f));
    rotateX(frameCount * 0.01f);
    rotateY(frameCount * 0.01f);
    rotateZ(frameCount * 0.01f);
    println(frameCount * 0.01f);
    box(60);
  }
}
