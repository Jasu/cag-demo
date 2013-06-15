class CubeTree {
  float theta;   
  
  public CubeTree() {  
  }
  
  void display() {
    theta = radians(frameCount);
    branch(200);
  }
  
  void branch(float h) {
    h *= 0.66;
    
    if (h > 20) {
      pushMatrix();
      stroke(#8b4513);
      strokeWeight(2);
      rotateX(theta);
      rotateY(theta);
      rotateZ(theta);
      line(0, h, 0, 0, 0, 0);
      translate(0, h, 0);
      branch(h);
      popMatrix();
      
      pushMatrix();
      stroke(#8b4513);
      strokeWeight(2);
      rotateX(-theta);
      rotateY(-theta);
      rotateZ(-theta);
      line(0, h, 0, 0, 0, 0);
      translate(0, h, 0);
      branch(h);
      popMatrix();
      
    } else {
      pushMatrix();
      noStroke();
      fill(#228b22);
      box(20);
      popMatrix();
    }
  }
}


