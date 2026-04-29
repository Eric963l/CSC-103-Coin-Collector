PImage spikeImg;

class Spike {
  
  int x; 
  int y;
  int size;
  
  boolean collided;

  Spike(int startingX, int startingY) {
    x = startingX;
    y = startingY;
    size = 35;
    collided = false;
    
    spikeImg = loadImage("spike.png");
    spikeImg.resize(size, size);
  }

  void render() {
    image(spikeImg, x, y);
  }

  void collide(Player p) {
    if (p.left < x + size/2 &&
        p.right > x - size/2 &&
        p.top < y + size/2 &&
        p.bottom > y - size/2) {

      println("ouch");
      collided = true;
    }
  }
}
