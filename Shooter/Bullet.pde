class Bullet {
  PVector pos = new PVector();
  PVector vel = new PVector(0.0, 0.0);
  
  Bullet(float px, float py, float dx, float dy) {
    pos.x = dx; 
    pos.y = dy;
    vel.x = dx - px;
    vel.y = dy - py;
  }
  
  void update() {
    pos.x += vel.x/2;
    pos.y += vel.y/2;
  }
}