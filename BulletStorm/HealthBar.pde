class HealthBar {
  PImage fullHeart = loadImage("fullHeart.png");
  PImage halfHeart = loadImage("halfHeart.png");
  PImage emptyHeart = loadImage("emptyHeart.ppg");
  int hearts; 
  HealthBar(Player player) {
     hearts = int(player.health/10);
  }
  
  public void update() {
    hearts = int(player.health/10);
      for (int i = 1;i<=10;i++) {
        if (hearts<i) {
          image(emptyHeart,60*(i-1), 0, 50, 50);
        }
        else if (i == hearts && hearts%2==1) {
            image(halfHeart, 60*(i-1),0, 50, 50);
          }
        else {
          image(fullHeart, 60*(i-1), 0, 50, 50);
        }
      }
  }
  
  
  
  
}
