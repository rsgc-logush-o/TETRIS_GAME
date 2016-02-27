boolean isTrue[][];

boolean[][][] blockMaps = 

{
  { 
    
   {true, true}, 
   {true, true},
   {false, false},  
   {false, false}
  },
  
  {
   {true, false},
   {true, false},
   {true, false},
   {true, false}
  },
  
  {
   
   {true, true},
   {true, false},
   {true, false},
   {false, false}
  },
  
  {
   
   {true, false},
   {true, false},
   {true, true},
   {false, false}
  },
  
  {
   
   {true, false},
   {true, true},
   {true, false},
   {false, false}
  },
  
  {
   
   {true, false},
   {true, true},
   {false, true},
   {false, false}
  },
  
  {
   
   {false, true},
   {true, true},
   {true, false},
   {false, false}
  }
  
};

boolean stopped[][];

int blockDimensionsX[][] =
{
  {2, 2, 2, 2},
  {4, 1, 4, 1},
  {3, 2, 3, 2},
  {3, 2, 3, 2},
  {3, 2, 3, 2},
  {3, 2, 3, 2},
  {3, 2, 3, 2}
};

int blockDimensionsY[][] =
{
  {2, 2, 2, 2},
  {1, 4, 1, 4},
  {2, 3, 2, 3},
  {2, 3, 2, 3},
  {2, 3, 2, 3},
  {2, 3, 2, 3},
  {2, 3, 2, 3}
};

int rotation;

boolean isActive;
int whichBlock;
int activeBlockX;
int activeBlockY;

int timePassed;
int timeDiff = 200;
int prevTime;

int prevSquares[][][];
void setup()
{
  
 
 isTrue = new boolean[16][24];
 stopped = new boolean[16][24];
 
 
 
 size(680, 721); 
}

void draw()
{
 background(255);
 
 fill(200);
 
 noStroke();
 
 rect(480, 0, 200, 721);
 
 stroke(255);
 
 if(!isActive)
 {
   //println("isActive set false");
  whichBlock = randomBlock();
  //println(whichBlock);
  rotation = 0;
  activeBlockX = 5;
  activeBlockY = 1;
  isActive = true;
 }
 
 //println(activeBlockY);
 //println(activeBlockY);
 //println();
if(isActive)
{
 for(int i = 0; i < blockDimensionsX[whichBlock][rotation]; i++)
 {
  for(int j = 0; j < blockDimensionsY[whichBlock][rotation]; j++)
  {
     if(rotation == 0)isTrue[activeBlockX + i][activeBlockY + j] |= blockMaps[whichBlock][i][j];
     else if(rotation == 1)isTrue[activeBlockX + i][activeBlockY + j] |= blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][i];
     else if(rotation == 2)isTrue[activeBlockX + i][activeBlockY + j] |= blockMaps[whichBlock][i][blockDimensionsY[whichBlock][rotation] - j - 1];
     else if(rotation == 3)isTrue[activeBlockX + i][activeBlockY + j] |= blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][blockDimensionsX[whichBlock][rotation] - i - 1];
   }
}
}
 for(int i = 0; i < 16; i++)
 {
  for(int j = 0; j < 24; j++)
  {
   if(isTrue[i][j])fill(255);
   else fill(0);
   rect(i * 30, j * 30, 30, 30); 
  }
 }
 
 if(isActive)
 {
   if(activeBlockY == 24 - blockDimensionsY[whichBlock][rotation])isActive = false;
   else
   {
  for(int i = 0; i < blockDimensionsX[whichBlock][rotation]; i++)
  {
   for(int j = 0; j < blockDimensionsY[whichBlock][rotation]; j++)
   {
    if(rotation == 0)
    {
     if(j == blockDimensionsY[whichBlock][rotation] - 1)
     {
      if(isTrue[activeBlockX + i][activeBlockY + j + 1] && blockMaps[whichBlock][i][j])isActive = false; 
     }else
     {
      if(isTrue[activeBlockX + i][activeBlockY + j + 1] && blockMaps[whichBlock][i][j] && !blockMaps[whichBlock][i][j + 1]) isActive = false;
     }
    }else if(rotation == 1)
    {
      if(j == blockDimensionsY[whichBlock][rotation] - 1)
      {
       if(isTrue[activeBlockX + i][activeBlockY + j + 1] && blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][i])
       {
         println(1);
       isActive = false;
       }
      }else
      {
       
       if(isTrue[activeBlockX + i][activeBlockY + j + 1] && blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][i] && !blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 2][i])
       {
       isActive = false; 
       }
      }
    }else if(rotation == 2)
    {
     if(j == blockDimensionsY[whichBlock][rotation] - 1)
     {
      if(isTrue[activeBlockX + i][activeBlockY + j + 1] && blockMaps[whichBlock][i][blockDimensionsY[whichBlock][rotation] - j - 1]) isActive = false;
     }else
     {
      if(isTrue[activeBlockX + i][activeBlockY + j + 1] && blockMaps[whichBlock][i][blockDimensionsY[whichBlock][rotation] - j - 1] && !blockMaps[whichBlock][i][blockDimensionsY[whichBlock][rotation] - j - 2])isActive = false; 
     }
    }else if(rotation == 3)
    {
     if(j == blockDimensionsY[whichBlock][rotation] - 1)
     {
       println('k');
      if(isTrue[activeBlockX + i][activeBlockY + j] && blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][blockDimensionsX[whichBlock][rotation] - i - 1])
      {
        println("wee" + j);
      //isActive = false; 
      }
     }else
     {
       //println(blockDimensionsY[whichBlock][rotation] - j - 2);
      if(isTrue[activeBlockX + i][activeBlockY + j] && blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][blockDimensionsX[whichBlock][rotation] - i - 1] && !blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 2][blockDimensionsX[whichBlock][rotation] - i - 1])
      {
        println(isTrue[activeBlockX + i][activeBlockY + j]);
        println(blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][blockDimensionsX[whichBlock][rotation] - i - 1]);
        println(blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 2][blockDimensionsX[whichBlock][rotation] - i - 1]);
      //isActive = false;
      }
     }
    }
   }
  }
   }
 }
 
 if(isActive)
 {
  for(int i = 0; i < blockDimensionsX[whichBlock][rotation]; i++)
  {
   for(int j = 0; j < blockDimensionsY[whichBlock][rotation]; j++)
   {
    if(rotation == 0) isTrue[activeBlockX + i][activeBlockY + j] &= !blockMaps[whichBlock][i][j]; 
    else if(rotation == 1)isTrue[activeBlockX + i][activeBlockY + j] &= !blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][i];
    else if(rotation == 2)isTrue[activeBlockX + i][activeBlockY + j] &= !blockMaps[whichBlock][i][blockDimensionsY[whichBlock][rotation] - j - 1];
    else if(rotation == 3)isTrue[activeBlockX + i][activeBlockY + j] &= !blockMaps[whichBlock][blockDimensionsY[whichBlock][rotation] - j - 1][blockDimensionsX[whichBlock][rotation] - i - 1];
   }
  }
 }
 
 
 timePassed = millis();
 if(timePassed - prevTime > timeDiff && isActive)
 {
   
   if(activeBlockY != 24 - blockDimensionsY[whichBlock][rotation])
   {
     
     activeBlockY++;
   }
   else 
   {
     //println(142);
     //isActive = false;
   }
   prevTime = millis();
 }
 
}


int randomBlock()
{
 return (int)random(0, 7); 
}

void keyPressed()
{
 if(keyCode == LEFT && activeBlockX > 0)activeBlockX--;
 else if(keyCode == RIGHT && activeBlockX < 16 - blockDimensionsX[whichBlock][rotation])activeBlockX++;
 else if(key == 'q')
 {
  if(rotation == 0)rotation = 3;
  else rotation--;
 }else if(key == 'e')
 {
  if(rotation == 3)rotation = 0;
  else rotation++;
 }
}