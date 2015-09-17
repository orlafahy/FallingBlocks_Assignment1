class enemy 
{
  float enemyX = random(600);
  float enemyY = random(-height);

  void fall() 
  {
    enemyY += speed1;

   if(enemyY > height)
   {
     enemyX = random(0, width - size);
     enemyY = random(-500);
   }
  }
    
  void show()
  {
    image(decepticons, enemyX, enemyY, size, size);
  }
}
