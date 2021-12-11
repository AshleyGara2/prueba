//PantTienda
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 20 de septiembre de 2021
//Fecha de ultima modificación: 8 de noviembre de 2021

class PantTienda{
  Boton btncomp;
  Boton btnvend;
  Boton btncont;
  ClickItem citpotn;
  ClickItem citfptn;
  ClickItem cittonic;
  PImage tienda;
  PImage imgtrademode;
  boolean trademode;
  
  
  PantTienda(){
    btncomp=new Boton(200,600,200,100,24);
    btnvend=new Boton(600,600,200,100,25);
    btncont=new Boton(400,700,200,100,5);
    btncomp.activate();
    btnvend.activate();
    btncont.activate();
    citpotn=new ClickItem(300,270,50,50,ITPTN);
    citfptn=new ClickItem(400,270,50,50,ITFPT);
    cittonic=new ClickItem(500,270,50,50,ITTNC);
    
    tienda=loadImage("sprite/backgr/store_ok.png");
    imgtrademode= loadImage("sprite/items/trademode.png");
    trademode=TMSELL;
    btnvend.toggleMark();
  }
  
  void display(){
    music();
    background(tienda);
    fill(255);
    text(lf.showString(16), 400, 100);
    citpotn.display();
    citfptn.display();
    cittonic.display();
    btncomp.display();
    btnvend.display();
    btncont.display();
    pers.drawTradeData();
    
    if(trademode){
      flipYImage(imgtrademode, 400, 400);
    }else{
      image(imgtrademode,400,400);     
    }
    
    text("$"+(trademode?cf.potnv:cf.potnc),300,300);
    text("$"+(trademode?cf.fpotv:cf.fpotc),400,300);
    text("$"+(trademode?cf.tonicv:cf.tonicc),500,300);
  }
  
  void toggleTM(){
   trademode=!trademode;
  }
  
  void flipYImage(PImage i, int x, int y){
    pushMatrix();
    scale(1,-1);
    image(i, x, -y);
    popMatrix();
  }
 
  void mouseProcess(int x, int y, int b){
    if(btncomp.isClicked(x,y) && b==LEFT){
      btncomp.toggleMark();
      btnvend.toggleMark();
      trademode=TMBUY;
    }
    if(btnvend.isClicked(x,y) && b==LEFT){
      btnvend.toggleMark();
      btncomp.toggleMark();
      trademode=TMSELL;
    }
    if(btncont.isClicked(x,y) && b==LEFT){
      gc.musicManager(MSCOFF);
      gc.setPantAct(PNMAP);
    }
    if(citpotn.isClicked(x,y) && b==LEFT)
      trade(ITPTN);
    if(citfptn.isClicked(x,y) && b==LEFT)
      trade(ITFPT);
    if(cittonic.isClicked(x,y) && b==LEFT)
      trade(ITTNC); 
  }
  void trade(int i){
    if(trademode)
      buyItem(i);
     else
       sellItem(i);
  }
  
  void buyItem(int i){
    if(pers.cash>=getItemVCost(i)){
      pers.cash-=getItemVCost(i);
      pers.updateItemInv(i, trademode);
      sfxcash.play();
    } 
  }
  void sellItem(int i){
    if(pers.getItemInv(i)>0){
      pers.cash+=getItemCCost(i);
      pers.updateItemInv(i, trademode);
      sfxcash.play();
    } 
  }
  int getItemVCost(int i){
    return i==ITPTN?cf.potnv:i==ITFPT?cf.fpotv:cf.tonicv;
  }
  int getItemCCost(int i){
    return i==ITPTN?cf.potnc:i==ITFPT?cf.fpotc:cf.tonicc;
  }
}
