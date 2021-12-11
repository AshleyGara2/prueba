//PantCarga
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 20 de septiembre de 2021
//Fecha de ultima modificación: 20 de septiembre de 2021
//Comentario:

class PantCarga{
  boolean loading;
  CoolDownTimer cdt;
  SpriteSet diamante;
  String message;
  
  PantCarga(){
    loading=true;
    cdt=new CoolDownTimer(300);
    diamante=new SpriteSet("sprite/diamante/","diamante",".png",6,10, true, 0);
    message=lf.showString(26);
  }
  
  void display(){
    background(0);
    fill(255);
    imageMode(CENTER);
    diamante.display(400, 350, 50, 50);
    textAlign(CENTER,CENTER);
    text(lf.showString(6),400,400);
    text(message, 400, 500);
    if(!loading && !cdt.isActive())
      cdt.activate();
    if(cdt.isActive())
      cdt.coolingDown();
     if(cdt.isOff())
       gc.setPantAct(PNINT);
  }
}
