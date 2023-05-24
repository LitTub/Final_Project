class Bullet {
  PVector pos; 
  PVector mouse; 
  float spd;
  float angle;
  float bWidth;
  float bHeight;
  
  public Bullet(){
    pos = new PVector(player.x, player.y);
    mouse = new PVector(mouseX, mouseY);
    spd = 5;
    angle = atan2(mouse.y - pos.y, mouse.x - pos.x) / PI * 180;
    bWidth = 10;
    bHeight = 10;
  }

  public void update(){
    pos.x += cos(angle/180*PI)*spd;
    pos.y += sin(angle/180*PI)*spd;
    fill(0,0,255);
    rect(pos.x, pos.y, bWidth, bHeight);
  }
}
