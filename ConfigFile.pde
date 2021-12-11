//ConfigFile
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 04 de octubre de 2021
//Fecha de ultima modificación: 1 de noviembre de 2021
//Comentario:

class ConfigFile{
  String file[];
  int lang;
  int ns;
  int ppa;
  int minatr;
  int maxatr;
  int bsqodd;  //probabilidad de combate bosque
  int pstodd;  //probabilidad de combate pasto
  int trrodd;  //probabilidad de combate tierra
  int cash;
  int potnv;
  int fpotv;
  int tonicv;
  int potnc;
  int fpotc;
  int tonicc;
  int cdtenemy;
  int cdtplayr;
  
  ConfigFile(){
    file=loadStrings("config.dat");
    loadConfig();
  }
  
  void loadConfig(){
    int i;
    
    for(i=0; i<file.length;i++){
      if(split(file[i], '=')[0].equals("#language"))
        lang=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#langstr"))
        ns=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#ppa"))
        ppa=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#minatr"))
        minatr=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#maxatr"))
        maxatr=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#bsqodd"))
        bsqodd=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#pstodd"))
        pstodd=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#trrodd"))
        trrodd=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#cash"))
        cash=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#potnv"))
        potnv=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#fpotv"))
        fpotv=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#tonicv"))
        tonicv=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#potnc"))
        potnc=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#fpotc"))
        fpotc=int(split(file[i],'=')[1]);
      if(split(file[i], '=')[0].equals("#tonicc"))
        tonicc=int(split(file[i],'=')[1]);
      if(split(file[i],'=')[0].equals("#cdtenemy"))
        cdtenemy=(int(split(file[i],'=')[1]));
      if(split(file[i],'=')[0].equals("#cdtplayr"))
        cdtplayr=(int(split(file[i],'=')[1]));  
    }
  }
  
  void saveConfig(LangFiles lf){
    lang=lf.getLang();
    String save="";
    save=save+"#language="+lang+";";
    save=save+"#langstr="+ns+";";
    save=save+"#ppa="+ppa+";";
    save=save+"#minatr="+minatr+";";
    save=save+"#maxatr="+maxatr+";";
    save=save+"#bsqodd="+bsqodd+";";
    save=save+"#pstodd="+pstodd+";";
    save=save+"#trrodd="+trrodd+";";
    save=save+"#cash="+cash+";";
    save=save+"#potnv="+potnv+";";
    save=save+"#fpotv="+fpotv+";";
    save=save+"#tonicv="+tonicv+";";
    save=save+"#potnc="+potnc+";";
    save=save+"#fpotc="+fpotc+";";
    save=save+"#tonicc="+tonicc+";";
    save=save+"#cdtenemy="+cdtenemy+";";
    save=save+"#cdtplayr="+cdtplayr+";";
    file=split(save, ';');
    saveStrings("data/config.dat", file);
    
  }
}
