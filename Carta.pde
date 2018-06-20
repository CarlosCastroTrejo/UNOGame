class Carta
{
  int numeroDeCarta;
  int colorDeCarta;
  boolean enemigo;
  
  PImage carta;
  int x,y;
  int ancho=80;
  int alto=100;
  //Constructor
  Carta(int numero,int colorDeCarta)
  {
    this.enemigo=false;
    this.numeroDeCarta=numero;
    this.colorDeCarta=colorDeCarta;
  }
   Carta(int numero,int colorDeCarta,boolean enemigo)
  {
     this.enemigo=enemigo;
    this.numeroDeCarta=numero;
    this.colorDeCarta=colorDeCarta;
  }
  
  void setup()
  {
    if(enemigo)
    {
      carta=loadImage("5.png");
    }
    if(!enemigo)
    {
      carta=loadImage(colorDeCarta+".png");
    }
  }
 
 void draw(int x,int y)
 {
   this.x=x;
   this.y=y;
   image(carta,x,y,ancho,alto);
   if(!enemigo){
   if(colorDeCarta==1)
     {
       fill(#2CA05A);
     }
     else if(colorDeCarta==2)
     {
       fill(#D40000);
     }
     else if(colorDeCarta==3)
     {
       fill(#FFCC00);
     }
      else if(colorDeCarta==4)
     {
       fill(#2A7FFF);
     }
     textSize(30);
    text(numeroDeCarta,x+30,y+60);
    
    fill(250);
    textSize(15);  
    text(numeroDeCarta,x+5,y+20);
    text(numeroDeCarta,x+65,y+90);
  }
 }
 
 int posicionX()
 {
   return x;
 }
 int posicionY()
 {
   return y;
 }
 

}



  
