public double fractionLength = .8; 
public int smallestBranch = 8; 
public double branchAngle = .3;  

public void setup() {   
  size(640, 480);    
} 
public void draw() {   
  branchAngle= (double)(((double)(mouseY))/152.0);
  background(0);  
  strokeWeight(2);
  stroke(255, 255, 255);   
  line(320, 480, 320, 380);   
  drawBranches(320, 380, 80, (float)(-Math.PI/2), 2);  //will add later
} 
public void drawBranches(int x, int y, double branchLength, double angle, float thick) {   
  if (branchLength>=smallestBranch) {
    strokeWeight(thick);
    stroke(255*thick/1.1, 255, 255*thick/1.1); 
    int endX= x+(int)(branchLength*Math.cos(angle+branchAngle));
    int endY= y+(int)(branchLength*Math.sin(angle+branchAngle));
    int endX1= x+(int)(branchLength*Math.cos(angle-branchAngle));
    int endY1= y+(int)(branchLength*Math.sin(angle-branchAngle));
    line(x, y, endX, endY);
    line(x, y, endX1, endY1);
    drawBranches(endX, endY, branchLength*fractionLength, angle+branchAngle, thick*.8);
    drawBranches(endX1, endY1, branchLength*fractionLength, angle-branchAngle, thick*.8);
  }
} 
