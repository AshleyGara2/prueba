  //Proyecto Fist Ilusion UTVT
//Elaborado por:
//Fecha de creación: 17 de septiembre de 2021
//Fecha de ultima modificación: 06  de noviembre de 2021
//Comentario
import processing.sound.*;
import ddf.minim.*;

final int PNCRG=1;      //PANTALLA DE CARGA
final int PNCBT=2;      //PANTALLA DE COMBATE
final int PNCFG=3;      //PANTALLA DE CONFIGURACION
final int PNCRE=4;      //PANTALLA DE CREACION
final int PNCRD=5;      //PANTALLA DE CREDITOS
final int PNFIN=6;      //PANTALLA DE FIN DE JUEGO
final int PNINT=7;      //PANTALLA DE INTRO
final int PNLVL=8;      //PANTALLA DE SUBIR NIVEL
final int PNMAP=9;      //PANTALLA DE MAPA
final int PNPAU=10;      //PANTALLA DE PAUSA
final int PNTND=11;      //PANTALLA DE TIENDA
final int LGSPA=0;
final int LGENG=1;
final int ATATK=1;
final int ATDEF=2;
final int ATHPM=3;
final boolean ATUP=true;
final boolean ATDN=false;
final int CLAWA=0;
final int CLTRR=1;
final int CLBSQ=2;
final int CLPST=3;
final int CLTND=4;
final boolean MSCON=true;
final boolean MSCOFF=false;
final int ITPTN=0;
final int ITFPT=1;
final int ITTNC=2;
final boolean TMBUY=true;
final boolean TMSELL=false;
final boolean BATTLEON=true;
final boolean BATTLEOFF=false;
final boolean ACTON=true;
final boolean ACTOFF=false;
final int ACATK=0;
final int ACDEF=1;
final int ACITM=2;
final boolean TURNP=true;
final boolean TURNE=false;

color paleta[];
PImage terreno[];
PImage imgbackgr;
PImage imgatk;
PImage imgdef;
PImage imghpm;
PImage imgpotn;
PImage imgfptn;
PImage imgtonic;
PImage imgcash;
boolean gmode;

Minim minim;
AudioPlayer mscintro;
AudioPlayer msccreds;
AudioPlayer mscstore;
AudioPlayer msccreat;
AudioPlayer mscvctry;
SoundFile sfxfight;
SoundFile sfxclick;
SoundFile sfxcash;

GameControl gc;
LangFiles lf;
PFont fbase;
ConfigFile cf;
Personaje pers;

void setup(){
  size(800,800);
  frameRate(60);
  createPal();
  createTerreno();
  gmode=true;
  fbase=createFont("Arial Black", 24);
  imgatk=loadImage("sprite/icon/icon_atk.png");
  imgdef=loadImage("sprite/icon/icon_def.png");
  imghpm=loadImage("sprite/icon/icon_hpm.png");
  imgpotn=loadImage("sprite/items/potion.png");
  imgfptn=loadImage("sprite/items/full potion.png");
  imgtonic=loadImage("sprite/items/tonic.png");
  imgcash=loadImage("sprite/items/cash.png");
  imgbackgr=loadImage("sprite/backgr/backgr.png");
  textFont(fbase);
  cf=new ConfigFile();
  lf=new LangFiles(cf.lang,cf.ns);
  gc=new GameControl();
  minim=new Minim(this);
  thread("loadAudio");
}

void draw(){
    gc.display();
}
  
void mouseReleased(){
  gc.mouseProcess(mouseX, mouseY, mouseButton);
}

void keyReleased(){
  gc.keyProcess(key);  
}

void createPal(){
  paleta=new color[5];
  paleta[CLAWA]=color(164,218,247);
  paleta[CLTRR]=color(150,113, 75);
  paleta[CLBSQ]=color( 88,138, 87);
  paleta[CLPST]=color( 91,244,103);
  paleta[CLTND]=color(105, 37,231);
}

void createTerreno(){
  terreno=new PImage[5];
  terreno[CLAWA]=loadImage("sprite/terreno/agua.png");
  terreno[CLTRR]=loadImage("sprite/terreno/tierra.png");
  terreno[CLBSQ]=loadImage("sprite/terreno/bosque.png");
  terreno[CLPST]=loadImage("sprite/terreno/pasto.png");
  terreno[CLTND]=loadImage("sprite/terreno/tienda.png");
}

void loadAudio(){
  gc.pncrg.message=lf.showString(27);
  sfxfight=new SoundFile(this, "sound/fx/enter battle.mp3");
  sfxclick=new SoundFile(this, "sound/fx/click.mp3");
  sfxcash=new SoundFile(this, "sound/fx/click.mp3");
  sfxfight.amp(0.45);
  sfxclick.amp(0.45);
  sfxcash.amp(0.25);
  gc.pncrg.message=lf.showString(28);
  mscintro=minim.loadFile("sound/music/intro.mp3");
  msccreds=minim.loadFile("sound/music/credits.mp3");
  mscstore=minim.loadFile("sound/music/store.mp3");
  msccreat=minim.loadFile("sound/music/creation.mp3");
  mscvctry=minim.loadFile("sound/music/creation.mp3");
  mscintro.setVolume(0.15);
  msccreds.setVolume(0.15);
  mscstore.setVolume(0.15);
  msccreat.setVolume(0.15);
  mscvctry.setVolume(0.15);
  gc.pncrg.message=lf.showString(29);
  gc.pncrg.loading=false;
  
}
void music(){
  if(!gc.getMusicStatus())
    gc.musicManager(MSCON);
}
