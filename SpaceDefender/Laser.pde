class Laser {
  //Variables predefinidas para la clases Laser
  PVector pos,pos0, pos1,vel;
  float r;

  //Constructor de la clase Laser el cual inisializa las variables predefinidas de la clase
  // mouseY : para captar la posicion del mouse en la posicion Y
  // pos, pos0, pos1 posiciones de los laser en la escena
  // vel: velocidad del laser, r: longitus del laser
  Laser() {
    pos = new PVector(255, mouseY);
    pos0 = new PVector(255, mouseY+40);
    pos1 = new PVector(255, mouseY-40);
    vel = PVector.fromAngle(0);
    vel.mult(20);
    r = 10;
  }

 // muestra el laser en la pantalla con las siguientes caracteristicas
 // pushMatrix();popMatrix(); limitan el moviento solo al codigo escrito entre estas dos declaraciones.
  void display() {
    pushMatrix();
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(pos.x - 50, pos.y, 100, r);
    ellipse(pos.x, pos.y, r, r);
    ellipse(pos.x - 100, pos.y, r, r);
    popMatrix();
    // si numeroBlas es igual 2 el numero de laser que dispara la Nave principal seran 3 al mismo tiempo
    if(numeroBlas==2){
      pushMatrix();
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(pos1.x - 100, pos1.y, 60, r);
      ellipse(pos1.x-80, pos1.y, r, r);
      ellipse(pos1.x - 100, pos1.y, r, r);
      popMatrix();
      
      pushMatrix();
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(pos0.x - 100, pos0.y, 60, r);
      ellipse(pos0.x-80, pos0.y, r, r);
      ellipse(pos0.x - 100, pos0.y, r, r);
      popMatrix();
    }
  }
  
  // add(x) añade la velocidad de moviento a cada laser 
  void move() {
    pos.add(vel);
    if(numeroBlas==2){
      pos1.add(vel);
      pos0.add(vel);  
    }
  }

  //offscreen() verifica si el laser disparado sale de las fuera de los limites de la pantalla
  // si esta dentro de la pantalla retorn true caso contrario falso
  boolean offscreen() {
    if (pos.x > width + 100 || pos.x < 0) {
      return true;
    }
    if (pos.y > height || pos.y < 0) {
      return true;
    }
    return false;
  }
  // retorn la posicion x del laser
  float Xpos() {
    return pos.x;
  }
  // retorn la posicion x del laser
  float Ypos() {
    return pos.y;
  }

  // esta funcion verifica si el laser colisiona con algun asteoroide 
  // dist() calcula la distancia entre la posicion del laser y el asteoride
  // si dist()< que el radio del asteroide entonces retorna true
  boolean hits(Asteroid asteroid) {
    float d = dist(pos.x, pos.y, asteroid.pos.x, asteroid.pos.y);
    float d0 = dist(pos0.x, pos0.y, asteroid.pos.x, asteroid.pos.y);
    float d1 = dist(pos1.x, pos1.y, asteroid.pos.x, asteroid.pos.y);
    
    if (d < asteroid.r/2 || d0 < asteroid.r/2 || d1 < asteroid.r/2) {
      return true;
    } else {
      return false;
    }
  }
}


//esta funcion crear los laser los mueve y verifica las colisiones con todos los asteroides

void lasers() {
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser laser = lasers.get(i);
    laser.display(); // muestra el laser
    laser.move();  //mueve el laser
    if (laser.offscreen()) {// verifica si salio de la pantalla
      lasers.remove(i);
    } else {
      for (int j = asteroids.size() - 1; j >= 0; j--) { // verifica colision  
        Asteroid asteroid = asteroids.get(j);
        if (laser.hits(asteroid)) {// si hace colision reproduce sonido y explosion, incrementa score,
        // remueve los asteroides y el laser.
          explosion.play(1) ;
          explosion1 = new explosion(laser.pos.x-20, laser.pos.y-40);
          explosionList.add(explosion1);
          
          score = score + 10;
          asteroids.remove(j);
          lasers.remove(i);
          break;
        }
      }
    }
  }
}
