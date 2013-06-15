class Cloud {
  
  private int size;
  private ArrayList<CloudBox> boxes = new ArrayList<CloudBox>();
  private boolean moving = true;
  
  public Cloud(int numberOfBoxes) {
    for (int i = 0; i < numberOfBoxes; i++) {
      boxes.add(new CloudBox(random(30, 40), random(-600, -460), random(150, 220), random(-70, 70)));
    }
  }
  
  public void display() {
    
    if (moving) {
      pushMatrix();
      translate(frameCount * 0.1f*10, 0, 0);
      for (CloudBox current : boxes) {
        current.display();
      }
      popMatrix();
    }
  }
  
  
}
