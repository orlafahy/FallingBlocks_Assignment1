void gameover()
{
  background(bg2);

  int centx = (width/2 - 50);
  int centy = (height/2);
 
  fill(0 ,0, 255); 
  stroke(255);
  rect(150, centy, 200, 70);
  fill(255);
  textSize(15);
  text("Instructions", centx+10, centy+40);
  
  fill(0, 0, 255); 
  stroke(255);
  rect(150, centy+100, 200, 70);
  fill(255);
  textSize(15);
  text("Play Again", centx+10, centy+140);
  
  fill(0, 0, 255); 
  stroke(255);
  rect(150, centy+200, 200, 70);
  fill(255);
  textSize(15);
  text("Exit", centx+30, centy+240);
  
  fill(0,0,255);
  textSize(40);
  text("Your Score:", width/2 - 155, height/2 - 70);
  textSize(40);
  text(point, width/2 + 70, height/2 - 70);
   
   if(a==false)
   {
      a = true;
      newgame();
      state = 1;
   }
   if(b == false)
   {
      b = true;
      newgame();
   }
   if(c == false)
   {
      c = true;
      exit();
   }
}

boolean a = true;
boolean b = true;
boolean c = true;

void mousePressed()
{
  
  int centx = (width/2 - 50);
  int centy = (height/2);
  
  //check for mouse click on all three buttons
  if(mouseX > 150 && mouseX < 350 && mouseY > centy && mouseY < centy + 70)
  {
    a=!a;
  } 
  
  if(mouseX > 150 && mouseX < 350 && mouseY > centy+100 && mouseY < (centy+100) + 70)
  {
    b=!b;
  } 
  
  if(mouseX > 150 && mouseX < 350 && mouseY > centy+200 && mouseY < (centy+200) + 70)
  {
    c=!c;
  } 
  
}
