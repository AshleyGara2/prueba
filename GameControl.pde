//GameControl
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 20 de septiembre de 2021
//Fecha de ultima modificación: 6 de noviembre de 2021
//Comentario:

class GameControl{
  PantCarga pncrg;
  PantCombate pncbt;
  PantConfig pncfg;
  PantCreacion pncre;
  PantCreditos pncrd;
  PantFinJgo pnfin;
  PantIntro pnint;
  PantLvLUp pnlvl;
  PantMapa pnmap;
  PantPausa pnpau;
  PantTienda pntnd;
  int pantact = PNCRG;
  boolean musicon;
  
  GameControl(){
    pncrg = new PantCarga();
    pncbt = new PantCombate();
    pncfg = new PantConfig();
    pncre = new PantCreacion(cf);
    pncrd = new PantCreditos();
    pnfin = new PantFinJgo();
    pnint = new PantIntro();
    pnlvl = new PantLvLUp();
    pnmap = new PantMapa();
    pnpau = new PantPausa();
    pntnd = new PantTienda();
    pantact = PNCRG;
    musicon=false;
  }

void display(){
  switch(pantact){
     case PNCRG: pncrg.display();
                 break;
     case PNCBT: pncbt.display();
                 break;
     case PNCFG: pncfg.display();
                 break;
     case PNCRE: pncre.display();
                 break;
     case PNCRD: pncrd.display();
                 break;
     case PNFIN: pnfin.display();
                 break;
     case PNINT: pnint.display();
                 break;
     case PNLVL: pnlvl.display();
                 break;           
     case PNMAP: pnmap.display();
                 break;
     case PNPAU: pnpau.display();
                 break;
     case PNTND: pntnd.display();
                 break;
  }
}

  void sigpant(){
    pantact++;
    
    if(pantact ==12)
        pantact = 1; 
   
  }

  void antpant(){
    pantact--;
    if(pantact ==0)
        pantact = 11; 
   
  }
  
  void setPantAct(int p){
    pantact=p;
  }

  void mouseProcess(int x, int y, int b){
    switch(pantact){
      case PNCBT: pncbt.mouseProcess(x,y,b);
                  break;
      case PNCFG: pncfg.mouseProcess(x,y,b);
                  break;
      case PNCRE: pncre.mouseProcess(x,y,b);
                  break;
      case PNINT: pnint.mouseProcess(x,y,b);
                  break;
      case PNPAU: pnpau.mouseProcess(x,y,b);
                  break;
      case PNTND: pntnd.mouseProcess(x,y,b);
                  break;
      default: if(b==LEFT)
                sigpant();
 
                if(b==RIGHT)
                antpant();
    }
  }
  
  void keyProcess(char k){
    switch(pantact){
      case PNMAP:pnmap.keyProcess(k);
      default:  if(k=='+')
                  sigpant();
                if(k=='-')
                  antpant();
    }
  }
  
  void musicManager(boolean s){
    musicon=s;
    playTrack((musicon?pantact:0));
  }
  
  void playTrack(int t){
    if(t==PNCRE)msccreat.loop(); else {msccreat.pause();msccreat.rewind();}
    if(t==PNINT)mscintro.loop(); else {mscintro.pause();mscintro.rewind();}
    if(t==PNTND)mscstore.loop(); else {mscstore.pause();mscstore.rewind();}
  }
  
  boolean getMusicStatus(){
    return musicon;
  }
}
