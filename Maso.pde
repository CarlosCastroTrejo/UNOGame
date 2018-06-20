class Maso
{
  PImage background;
  Carta[] maso = new Carta[5];
  
  void setup()
  {
    for(int x=0;x<5;x++)
    {
      Carta card = new Carta(x,5,true);
      maso[x]=card;
      maso[x].setup();
    }
  }  
  void draw()
  {
     for(int x=0;x<maso.length;x++)
    {
      maso[x].draw(900+(x*6),250);
    }
  }
 
  int posicionX()
  {
   return maso[4].posicionX();
  }
   int posicionY()
  {
   return maso[4].posicionY();
  }
  

}
