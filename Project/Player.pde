PImage characterImg;
PImage jumpImg;
PImage idleImg;
PImage runLeftImg;
PImage runRightImg;

class Player {

  int x;
  int y;
 
  int w;
  int h;
 
  boolean isMovingLeft;
  boolean isMovingRight;
 
  boolean isJumping;
  boolean isFalling;
 
  int speed;
 
  int jumpHeight;
  int highestY;
 
  int left;
  int right;
  int top;
  int bottom;
  
  Animation runLeftAnim;
  Animation runRightAnim;
 
   Player(int startingX, int startingY, int startingW, int startingH){
  x = startingX;
  y = startingY;
  w = startingW;
  h = startingH;

  characterImg = loadImage("character.png");
  characterImg.resize(w, h);
  
  idleImg = loadImage("Idle.png");
  runLeftImg = loadImage("runLeft.png");
  runRightImg = loadImage("runRight.png");
  jumpImg = loadImage("Jump.png");


  idleImg.resize(w, h);
  runLeftImg.resize(w, h);
  runRightImg.resize(w, h);
  jumpImg.resize(w, h);
  
    isMovingLeft = false;
    isMovingRight = false;
   
    isJumping = false;
    isFalling = false;
   
    speed = 7;
   
    jumpHeight = 180;
   
    highestY = y - jumpHeight;
   
   
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
 
 
void render(){
   
  if (isJumping || isFalling) {
    image(jumpImg, x, y);
  }
  else if (isMovingLeft && !isMovingRight) {
    image(runLeftImg, x, y);
  } 
  else if (isMovingRight && !isMovingLeft) {
    image(runRightImg, x, y);
  } 
  else {
    image(idleImg, x, y);
  }
}
 
 
  void move(){
    if (isMovingLeft == true){
      x -= speed;
    }
   
    if (isMovingRight == true){
      x += speed;
    }
    //update the bounds of the player
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
 
 
  void jumping(){
    if (isJumping == true){
      y -= speed*2;
      top = y - h/2;
      bottom = y + h/2;
    }
  }
 
  void falling(){
    if (isFalling == true){

      y += speed*1.25;
      top = y - h/2;
      bottom = y+ h/2;
    }
  }
  void topOfJump(){
    if ( y <= highestY){
      isJumping = false;
      isFalling = true;
    }
  }
 
  void land(){
    if ( y>= height - h/2){
      isFalling = false;
      y = height - h/2;
    }
  }
 
   //check to see if the player is colliding with any platform
  //if the player is not colliding with any platforms, then
  //make the player start falling
  void fallOfPlatform(ArrayList<Platform> aPlatformList){
   
       boolean onPlatform = false;
   
    //check that the player is not in the middle of a jump
    //and check that the player is not on the ground
     if (isJumping == false && y < height - h/2){
      for (Platform aPlatform : aPlatformList){
        if (top <= aPlatform.bottom && 
            bottom >= aPlatform.top && 
            left <= aPlatform.right && 
            right >= aPlatform.left) 
        onPlatform = true; // make onPlatform true
      }
    }
    //if you are not on a platform start falling
      if (onPlatform == false) {
     isFalling = true;
   }
 }
}
