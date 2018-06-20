Carta[] baraja = new Carta[40]; // Arreglo de baraja
Carta[] inicial =new Carta[1];
Maso maso=new Maso();
MasoJugador jugador=new MasoJugador();
MasoEnemigo enemigo=new MasoEnemigo();

int icontador=0;
int cartaIndicada=4;
boolean elegir=false;
boolean Juego=true;
int numero=0;
boolean turnoJugador=true;


void setup()
{
  size(displayWidth, displayHeight);  

  //Cargar todas las imagenes
  for (int x=1; x<5; x++)
  {
    for (int y=0; y<10; y++)
    {
      Carta card = new Carta(y, x); 
      baraja[numero]=card;
      baraja[numero].setup();
      numero++;
    }
  }

  int inicial2=(int)random(0, 39);
  inicial[0]=baraja[inicial2];
  inicial[0].setup();

  maso.setup();
  jugador.setup(baraja);
  enemigo.setup();
}


void draw()
{
  if (Juego)
  {
    icontador++;
    background(#8C2214);

    //Dibujar cartas
    inicial[0].enemigo=false;
    inicial[0].setup();
    inicial[0].draw(250, 250);
   

    maso.draw();
    jugador.draw();

    enemigo.draw();
    text(jugador.getCarta().length, 200, 200);
    text(enemigo.getCarta().length, 400, 200);

    if (turnoJugador)
    {
      if (jugador.getCarta().length==0)
      {
        Juego=false;
      }
      if (mouseX>maso.posicionX() && mouseX<maso.posicionX()+80 &&  mouseY>maso.posicionY() && mouseY<maso.posicionY()+100 )
      {
        if ( mousePressed)
        {
          icontador=0;
          jugador.tomarCarta(baraja);
        }
      }


      for (int x=0; x<jugador.getCarta().length; x++)
      {
        if (mouseX>jugador.getCarta()[x].posicionX() && mouseX<jugador.getCarta()[x].posicionX()+80 &&  mouseY>jugador.getCarta()[x].posicionY() && mouseY<jugador.getCarta()[x].posicionY()+100 && icontador>1)
        {
          if (mousePressed)
          {
            icontador=0;
            cartaIndicada=x;
            elegir=true;
            
          }
        }
      }

      if (elegir)
      {
        if (jugador.getCarta()[cartaIndicada].numeroDeCarta== inicial[0].numeroDeCarta || jugador.getCarta()[cartaIndicada].colorDeCarta== inicial[0].colorDeCarta)
        {
          icontador=0;
          elegir=false;
          inicial[0]=jugador.getCarta()[cartaIndicada];
          jugador.QuitarCarta(cartaIndicada);
          turnoJugador=false;
          cartaIndicada=0;
          
        }
        else
        {
          elegir=false;
        }
      }
    } 
    if (!turnoJugador)
    {
      if (enemigo.getCarta().length==0)
      {
        Juego=false;
      }

      for (int x=0; x<enemigo.getCarta().length; x++)
      {
        if (enemigo.getCarta()[x].numeroDeCarta== inicial[0].numeroDeCarta || enemigo.getCarta()[x].colorDeCarta== inicial[0].colorDeCarta )
        {
          icontador=0;
          elegir=false;
          inicial[0]=enemigo.getCarta()[x];
          inicial[0].colorDeCarta=enemigo.getCarta()[x].colorDeCarta;
          enemigo.QuitarCarta(x);
          turnoJugador=true;
          if (turnoJugador)
          {
            break;
          }
        }
      }
      if (!elegir)
      {
        enemigo.tomarCarta(baraja);
      }
    }
  } else
  {
    fill(250);
    textSize(50); 
    text("FIN DEL JUEGO", 250, 230);
  }
}
