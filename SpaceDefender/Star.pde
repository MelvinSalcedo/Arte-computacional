class Star {
  //Variables predefinidas para la clases Star
  //SposX, SposY :posicion x,y de las estrellas
  //moveSpeed: velocidad de las estrellas
  float SposX;
  float SposY;
  float moveSpeed;
  //Constructor
  Star() {
    SposY = random(10, height - 10);
    SposX = random(0, width + 1500);
    moveSpeed = random(2, 3);
  }
  void display() {
    fill(255);
    ellipse(SposX, SposY, 5, 5);
  }
  void move() {
    SposX = SposX - moveSpeed;
  }
  // si colisiona ocn la pared  regresan al inicio
  void collision() {
    if (SposX <= 0) {
      SposX = random(width, width + 1500);
    }
  }
}

void stars() {
  for (int i = 0; i < s.length; i++) {
    s[i].display();
    s[i].move();
    s[i].collision();
  }
}
