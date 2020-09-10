int DesplazamientoX = 0;
int x = 0;
int y = 0;
int x2 = 0;
int y2 = 0;
final int NumElipses = 30;
final int H_inicial = 150;
float DesplazmientoTemporalX=0;
int[] reds = new int[NumElipses];
int[] greens = new int[NumElipses];
int[] blues = new int[NumElipses];
int[] black = new int[NumElipses];
int ranga=220;
int rango2 =230;
float x1,y1,_x2,_y2;

void setup(){
  size(800, 800);
  for(int i=0; i<NumElipses; i++){
    reds[i] = int(random(ranga,rango2));
    greens[i] = int(random(ranga,rango2));
    blues[i] = int(random(ranga,rango2));
    black[i] = int(random(255,255));
  }
  MostrarImagen();
  
}

void draw(){
  MostrarImagen();
  rocas();
  fill(0,0,0);
  rect(0,600,800,100);
  
}

void MostrarImagen(){
  background(180);
  // cantidad de elipses que se sibujara
  for(int i=0; i<NumElipses; i++){
    x2 = x;
    y2 = y;
    y = int(i*20); 
    
    //asignamos la posicion Y y X en la que se dibujara la elipse
    DesplazmientoTemporalX= random(60, 100);//
    x= int(DesplazamientoX + DesplazmientoTemporalX);
    
    //cada posicion i se dibuja una elipse sin borde
    int ellipse_h2 = int( H_inicial - 5*i);
    noFill();
    stroke(0,0,0);
    ellipse(x, y, 700-y,ellipse_h2);
    //verificamos si i modulo 3 es igual a cero para dibujar una elipse sin borde
    if(i%3==0){
      noFill();
      stroke(0,0,0);
      ellipse(x, y, 800-y,ellipse_h2);
    }
    
    //generamos la posicion, la altura, y ancho de la elipse y asignamos el color  
    int ellipse_h = int( H_inicial - 5*i);
    fill(reds[int(random(0,NumElipses))], greens[int(random(0,NumElipses))], blues[int(random(0,NumElipses))]);
    ellipse(x, y, 600-y,ellipse_h);
    
    //dibujamos lineas desde los bordes de las elipses
    if(i!=0){
      fill(255);
      line(x+(600-y)/2, y, x2+(600-y2)/2, y2);
      line(x-(600-y)/2, y, x2-(600-y2)/2, y2);
    }
  }
  //mover la animacion para la izquierda o derecha
  if(keyPressed==true && key=='a'){
    DesplazamientoX-= 20;
  }
  if(keyPressed==true && key=='d'){
    DesplazamientoX+= 20;
  }
  delay(100);

}

void rocas(){
  
  _x2=x1;
  _y2=y1;
  noFill();
  // creamos 30 cubos en posiciones diferentes cada frame
  for(int i=0; i<NumElipses; i++){
    x1=random(x2-200,y2-100);
    y1=random(500,600);
    rect(x1,y1,10+i,10+i);
  }

}
