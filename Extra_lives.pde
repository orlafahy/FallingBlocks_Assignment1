class fast
{
  //set items in the array to a random x, and y value off screen
  float fastX = random(500);
  float fastY = random(-height);
  //set the speed for the falling objects
  int speed = 6;

  void fall()
  {
    //increment the y value by the speed
    fastY += speed;

   if(fastY > height)
   {
     //reset x and y when bottom of the screen is passed
     fastX = random(width - size);
     fastY = random(-500);
   }
  }
   
  void show()
  {
    //display falling objects
    image(decepticons, fastX, fastY, size, size);
  }
}
