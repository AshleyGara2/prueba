//PantPausa
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 20 de septiembre de 2021
//Fecha de ultima modificación: 1 de nomviembre de 2021

class PantPausa{
  Boton btnexit;
  Boton btncont;
  
  PantPausa(){
    btnexit=new Boton(200,600,200,100,23);
    btncont=new Boton(600,600,200,100,5);
    btnexit.activate();
    btncont.activate();
  }
  
  void display(){
    fill(255);
    text(lf.showString(15), 400, 100);  
    btnexit.display();
    btncont.display();
  }
  
  void mouseProcess(int x, int y, int b){
    if(btnexit.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setPantAct(PNINT);
    }
    if(btncont.isClicked(x,y) && b==LEFT){
      gc.pnmap.toggleBlur();
      gc.setPantAct(PNMAP);
    }
  }
}
