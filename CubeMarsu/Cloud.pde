class Cloud {
  
  private int size;
  private ArrayList<CloudBox> boxes = new ArrayList<CloudBox>();
  private ArrayList<RainBox> rainBoxes = new ArrayList<RainBox>();
  private boolean moving = true;
  private boolean raining = true;
  private int numberOfRainBoxes = 10;
  
  private float x;
  private float y;
  private float z;
  
  public Cloud(int numberOfBoxes, float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    
    for (int i = 0; i < numberOfBoxes; i++) {
      boxes.add(new CloudBox(random(30, 40), random(x, x+140), random(y, y+70), random(z-70, z+70)));
    }
    /*
    for (int i = 0; i < numberOfBoxes; i++) {
      rainBoxes.add(new RainBox(random(20, 30), random(x, x+140), random(y, y+70), random(z-70, z+70)));
    }
    */
    generateRainBox();
  }
  
  public void display() {
    
      pushMatrix();
      if (frameCount % 3 == 0) {
        generateRainBox();
        generateRainBox();
      }
      
      translate(frameCount * 0.1f*10, 0, 0);
      x = frameCount * 0.1f*10;
      
      for (CloudBox current : boxes) {
          current.display();
      }
      for (RainBox current : rainBoxes) {
          current.display();
      }
      popMatrix();
  }
  
  public void generateRainBox() {
  rainBoxes.add(new RainBox(random(10, 20), random(-400, -400+140), random(y, y+70), random(z-70, z+70)));
  }
  
}
