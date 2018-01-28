Tracker trackerL;
Tracker trackerR;
Target target;

void setup() {
  size(1024, 512, P3D);
  trackerL = new Tracker(width/4, 0, "trackerL");
  trackerR = new Tracker(-width/4, 512, "trackerR");
  target = new Target();
}

void draw() {
  background(0);
  target.update();
  trackerL.run();
  trackerR.run();
}