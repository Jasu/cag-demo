class SunRay {
  
  public SunRay() {
  }
  
  public void display() {
    pushMatrix();
    fill(#ffd700);
    noStroke();
    translate(0, 50, 100);
    box(30);
    popMatrix();
  }
  
}
