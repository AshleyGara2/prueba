//Boton
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 27 de septiembre de 2021
//Fecha de ultima modificación: 16 de octubre de 2021
//Comentario:

class Boton{
  int cx;
  int cy;
  int an;
  int al;
  int t;
  boolean active;  //true=visible false=invisible
  boolean marked;
  
  Boton(int x, int y, int b, int a, int s){
    cx=x;
    cy=y;
    an=b;
    al=a;
    t=s;
    active=false;
    marked=false;
  }
  void display(){
    if(active){
      rectMode(CENTER);
      fill(color(255,48,35));
      stroke(color(234, 239, 34));
      rect(cx, cy, an, al);  //Coordenadas para centrar boton
      fill(255);
      textAlign(CENTER,CENTER);
      text(lf.showString(t),cx,cy);
      if(marked){
        noFill();
        stroke(color(0,250,0));
        strokeWeight(10);
        rect(cx,cy,an,al);
        strokeWeight(1);
      }
    }
  }
  void activate(){
    active=true;
  }
  void deactive(){
    active=false;
  }
  void toogle(){
    active=!active;
  }
  boolean isClicked(int x, int y){
    boolean r=(((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2))));
    if(r)
      sfxclick.play();
    return r;
  }
  
  void toggleMark(){
    marked=!marked;
  }
}
