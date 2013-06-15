class Sun {
  
  private int size;
  private ArrayList<SunRay> rays = new ArrayList<SunRay>();
  
  public Sun(int size) {
    this.size = size;
    SunRay ray1 = new SunRay(0, 100, 100);
    SunRay ray2 = new SunRay(0, -100, -100);
    SunRay ray3 = new SunRay(0, 100, -100);
    SunRay ray4 = new SunRay(0, -100, 100);
    rays.add(ray1);
    rays.add(ray2);
    rays.add(ray3);
    rays.add(ray4);
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
    for(SunRay current : rays) {
      current.display();
    }
    popMatrix();
  }
}
