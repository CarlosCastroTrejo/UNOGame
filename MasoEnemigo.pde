class MasoEnemigo
{
  PImage background;
  Carta[] masoEnemigo = new Carta[5];
  
  void setup()
  {
    for(int x=0;x<5;x++)
    {
       int y=(int)random(0,9);
      int z=(int)random(1,4);
      Carta card = new Carta(y,z,true);
      masoEnemigo[x]=card;
      masoEnemigo[x].setup();
    }
  }  
  
  void draw()
  {
     for(int x=0;x<masoEnemigo.length;x++)
    {
      masoEnemigo[x].enemigo=true;
      masoEnemigo[x].setup();
      masoEnemigo[x].draw(30+x*(760/masoEnemigo.length),20);
    }
  }
  
   void tomarCarta(Carta[]baraja)
  {
     int carta=(int)random(0,39);
      masoEnemigo = (Carta[]) append(masoEnemigo,baraja[carta]);
      masoEnemigo[masoEnemigo.length-1].enemigo=true;
      masoEnemigo[masoEnemigo.length-1].setup();
    for(int x=0;x<masoEnemigo.length;x++)
    {
      masoEnemigo[x].y=20;
    }
  }
  
  
 
  
  void QuitarCarta(int x)
  {
   
       for( int y=x;y<masoEnemigo.length-1;y++)
       {
         masoEnemigo[y]= masoEnemigo[y+1];
          masoEnemigo[y]= masoEnemigo[y+1];
       }
     masoEnemigo = (Carta[]) shorten(masoEnemigo);

  }
  
  
  
  Carta[] getCarta()
  {
  return masoEnemigo;
  }


}
