class Player {

  //Data
  float diam;//diamtetro de la nave
  float diam2=30;
  color col; // 
  float x,y,y3; // 
  float speed=5;// 
  float y2=600;// 
  //Constructor
  Player() {
    diam = 5;  //temporary class
    col = color(255);
  }
  
  void display() {
    stroke(0);
    image(img2,600,100,300,300);
  }
  
}

void player() {
  pushMatrix();
  //Player
  translate(PposX - 150, mouseY - 125);
  scale(.5);
  p.display();
  popMatrix();
}
