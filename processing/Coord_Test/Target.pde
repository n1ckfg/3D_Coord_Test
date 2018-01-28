class Target {

  float speed = 0.05;
  PVector p, t;
  
  Target() {
    p = new PVector(width/2, height/2, 0);
    t = randomize();
  }

  PVector randomize() {
    float x = random(256, 768);
    float y = random(0, 512);
    float z = random(-500, -1500);
    return new PVector(x,y,z);
  }
  
  void update() {
    p = lerp3D(p, t, speed);
    if (int(p.x) == int(t.x)) t = randomize();
  }
  
  PVector lerp3D(PVector p1, PVector p2, float speed) {
    float x = lerp(p1.x, p2.x, speed);
    float y = lerp(p1.y, p2.y, speed);
    float z = lerp(p1.z, p2.z, speed);
    return new PVector(x,y,z);
  }

}