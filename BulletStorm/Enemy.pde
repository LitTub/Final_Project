class Enemy {
  int health;
  int attack;
  int speed;
  int size = 50;
  color c = color(255,0,0);   
  float x,y;
  int vx;
  int vy;
  float eWidth;
  float eHeight;
  float attackRate;
   
  Enemy(float x, float y, int h, int a, int s, int eWidth, int eHeight) {
    this.x = x;
    this.y = y;
   health = h;
   attack = a;
   speed = s;
   this.eWidth = eWidth;
   this.eHeight = eHeight;
   attackRate = 30;
  }
  
  boolean isTouching(Bullet bullet, Enemy enemy) {
     if (bullet.pos.x + bullet.bWidth >= enemy.x &&    // r1 right edge past r2 left
      bullet.pos.x <= enemy.x + enemy.eWidth &&    // r1 left edge past r2 right
      bullet.pos.y + bullet.bHeight >= enemy.y &&    // r1 top edge past r2 bottom
      bullet.pos.y <= enemy.y + enemy.eHeight) {    // r1 bottom edge past r2 top
        bullet.firstTouch = false;
        return true;
  }
  return false;
  }
  
  boolean isTouching(Player player, Enemy enemy) {
     if (player.x + player.size >= enemy.x &&    // r1 right edge past r2 left
      player.x <= enemy.x + enemy.eWidth &&    // r1 left edge past r2 right
      player.y + player.size >= enemy.y &&    // r1 top edge past r2 bottom
      player.y <= enemy.y + enemy.eHeight) {    // r1 bottom edge past r2 top

        return true;
  }
  return false;
  }
  
  
}

class Alien extends Enemy {
  PImage img = loadImage("alien.png");
  public Alien(float x, float y, int h, int a, int s, int eWidth, int eHeight) {
    super(x, y, h, a, s, eWidth, eHeight);
      }
  
  
  void update() {
    if (health>0) {
    attackRate++;
    

    if (player.x + player.size < x) {
      x -= speed;
    }
    
    else if (player.x > x + eWidth) {
      x += speed;
    }
    
    if (health>0) {
      image(img, x,y, eWidth, eHeight);
    }

    
    if (attackRate >= 30 && health > 0 && (isTouching(player, this))) { 
      attackRate = 0;
      player.health-=attack;
      System.out.println("player health: "+player.health);
    }
    
    for (int i = 0;i < bullets.size();i++) {
      Bullet bullet = bullets.get(i);
      if (bullet.firstTouch && isTouching(bullet, this)) {
         health-=player.attack;
      }
    }
    
  
    }
  }
  }

  class Airship extends Enemy {
    PImage img = loadImage("ufo.png");
      public Airship(float x, float y, int h, int a, int s, int eWidth, int eHeight) {
          super(x, y, h, a, s, eWidth, eHeight);
      }

      void update() {
        if (health>0) {
          if (x+eWidth+speed > width) {
            x = width-eWidth;
            speed = -1 * speed;
          }

          else if (x + vx < -1) {
            speed = -1 * speed;
            x  = 0;
          }
          else {
          image(img, x, y, eWidth, eHeight);
          x+=speed;
          }

        enemyBullet bullet = new enemyBullet(this);
        bullet.update(this);

        }


      }


  }
  
