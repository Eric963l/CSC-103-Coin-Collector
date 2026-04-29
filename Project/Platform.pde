PImage platformImg;

class Platform{
 
  int x;
  int y;
  int w;
  int h;
 
  int left;
  int right;
  int top;
  int bottom;
 
 
  Platform(int startingX, int startingY){
   
    x = startingX;
    y = startingY;
    w = 150;
    h = 18;
   
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    platformImg = loadImage("platform.png");
    platformImg.resize(w, h);
  }
 
  void render(){
    image(platformImg, x, y);
  }
 
 void collide(Player aPlayer){
   if ( left < aPlayer.right && 
        right > aPlayer.left && 
        top < aPlayer.bottom && 
        bottom > aPlayer.top) {
     
     aPlayer.isFalling = false; //stop falling
     aPlayer.isJumping = false;
     aPlayer.y = y - h/2 - aPlayer.h/2;
   }  
 }
}
