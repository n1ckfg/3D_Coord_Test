class Tracker {
  
  String name = "";
  PGraphics tex;
  PVector pos, poi, up;
  float camOffset, texOffset;
  
  PGraphics3D p3d;
  PMatrix3D camMat;
  PVector targetPos;
  
  Tracker(float _camOffset, float _texOffset, String _name) {
    name = _name;
    tex = createGraphics(width/2, height, P3D);
    camOffset = _camOffset;
    texOffset = _texOffset;
    setupCamera();
    
    //p3d = (PGraphics3D) g;
    //camMat = new PMatrix3D();
  }
  
  void update() {
    //camMat = p3d.modelview.get();
    //targetPos = camMat.mult(new PVector(0,0,0), target.p);
  }
  
  void draw(PGraphics tex) {
    tex.beginDraw();
    tex.background(0);
    tex.pushMatrix();
    tex.translate(target.p.x, target.p.y, target.p.z);
    tex.noStroke();
    tex.fill(255,0,0);
    tex.sphere(20);
    tex.popMatrix();
    tex.camera(pos.x + camOffset, pos.y, pos.z, poi.x + camOffset, poi.y, poi.z, up.x, up.y, up.z);
    tex.endDraw();
    image(tex, texOffset, 0);
    
    println(name + ": " + target.p);
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