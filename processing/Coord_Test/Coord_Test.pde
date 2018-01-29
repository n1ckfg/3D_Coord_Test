Tracker trackerL;
Tracker trackerR;
Target target;
float camOffset = 165;
float texOffset = 512;

void setup() {
  size(1024, 512, P3D);
  texOffset = width/2;
  trackerL = new Tracker(this, camOffset, 0, "trackerL");
  trackerR = new Tracker(this, -camOffset, texOffset, "trackerR");
  target = new Target();
}

void draw() {
  background(0);
  target.update();
  trackerL.run();
  trackerR.run();
  
      
  noFill();
  strokeWeight(1);
  stroke(0, 255, 255);
  ellipse(trackerL.targetPos.x, trackerL.targetPos.y, 10, 10);   
  ellipse(trackerR.targetPos.x + texOffset, trackerR.targetPos.y, 10, 10);   
  
  drawFinalPos(0);
  drawFinalPos(texOffset);
  
  noFill();
  strokeWeight(2);
  rectMode(CORNER);
  stroke(0,255,255);
  rect(0,0,(width/2)-1, height);
  stroke(255,0,0);
  rect(width/2,0,width/2, height);
}

void drawFinalPos(float offset) { 
  float avgX = (trackerL.targetPos.x + trackerR.targetPos.x)/2.0;
  float avgY = (trackerL.targetPos.y + trackerR.targetPos.y)/2.0;
  float avgZ = dist(trackerL.targetPos.x, trackerL.targetPos.y, trackerR.targetPos.x, trackerR.targetPos.y)/2.0;
  PVector avgPos = new PVector(avgX, avgY, avgZ); 
  
  strokeWeight(2);
  stroke(0, 255, 0);
  
  pushMatrix();
  translate(avgPos.x + offset, avgPos.y, avgPos.z);
  ellipse(0,0, 10, 10);   
  popMatrix();
  
  line(avgX + offset, avgY, avgZ, offset, avgY, avgZ);
  line(avgX + offset, avgY, avgZ, avgX + offset, 0, avgZ);

  pushMatrix();
  translate(0,0,avgZ);
  noStroke();
  fill(127, 63);
  rect(offset, 0, avgX, avgY);
  popMatrix();
}