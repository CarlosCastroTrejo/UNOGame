class MasoJugador
{
  PImage background;
  Carta[] masoJugador = new Carta[5];
  int icontador1=0;
  
  void setup(Carta[]baraja)
  {
    for(int x=0;x<masoJugador.length;x++)
    {
      int carta=(int)random(0,39);
      masoJugador[x]=baraja[carta];
      masoJugador[x].setup();
      masoJugador[x].y=480;
    }
  }  
  
  
  
  void draw()
  {
     for(int x=0;x<masoJugador.length;x++)
    {
      masoJugador[x].enemigo=false;
      masoJugador[x].setup();
      masoJugador[x].draw(30+x*(760/masoJugador.length),480);
    }
  }
  
  
  void tomarCarta(Carta[]baraja)
  {
     int carta=(int)random(0,39);
      masoJugador = (Carta[]) append(masoJugador,baraja[carta]);
      for(int x=0;x<masoJugador.length;x++)
      {
        masoJugador[x].y=20;
        masoJugador[x].enemigo=false;
        masoJugador[x].setup();
      }
     
  }
  

  void QuitarCarta(int x)
  {
  
       for( int y=x;y<masoJugador.length-1;y++)
       {
         masoJugador[y]= masoJugador[y+1];
         masoJugador[y].setup();
       }
         masoJugador = (Carta[]) shorten(masoJugador);

  }
  
  
  
Carta[] getCarta()
{
  return masoJugador;
}

  

}
