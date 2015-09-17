/* Assignment 1 Processing
   Falling blocks game
   Orla Fahy C13520633 */

//-------------------------------Global Variables---------------------------
// Declare and create arrays for falling objects
enemy[] enemies= new enemy[6];
collect[] collection = new collect[2];
fast[] extra = new fast[2];

int width = 500;
int height = 600;
int size = 50;
float playerx = 250;
float playery = height - size;
float lifeX = random(500);
float lifeY = random(-height);

int state;
int plays = 0;
int lives = 3;
int point = 0;
int directionX = 0;
int speed = 2;
float speed1 = 3;

//declare all images and font used
PImage menu;
PImage instructions; 
PImage bg;
PImage bg2;
PImage autobots;
PImage decepticons;
PImage prime;
PImage life;
PFont font;

//--------------------------------------------------------------------------

void setup()
{
   state = 1;
   size(width, height);         
    
   //load all images and font
   menu = loadImage("Transformers.jpg");
   instructions = loadImage("Instructions.jpg");
   bg = loadImage("mainbg.png");
   bg2 = loadImage("endbg.jpg");
   autobots = loadImage("autobots.png");
   decepticons = loadImage("decepticons.png");
   prime = loadImage("Prime.png");
   life = loadImage("life.png");
   font = createFont("Transformers_Movie.ttf", 15);
 
   //background(255);
   //Loop through array to create each falling object
   for (int i = 0; i < enemies.length; i++)
   {
     enemies[i] = new enemy();
   }
 
   for (int i = 0; i < collection.length; i++)
   {
     collection[i] = new collect();
   }
 
   for (int i = 0; i < extra.length; i++)
   {
     extra[i] = new fast();
   }   
}

void draw()
{
  //displays start screen
  if(state == 1)
  {
    splashscreen();
    if(plays == 1)
    {
      instructions();
    }
  }
  
  //Displays end game and menu
  if(state == 2)
  {
    gameover();
  }
  
  //starts game play
  if(state == 3)
  {
    background(bg);
    textSize(18);
    fill(255);
    text("Points:", 10, 20);
    text(point, 70, 20);
    text("Lives:", 10, 40);
    text(lives, 60, 40);
   
    //change position of player
    playerx += (speed * directionX);
 
    // check boundaries of screen
    if ((playerx>(width-size)) || (playerx<0))
    {  
      directionX=0; //Stop player from moving off edge of the screen
    }
   
    //draw player
    image(prime, playerx, playery, size, size);
    
    //constantly increment the speed of the falling objects
    for(int i = 0 ; i < 20 ; i++)
    {
      if(i == 19)
      {
        speed1 = speed1 + .0002;
      }
    }
        
    //loop to display extra lives, less often than other falling objects
    for(int i = 0 ; i < 20 ; i++)
    {
      if(i == 19)
      {
        lifeY += 4;
        if(lifeY > height)
        {
          lifeX = random(width - size);
          lifeY = random(-4000, -6000);
        }
        image(life, lifeX, lifeY, size, size);
      }
    }
 
 
    //Loop through array to display objects to avoid.
    for (int i = 0; i < enemies.length; i++)
    {
      enemies[i].fall();
      enemies[i].show(); 
    }
 
    //Loop through array to display objects to collect.
    for (int i = 0; i < collection.length; i++)
    {
      collection[i].fall();
      collection[i].show();
    }
    
    //Loop through array to display faster falling objects to be avoided.
    for (int i = 0; i < extra.length; i++)
    {
      extra[i].fall();
      extra[i].show();
    }
     
    //checking for collision with enemy
    for(int i = 0; i < enemies.length; i++)
    {
      if(dist(playerx, playery, enemies[i].enemyX, enemies[i].enemyY) <= size || dist(playerx + size, playery, enemies[i].enemyX + size, enemies[i].enemyY) <= size)
      {
        lives = lives - 1;      
        enemies[i].enemyY = random(-height);
        enemies[i].enemyX = random(0, width-size);
      }
    
      //check to see if players lives have reached 0
      if(lives == 0)
      { 
        //changes state to 2, to call the end screen 
        state = 2;
      }
    }
  
    //checking for collision between player and objects to collect
    for(int i = 0; i < collection.length; i++)
    {
      if(dist(playerx, playery, collection[i].pointsX, collection[i].pointsY) <= size || dist(playerx + size, playery + size, collection[i].pointsX + size, collection[i].pointsY + size) <= size)
      {
        point = point + 1;
        collection[i].pointsY = random(-height);
        collection[i].pointsX = random(0, width-size);
      }
    }

    //checking for collision between faster moving objects to avoid and the player
    for(int i = 0; i < extra.length; i++)
    {
      if(dist(playerx, playery, extra[i].fastX, extra[i].fastY) <= size || dist(playerx + size, playery + size, extra[i].fastX + size, extra[i].fastY + size) <= size)
      {
        lives = lives - 1;
        extra[i].fastY = random(-height);
        extra[i].fastX = random(0, width-size);
      }
    }
  
    //check for collision between player and extra lives
    if(dist(playerx, playery, lifeX, lifeY) <= size || dist(playerx + size, playery, lifeX + size, lifeY) <= size)
    {
      lives = lives + 1;
      lifeY = random(-height);
      lifeX = random(0, width-size);
    }
  }
}


void keyPressed()
{
  //move player left
  if (keyCode == LEFT)
  {
    directionX = -1;
  }
  //move player right
  else if (keyCode == RIGHT)
  { 
    directionX = 1;
  }
  if (keyCode == ' ')
  {
    state = 3;
  }
  if(keyCode == UP)
  {
    plays = 1;
  }
}

void keyReleased()
{
   if(keyCode == LEFT)
  {
     directionX = 0;
  }
  if(keyCode == RIGHT)
  {
     directionX = 0;
  }
}
