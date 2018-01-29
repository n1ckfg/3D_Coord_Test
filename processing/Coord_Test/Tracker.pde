import gab.opencv.*;

class Tracker extends Cam {
  
  String name = "";
  PGraphics tex;
  OpenCV opencv;
  float camOffset, texOffset;
  
  PGraphics3D p3d;
  PMatrix3D camMat;
  PVector targetPos;
  PImage dst;
  ArrayList<Contour> contours;

  Tracker(PApplet app, float _camOffset, float _texOffset, String _name) {
    super();
    name = _name;
    tex = createGraphics(width/2, height, P3D);
    camOffset = _camOffset;
    pos.x = poi.x = pos.x + camOffset;
    texOffset = _texOffset;
    
    opencv = new OpenCV(app, tex);
    opencv.gray();
    opencv.threshold(70);
  }
  
  void update() {
    super.update();
    opencv.loadImage(tex);
  }
  
  void draw(PGraphics tex) {
    tex.beginDraw();  

    super.draw(tex);
    tex.background(0);
    tex.pushMatrix();
    tex.translate(target.p.x, target.p.y, target.p.z);
    tex.noStroke();
    tex.fill(255, 0, 0);
    tex.sphere(20);
    tex.popMatrix();

    tex.endDraw();
    image(tex, texOffset, 0);
        
    contours = opencv.findContours();
    Contour contour = contours.get(0);
    targetPos = new PVector((float) contour.getBoundingBox().getCenterX(), (float) contour.getBoundingBox().getCenterY());
  }
  
  void run() {
    update();
    draw(tex);
  }
  
}