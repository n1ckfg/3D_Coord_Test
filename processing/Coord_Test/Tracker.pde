import gab.opencv.*;

class Tracker {
  
  String name = "";
  PGraphics tex;
  OpenCV opencv;
  PVector pos, poi, up;
  float camOffset, texOffset;
  
  PGraphics3D p3d;
  PMatrix3D camMat;
  PVector targetPos;
  PImage dst;
  ArrayList<Contour> contours;

  Tracker(PApplet app, float _camOffset, float _texOffset, String _name) {
    name = _name;
    tex = createGraphics(width/2, height, P3D);
    camOffset = _camOffset;
    texOffset = _texOffset;
    setupCamera();
    
    opencv = new OpenCV(app, tex);
    opencv.gray();
    opencv.threshold(70);
  }
  
  void update() {
    opencv.loadImage(tex);
  }
  
  void draw(PGraphics tex) {
    tex.beginDraw();
    tex.background(0);
    tex.camera(pos.x + camOffset, pos.y, pos.z, poi.x + camOffset, poi.y, poi.z, up.x, up.y, up.z);

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
  
  void setupCamera() {
    pos = new PVector(0,0,0);
    poi = new PVector(0,0,0);
    up = new PVector(0,0,0);

    pos.x = width/2.0;
    pos.y = height/2.0;
    pos.z = (height/2.0) / tan(PI*30.0 / 180.0);

    poi.x = width/2.0;
    poi.y = height/2.0;
    poi.z = 0;

    up.x = 0;
    up.y = 1;
    up.z = 0;
  }
  
}