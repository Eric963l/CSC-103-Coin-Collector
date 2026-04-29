PImage coinImg;

class Coin {
  
  int x;
  int y;
  int size;
  
  boolean collected;

  Coin(int startingX, int startingY) {
    x = startingX;
    y = startingY;
    size = 50;
    collected = false;
    
    coinImg = loadImage("coin.png");
    coinImg.resize(size, size);
  }

  void render() {
    image(coinImg, x, y);
    if (!collected) {
      image(coinImg, x, y);
    }
  }

  void collide(Player p) {
    if (!collected) {
      if (p.left < x + size/2 &&
          p.right > x - size/2 &&
          p.top < y + size/2 &&
          p.bottom > y - size/2) {

        println("coin collected");
        collected = true;
      }
    }
  }
}
