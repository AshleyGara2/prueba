//modulo ClickItem
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 08 de noviembre de 2021
//Fecha de ultima modificación: 
//Comentario:

class ClickItem{
  int cx;
  int cy;
  int an;
  int al;
  int t;
  
  ClickItem(int x, int y, int b, int a, int s){
    cx=x;
    cy=y;
    an=b;
    al=a;
    t=s;
  }
  void display(){
    textAlign(CENTER,CENTER);
    image(getItemImage(t),cx,cy);
  }
  
  boolean isClicked(int x, int y){
    boolean r=(((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2))));
    if(r)
      sfxclick.play();
    return r;
  }
  
  PImage getItemImage(int i){
    PImage p=null;
    switch(i){
      case ITPTN: p=imgpotn; break;
      case ITFPT: p=imgfptn; break;
      case ITTNC: p=imgtonic; break;
    }
    return p;
  }
  
}
