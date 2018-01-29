Tracker trackerL;
Tracker trackerR;
Target target;

void setup() {
  size(1024, 512, P3D);
  trackerL = new Tracker(this, width/4, 0, "trackerL");
  trackerR = new Tracker(this, -width/4, 512, "trackerR");
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
  ellipse(trackerR.targetPos.x + 512, trackerR.targetPos.y, 10, 10);   
  
  strokeWeight(2);
  stroke(0, 255, 0);
  drawFinalPos(0);
  drawFinalPos(512);
}

void drawFinalPos(float offset) {
  float avgX = (trackerL.targetPos.x + trackerR.targetPos.x)/2.0;
  float avgY = (trackerL.targetPos.y + trackerR.targetPos.y)/2.0;
  float avgZ = dist(trackerL.targetPos.x, trackerL.targetPos.y, trackerR.targetPos.x, trackerR.targetPos.y)/2.0;
  PVector avgPos = new PVector(avgX, avgY, avgZ); 

  pushMatrix();
  translate(avgPos.x + offset, avgPos.y, avgPos.z);
  ellipse(0,0, 10, 10);   
  popMatrix();
}