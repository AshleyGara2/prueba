//PantCreacion
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 20 de septiembre de 2021
//Fecha de ultima modificación: 08 de noviembre de 2021

class PantCreacion{
  Boton btnatkp;
  Boton btndefp;
  Boton btnhpmp;
  Boton btnatkm;
  Boton btndefm;
  Boton btnhpmm;
  Boton btnexit;
  Boton btnplay;
  
  PImage imgcreat;
  int ppa;
  int minatr;
  int maxatr;
  boolean rst;
  int atk;
  int def;
  int hpm;  
  
  PantCreacion(ConfigFile cf){
    btnatkp=new Boton(630,250,50,50,17);
    btnatkm=new Boton(200,250,50,50,18);
    btndefp=new Boton(630,310,50,50,17);
    btndefm=new Boton(200,310,50,50,18);
    btnhpmp=new Boton(630,370,50,50,17);
    btnhpmm=new Boton(200,370,50,50,18);
    btnexit=new Boton(200,600,200,100,5);
    btnplay=new Boton(600,600,200,100,2);
    btnatkp.activate();
    btnatkm.activate();
    btndefp.activate();
    btndefm.activate();
    btnhpmp.activate();
    btnhpmm.activate();
    btnexit.activate();
    //btnplay.activate();
    imgcreat=loadImage("sprite/backgr/creation.jpg");
    ppa=cf.ppa;
    atk=def=hpm=minatr=cf.minatr;
    maxatr=cf.maxatr;
    rst=false;
    //ppa=5;
    //atk=2;
    //def=2;
    //hpm=2; 
  }
  
  void display(){
    if(rst){
      resetAttr();
      rst=false;
    }
    music();
    background(imgcreat);
    fill(255);
    btnatkp.display();
    btnatkm.display();
    btndefp.display();
    btndefm.display();
    btnhpmp.display();
    btnhpmm.display();
    btnexit.display();
    btnplay.display();
    textAlign(CENTER,CENTER);
    text(lf.showString(9), 400, 100);
    text(lf.showString(22)+ppa, 400, 500);
    textAlign(LEFT,CENTER);
    text(lf.showString(19), 50, 250);
    text(lf.showString(20), 50, 310);
    text(lf.showString(21), 50, 370);
    imageMode(CENTER);
    for(int i=0;i<atk;i++)
      image(imgatk,260+50*i,250);
    for(int i=0;i<def;i++)
      image(imgdef,260+50*i,310);
    for(int i=0;i<hpm;i++)
      image(imghpm,260+50*i,370);
  }
  void mouseProcess(int x, int y, int b){
    if(btnatkp.isClicked(x,y) && b==LEFT)
      addPoint(ATATK);
    if(btnatkm.isClicked(x,y) && b==LEFT)
      subPoint(ATATK);
    if(btndefp.isClicked(x,y) && b==LEFT)
      addPoint(ATDEF);
    if(btndefm.isClicked(x,y) && b==LEFT)
      subPoint(ATDEF);
    if(btnhpmp.isClicked(x,y) && b==LEFT)
      addPoint(ATHPM);
    if(btnhpmm.isClicked(x,y) && b==LEFT)
      subPoint(ATHPM);
    if(btnexit.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      rst=true;
      gc.setPantAct(PNINT);
    }
    if(btnplay.isClicked(x,y) && b==LEFT){
      pers=new Personaje(atk, def, hpm, cf.cash, 4 ,5);
      rst=true;
      gc.setPantAct(PNMAP);
    }
    
  }
  void addPoint(int a){
      if(ppa>0 && getAttr(a)<maxatr){
        modAttr(a,ATUP);
        ppa--;
      }
      if(ppa==0)
        btnplay.activate();
    }
  
    void subPoint(int a){
      if(getAttr(a)>minatr){
        modAttr(a,ATDN);
        ppa++;
      }
      if(ppa>0)
        btnplay.activate();
    }
    
    int getAttr(int a){
      return (a==ATATK)?atk:(a==ATDEF)?def:hpm;
    }
    
    void modAttr(int a, boolean e){
      switch(a){
        case ATATK: atk+=(e)?1:-1;
                    break;
        case ATDEF: def+=(e)?1:-1;
                    break;
        case ATHPM: hpm+=(e)?1:-1;
                    break;
      }
    }
    
    void resetAttr(){
      btnplay.deactive();
      ppa=cf.ppa;
      atk=def=hpm=minatr;
    }
}
