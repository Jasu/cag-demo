class Cloud {
  
  private int size;
  private ArrayList<CloudBox> boxes = new ArrayList<CloudBox>();
  
  public Cloud(int numberOfBoxes) {
    for (int i = 0; i < numberOfBoxes; i++) {
      boxes.add(new CloudBox(random(30, 50), random(-100, 100), random(-50, 50), random(-100, 100)));
    }
  }
  
  public void display() {
    for (CloudBox current : boxes) {
      current.display();
    }
  }
}
