class collect
{
  float pointsX = random(600);
  float pointsY = random(-height);
  
  void fall() 
  {
    pointsY += speed1;
    if(pointsY > height)
    {  
      pointsX = random(width - size);
      pointsY = random(-1000);
    }
  }
      
  void show()
  {
    image(autobots, pointsX, pointsY, size, size);
  }
}

