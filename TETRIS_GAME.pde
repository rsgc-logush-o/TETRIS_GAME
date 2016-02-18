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
   {false, true},
   {false, true},
   {false, true},
   {false, true}
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
int timeDiff = 1000;
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
  whichBlock = randomBlock();
  println(whichBlock);
  activeBlockX = 5;
  activeBlockY = 1;
  isActive = true;
 }
 //println(activeBlockY);
 for(int i = 0; i < blockDimensionsX[whichBlock][rotation]; i++)
 {
  for(int j = 0; j < blockDimensionsY[whichBlock][rotation]; j++)
  {
    
    isTrue[i + activeBlockX][activeBlockY - j] |= blockMaps[whichBlock][i][1-j];
    
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
 
 
 //if(activeBlockY == 23)isActive = false;
//println(activeBlockY+2);
 //if(isActive)
 //{
 //  for(int i = 0; i < 16; i++)
 //  {
 //    if(activeBlockY == 23)
 //    {
 //      println(126);
 //      isActive = false;
 //    }
 //    else if(isTrue[i][activeBlockY + 1])
 //    {
 //     isActive = false; 
 //    }
 //  }
 //}
 
 if(isActive)
 {
   if(activeBlockY == 23)isActive = false;
   
   else
   {
    for(int i = 0; i < blockDimensionsX[whichBlock][rotation]; i++)
    {
     for(int j = 0; j < blockDimensionsY[whichBlock][rotation]; j++)
     {
       if(j == 0)
       {
        if(blockMaps[whichBlock][i][j] && !blockMaps[whichBlock][i][j+1] && isTrue[activeBlockX + i][activeBlockY]) isActive = false;
       }else
       {
        if(blockMaps[whichBlock][i][j] && isTrue[activeBlockX + i][activeBlockY+1])isActive = false;
       }
     }
    }
   }
 }
 
 
 if(isActive)
 {
   for(int i = 0; i < 4; i++)
   {
    for(int j = 0; j < 2; j++)
     { 
      if(blockMaps[whichBlock][i][1-j])isTrue[i + activeBlockX][activeBlockY - j] = false;
     }
    } 
 }
 
 
 timePassed = millis();
 if(timePassed - prevTime > timeDiff && isActive)
 {
   
   if(activeBlockY < 23)
   {
     
     activeBlockY++;
   }
   else 
   {
     println(142);
     isActive = false;
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