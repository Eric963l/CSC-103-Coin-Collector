int gameState = 0;
int score = 0;
import processing.sound.*;

Player p1;

PImage startImg;

Platform plat1;
Platform plat2;
Platform plat3;
Platform plat4;
Platform plat5;
Platform plat6;
Platform plat7;
Platform plat8;
Platform plat9;
Platform plat10;
Platform plat11;
Platform plat12;
Coin coin1;
Spike spike1;
Spike spike2;
Spike spike3;
Spike spike4;
Spike spike5;

PImage bg;
SoundFile jumpSound;
SoundFile bgm;

ArrayList<Platform> platformList;
ArrayList<Spike> spikeList;

void setup(){
  size(1200,800);
  textSize(50); 
  startImg = loadImage("startimg.png");
}


void draw(){
   if(gameState == 0){
    drawMenu();
    return;
  }
  imageMode(CENTER);
  background(bg);
  text("Score "+ score, width/2 - 480, height/2 - 330);
 
  p1.render();
  p1.move();
  p1.jumping();
  p1.topOfJump();
  p1.falling();
  p1.land();
  p1.fallOfPlatform(platformList);

 
  // for loop to go through all platforms
  for (Platform aPlatform : platformList){
    aPlatform.render();
    aPlatform.collide(p1);
    
    coin1.render();
    coin1.collide(p1);
    
    for (Spike s : spikeList) {
     s.render();
     s.collide(p1);
     
      //player collided with spike
    if(s.collided == true){
      p1 = new Player(150, 400, 60, 60);   
      println("player collided");
      s.collided = false;
    } 
    
    
  }
  
  
   //Coin collided
    if(coin1.collected == true && gameState == 1){
      //Load level 2
      //Set state to level 2
      score = 100;
      playerScoreScreen();
      println("level 2");
      println("score "+ score);
      gameState = 2;
      bg = loadImage("bg2.png");
      p1 = new Player(50, height/2, 60, 60);
       
       
       plat1 = new Platform(width/2 + 50, 650);
       plat2 = new Platform(width/2 + 200, 450);
       plat3 = new Platform(width/2 - 500, 650);
       plat4 = new Platform(width/2 - 200, 600);
       plat5 = new Platform(width/2 + 500, 500);
       plat6 = new Platform(width/2 + 800, 550);

 
       platformList = new ArrayList<Platform>();
       spikeList = new ArrayList<Spike>();
 
       platformList.add(plat1);
       platformList.add(plat2);
       platformList.add(plat3);
       platformList.add(plat4);
       platformList.add(plat5);
       platformList.add(plat6);
       
       coin1 = new Coin(width/2 + 550, 465);
       spikeList.add(new Spike(width/2 + 50, 620));
       spikeList.add(new Spike(width/2 + 200, 420));
       spikeList.add(new Spike(width/2 - 250, 570));
       spikeList.add(new Spike(width/2 + 500, 470));
       spikeList.add(new Spike(width/2 + 800, 520));
       loadSpikeFloor(); 
    }
    
    //Coin collided
    if(coin1.collected == true && gameState == 2){
      //Load level 3
      //Set state to level 3
      score = 200;
      println("level 3");
      println("score "+ score);
      gameState = 3;
      bg = loadImage("bg3.png");
      p1 = new Player(50, height/2, 60, 60);

 
      plat1 = new Platform(width/2 - 300, 650);
      plat2 = new Platform(width/2 - 100, 500);
      plat3 = new Platform(width/2 + 150, 400);
      plat4 = new Platform(width/2 + 400, 300);
      plat5 = new Platform(width/2 + 550, 250);
      plat6 = new Platform(width/2 - 500, 550);

      platformList = new ArrayList<Platform>();
      spikeList = new ArrayList<Spike>();

      platformList.add(plat1);
      platformList.add(plat2);
      platformList.add(plat3);
      platformList.add(plat4);
      platformList.add(plat5);
      platformList.add(plat6);


      spikeList.add(new Spike(width/2 - 100, 470));
      spikeList.add(new Spike(width/2 + 150, 370));
      spikeList.add(new Spike(width/2 + 400, 270));
      loadSpikeFloor(); 

      coin1 = new Coin(width/2 + 550, 200); 
  }
  
  //Coin collided
    if(coin1.collected == true && gameState == 3){
      //Load level 4
      //Set state to level 4
      score = 300;
      println("level 4");
      println("score "+ score);
      gameState = 4;
      bg = loadImage("bg4.png");
      p1 = new Player(50, height/2, 60, 60);

 
    plat1 = new Platform(width/2 - 350, 450);
    plat2 = new Platform(width/2 - 150, 550);
    plat3 = new Platform(width/2 + 200, 450);
    plat4 = new Platform(width/2 + 350, 350);
    plat5 = new Platform(width/2 - 30, 350);
    plat6 = new Platform(width/2 + 500, 250);
    plat7 = new Platform(width/2 - 500, 650);

    platformList = new ArrayList<Platform>();
    spikeList = new ArrayList<Spike>();

    platformList.add(plat1);
    platformList.add(plat2);
    platformList.add(plat3);
    platformList.add(plat4);
    platformList.add(plat5);
    platformList.add(plat6);
    platformList.add(plat7);


    spikeList.add(new Spike(width/2 - 150, 520));
    spikeList.add(new Spike(width/2 + 150, 420));
    spikeList.add(new Spike(width/2 + 350, 320));
    spikeList.add(new Spike(width/2 + 470, 220));
    loadSpikeFloor(); 
  
    coin1 = new Coin(width/2 + 525, 210);
    }
    
     //Coin collided
    if(coin1.collected == true && gameState == 4){
      //Load Won Game
      //Set state to level 5
      score = 400;
      println("you win!");
      println("score "+ score);
      
      gameState = 5;
      bg = loadImage("bg5.png");
      p1 = new Player(50, height/2, 60, 60);
      
      plat1 = new Platform(100, height/2);
      plat2 = new Platform(200, height/2);
      plat3 = new Platform(300, height/2);
      plat4 = new Platform(400, height/2);
      plat5 = new Platform(500, height/2);
      plat6 = new Platform(600, height/2);
      plat7 = new Platform(700, height/2);
      plat8 = new Platform(800, height/2);
      plat9 = new Platform(900, height/2);
      plat10 = new Platform(1000, height/2);
      plat11 = new Platform(1100, height/2);
      plat12 = new Platform(1200, height/2);
      
      platformList = new ArrayList<Platform>();
 
      platformList.add(plat1);
      platformList.add(plat2);
      platformList.add(plat3);
      platformList.add(plat4);
      platformList.add(plat5);
      platformList.add(plat6);
      platformList.add(plat7);
      platformList.add(plat8);
      platformList.add(plat9);
      platformList.add(plat10);
      platformList.add(plat11);
      platformList.add(plat12);
      
      spikeList.clear();
      coin1 = new Coin(10000, 10000);
    } 
  }
  
}



void keyPressed(){
  if (key == 'a'){
    p1.isMovingLeft = true;
  }
 
  if (key == 'd'){
  p1.isMovingRight = true;
  }
  if(gameState == 0 && key == ' '){
  //setup level 1
  gameState = 1; println("level 1 collect the coin!"); 
  bg = loadImage("bg.png"); 
  p1 = new Player(150, 400, 60, 60); 
  
  plat1 = new Platform(width/2 - 200, 650); 
  plat2 = new Platform(width/2, 550); 
  plat3 = new Platform(width/2 + 200, 450); 
  plat4 = new Platform(width/2 + 400, 350); 
  plat5 = new Platform(width/2 - 500, 650); 
 
  platformList = new ArrayList<Platform>(); 
  spikeList = new ArrayList<Spike>(); 
 
  
  platformList.add(plat1); 
  platformList.add(plat2); 
  platformList.add(plat3); 
  platformList.add(plat4); 
  platformList.add(plat5); 
 
  jumpSound = new SoundFile(this, "jump.mp3"); 
  jumpSound.rate(1); 
 
  bgm = new SoundFile(this, "bgm.mp3"); 
  bgm.rate(1); 
  bgm.loop(); 
 
  spikeList.add(new Spike(width/2 - 200, 620)); 
  spikeList.add(new Spike(width/2 + 200, 420)); 
  loadSpikeFloor(); 
  coin1 = new Coin(width/2 + 400, 300);
  
}
 
   if (key == 'w' && p1.isJumping == false && p1.isFalling == false){
   p1.isJumping = true;
   p1.highestY = p1.y - p1.jumpHeight;
   jumpSound.play();
  }
}

void keyReleased(){
  if (key == 'a'){
    p1.isMovingLeft = false;
  }
 
  if (key == 'd'){
  p1.isMovingRight = false;
  }
}


void playerScoreScreen(){
   text("Score "+ score, width/2 - 480, height/2 - 330);
} 

void loadSpikeFloor(){
   int spikeX = 20;
   for(int x = 0; x < 24; x += 1){
    spikeList.add(new Spike(spikeX, 785));
    spikeX += 50;
  }
}

 void drawMenu(){
    fill(255);
    textAlign(CENTER);
    
    imageMode(CENTER);
    image(startImg, width/2, height/2);
 }
