class Asteroid {
  //Variables predefinidas para la clases Asteroide
  //pos:posicion x,y del asterioide
  // r: radio del asteroide, p: velocidad del asteroides y que tipo de asteroide se cargara
  //moveSpeed: velocidad del asteroide
  PVector pos;
  float r;
  int p = int(random(0,2));
  float moveSpeed;

  //Constructor
  Asteroid() {
    r = random(80,110);
    pos = new PVector(random(width + 75, width + spawnField), random(r/2, height - r/2));
    if(p==1){
      moveSpeed = random(3 + moveSpeedPlus, 5 + moveSpeedPlus);
    }
    else{
      moveSpeed = random(23 + moveSpeedPlus, 25 + moveSpeedPlus);
    }
  }
  // image: carga la iamagen en una posicion y longitud
  //p: indica que tipo de imagen se cargara. 
  void display() {
    stroke(2);
    if(p==1){
      image(img5,pos.x-50,pos.y-40,r,r);
    }
    else{
      image(img12,pos.x-50,pos.y-40,r,r);
    }
  }
  // move():mueve los asteroide de derecha a izquierda
  void move() {
    pos.x = pos.x - moveSpeed;
  }
  
  //hitWall(): verfica la colision con los borde de la pantalla
  boolean hitWall() {
    if (pos.x <= 0) {
      return true;
    } else {
      return false;
    }
  }
  
  // Xpos(), Ypos(): retornan la posicion x,y del asteroide
  float Xpos(){
    return pos.x;
  }
  float Ypos(){
    return pos.y;
  }
}

//setupAsteroids(): esta funcion inisializa los asteroides 
// asteroids es una lista de objetos de la clase Asteroid
//add(): agreue los objetos creados por el for dentro de la lista
void setupAsteroids() {
  for (int i = 0; i < asteroids2; i++) {
    asteroids.add(new Asteroid());
  }
}

//asteroid(): muestra a los asteroides creados en la funcion anterior

void asteroid() {
  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid a = asteroids.get(i);
    
    a.display(); //<>//
    a.move();
  }
}
