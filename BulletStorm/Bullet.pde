class Bullet {
  PVector pos; 
  PVector mouse; 
  float spd;
  float angle;
  float bWidth;
  float bHeight;
  boolean firstTouch;
  
  public Bullet(){
    pos = new PVector(player.x, player.y);
    mouse = new PVector(mouseX, mouseY);
    spd = 10;
    angle = atan2(mouse.y - pos.y, mouse.x - pos.x) / PI * 180;
    bWidth = 10;
    bHeight = 10;
    firstTouch = true;
  }

  public void update(){
    if (firstTouch) {
      pos.x += cos(angle/180*PI)*spd;
      pos.y += sin(angle/180*PI)*spd;
      fill(0,255,0);
      rect(pos.x + 25, pos.y, bWidth, bHeight);
    }
  }
}

class UFOBullet extends Bullet{
  public UFOBullet(UFO ufo){
    pos = new PVector(ufo.x,ufo.y+ufo.eHeight);
    bWidth = 50;
    bHeight = height - ufo.eHeight;
  }

  public void update(UFO ufo){
    pos.x += ufo.speed;
    image(ufo.laser,ufo.x+ufo.eWidth/2 - 22.5,ufo.y+ufo.eHeight,50,height - ufo.eHeight);
      
      }
}
