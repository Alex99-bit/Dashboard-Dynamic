
class Dashboard{
  // Probar con dos tipos de array, uno mas manipulable pero menos optimizado y otros dos lo contrario
  ArrayList<Float> listaClases;
  float[] promClases;
  float[] angClases; // Este para la grafica de pastel
  float suma;
  boolean prom;
  int[] r,g,b;
  
  Dashboard(){
    // Aqui se iniciara un tamaño aleatorio, con valores aleatorios
    listaClases = new ArrayList<Float>();
    int rand = (int) random(2,20);
    suma = 0;
    prom = false;
    print(" << Array total de: "+rand+" >> ");
    
    // En este ciclo re repite rand veces e incrusta valores aleatorios a listaClases
    // a su ves se suman todos los valores
    for(int i=0;i<rand;i++){
      listaClases.add(random(500));
      print(" << Array "+i+": "+listaClases.get(i)+" >> ");
      suma += listaClases.get(i);
    }
    print(" << El total es = "+suma+" >> ");
    
    GeneRGB();
    Promedios();
    Angulos();
  }
  
  Dashboard(ArrayList<Float> clases){
    // En esta sobrecarga sera ingresado por el usuario
    listaClases = clases;
    //listaClases = new ArrayList<Float>();
  }
  
  void Promedios(){
    promClases = new float[listaClases.size()];
    
    // Aqui se va a sacar el promedio o porcentaje de cada array list
    for(int i=0;i<listaClases.size();i++){
      promClases[i] = (listaClases.get(i)*100)/suma;
      print(" << Porcentaje de "+i+": "+promClases[i]+" >> ");
    }
    
    prom = true;
  }
  
  void Angulos(){
    angClases = new float[listaClases.size()];
    
    if(prom){
      // Se ejecuta el resto de la operacion
      for(int i=0;i<listaClases.size();i++){
        if(i==0){
          angClases[i] = (promClases[i]*360)/100;
        }else{
          angClases[i] = ((promClases[i]*360)/100) + angClases[i-1];
        }
        print(" << Angulo "+i+": "+angClases[i]+" >> ");
      }
    }
  }
  
  void DashCake(int x,int y,int rad){
    for(int i=0;i<listaClases.size();i++){
      fill(r[i],g[i],b[i]);
      if(i==0){
        arc(x,y,rad,rad,0,radians(angClases[i]),PIE);
      }else{
        arc(x,y,rad,rad,radians(angClases[i-1]),radians(angClases[i]),PIE);
      }
    }
  }
  
  void DashDonut(int x,int y,int rad,int bkg){
    DashCake(x,y,rad);
    fill(bkg);
    circle(x,y,rad/1.5);
  }
  
  void GeneRGB(){
    r = new int[listaClases.size()];  
    g = new int[listaClases.size()];
    b = new int[listaClases.size()];
    
    for(int i=0;i<listaClases.size();i++){
      r[i] = (int)random(50,255);
      g[i] = (int)random(50,255);
      b[i] = (int)random(50,255);
    }
  }
}

Dashboard graph = new Dashboard();

void setup(){
  size(800,800);
  background(150);
  graph.DashCake(200,400,150);
  graph.DashDonut(500,400,150,150);
}

void draw(){
  
}
