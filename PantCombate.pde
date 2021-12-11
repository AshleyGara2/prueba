//PantCombate
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 20 de septiembre de 2021
//Fecha de ultima modificación: 13 de noviembre de 2021

class PantCombate{
  PImage pasto;
  PImage desrt;
  PImage woods;
  Boton btnback;
  Boton btnatk;
  Boton btndef;
  Boton btnitem;
  boolean battleactive;
  boolean actionactive;
  Enemigo enemy;
  CoolDownTimer cdt;
  boolean turn;
  int action;
  
  PantCombate(){
    pasto=loadImage("sprite/backgr/pasto_ok.png");
    desrt=loadImage("sprite/backgr/desierto_ok.png");
    woods=loadImage("sprite/backgr/bosque_ok.png");
    btnback=new Boton(400,700,200,100,5);
    btnatk=new Boton(250,550,150,80,30);
    btndef=new Boton(450,550,150,100,31);
    btnitem=new Boton(650,550,150,100,32);
    btnback.activate();
    battleactive=BATTLEOFF;
    actionactive=ACTOFF;
    cdt=new CoolDownTimer(180);
  }
  
  void display(){
    startBattle();
    selectBgr(pers.terr);
    fill(255);
    text(lf.showString(7), 400, 100);
    displayPlanoControl();
    displayPlanoBatalla();
    displayPlanoHUD();
    if(cdt.isActive())
      cdt.coolingDown();
     if(pers.cdtturn.isOff()){
       btnatk.activate();
       btndef.activate();
       btnitem.activate();
       if(enemy.cdtturn.isActive()){
         enemy.cdtturn.toggleCoolDown();
       }
    }
    if(enemy.cdtturn.isOff()){
      if(pers.cdtturn.isActive()){
        pers.cdtturn.toggleCoolDown();
      }
      enemyAction();
    }
    if(cdt.isActive())
      cdt.coolingDown();
    if(cdt.isOff()){
      if(turn)
        endAction();
      else
        enemyEndAction();
        
    }
  }
  
  void selectBgr(int t){
    switch(t){
      case CLBSQ: background(woods);
                  break;
      case CLPST: background(pasto);
                  break;
      case CLTRR: background(desrt);
                  break;
      
    }
  }
  
  void displayPlanoControl(){
    btnback.display();
    btnatk.display();
    btndef.display();
    btnitem.display();
  }
  void displayPlanoBatalla(){
    pers.battleDisplay();
    displayEnemis();
  }
  void displayPlanoHUD(){}
  
  void mouseProcess(int x, int y, int b){
    if(btnback.isClicked(x,y)&& b==LEFT){
      gc.musicManager(MSCOFF);
      battleactive=BATTLEOFF;
      gc.setPantAct(PNMAP);  
    }
    if(!actionactive && btnatk.isClicked(x,y)&& b==LEFT){
      println("Ataque");
      btnatk.toggleMark();
      toggleAction();
      combatAction(ACATK);
      
    }
    if(!actionactive && btndef.isClicked(x,y)&& b==LEFT){
      println("Defensa");
      btnatk.toggleMark();
      toggleAction();
      combatAction(ACDEF);
      
    }
    if(!actionactive && btnitem.isClicked(x,y)&& b==LEFT){
      println("Defensa");
      btnatk.toggleMark();
      toggleAction();
      combatAction(ACITM);
      
    }
  }
  
  void startBattle(){
    if(!battleactive){
      createEnemis();
      battleactive=BATTLEON;
      turn=TURNP;
      pers.activateCombat();
      enemy.activateCombat();
    }
  }
  
  void createEnemis(){
    enemy=new Enemigo(pers.terr);
  }
  void displayEnemis(){
    enemy.display();
  }
  
  void toggleAction(){
    actionactive=!actionactive;
  }
  
  void combatAction(int a){
    action=a;
    switch(action){
      case ACATK: println("accion deAtaque"); break;
      case ACDEF: println("accion de defensa"); break;
      case ACITM: println("accion de item"); break;
    }
    cdt.activate();
  }
  
  void endAction(){
    println("Fin de accion");
    btnatk.deactive();
    btndef.deactive();
    btnitem.deactive();
    toggleMarks();
    pers.cdtturn.activate();
    toggleAction();
    enemy.cdtturn.toggleCoolDown();
    toggleTurn();
  }
  void toggleTurn(){
    turn=!turn;
  }
  
  void enemyAction(){
    println("Accion del enemigo");
    cdt.activate();
  }
  
  void enemyEndAction(){
    println("Find de accion del enemino");
    enemy.cdtturn.activate();
    pers.cdtturn.toggleCoolDown();
    toggleTurn();
  }
  void toggleMarks(){
    switch(action){
      case ACATK: btnatk.toggleMark(); break;
      case ACDEF: btndef.toggleMark(); break;
      case ACITM: btnitem.toggleMark();
    }
  }
}
