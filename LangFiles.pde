//LangFiles
//Elaborado por: Ashley Galicia Ramirez
//Fecha de creación: 20 de septiembre de 2021
//Fecha de ultima modificación: 09 de octubre de 2021
//Comentario:

class LangFiles{
  String langs[][];
  String file[];
  int actlang;
  int ns;
  
  LangFiles(int l, int n){
    actlang=l;
    ns=n;
    langs=new String[ns][2];
    loadLang(0);
    loadLang(1);
  }
  
  void loadLang(int l){
    int n;
    if(l==LGSPA)
      file=loadStrings("spa.lang");
    else
      file=loadStrings("eng.lang");
      for(n=0;n<ns;n++)
        langs[n][l]=split(file[n],'=')[1];
  }
  
  void setLang(int l){
    actlang=l;
  }
  int getLang(){
    return actlang;
  }
  String showString(int i){
    return langs[i][actlang];
  }
  
  void toggleLang(){
    actlang=(actlang==LGSPA)?LGENG:LGSPA;
  }
}
