
import java.util.*;

final int COLOR_MAX = 255, WORDS_PER_LINE = 5, MAX_TEXT_SIZE = 40, MIN_TEXT_SIZE = 0;
final char DELIMITER = '\n';
final float TEXT_SPEED = 0.6;
final String STORY_TEXT =
"Arte computacional ..." + DELIMITER +
"Processing" + DELIMITER +
"APLICACION EN ENTORNO DE PROGRAMACION CREATIVA" + DELIMITER +
"..." + DELIMITER +
"Space defender" + DELIMITER +
"Proyecto final" + DELIMITER +
"VideoJuego ...";

 ///aquí es donde declaro variables para el sonido en el juego
float textYOffset, shipAngle, shipX, shipZ, shipRotation;
int c, cameraX, cameraY, cameraZ, speedZ, textCounter=0, shipY, speedY, speedX, planetCounter;
import ddf.minim.* ; 
Minim minim;
Minim minim2;
AudioPlayer au_player1;
AudioPlayer au_player2;
AudioPlayer au_player3;
AudioPlayer au_player4;
AudioPlayer explosion;
AudioPlayer level;
AudioPlayer scifi002;

PImage imdsg12;


//varialves de las imagenes
PImage img, img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16; //this is where we declare
 
 ///introi
 boolean spaceScene;

//variables de los colores
/*public int rValEyeRect;
public int gValEyeRect;
public int bValEyeRect;

public int rValEyeEllipse;
public int gValEyeEllipse;
public int bValEyeEllipse;

public int rValSmallEllipse;
public int gValSmallEllipse;
public int bValSmallEllipse;*/
//END COLOR VARIABLES

//posicion x del player
public float PposX;

//Retraso en disparar balas
int bulletTick = -1;

//numero de estrellas iniciales
int stars = 1000;

//numero de asteroides 
// numero de olas
// salud del player

int asteroids2 = 5;
int wave = 1;
float health = 100;
int roundedHealth;

//numero maximo de estrellas
public int spawnField = 2000;
int numeroBlas=1;
// aray que almacena la distancia de lso asteroides
float[] distance = new float[stars];
float[] distance2 = new float[stars];

//creamos el player
Player p;

//Making an array for the stars
Star[] s = new Star[stars];

// cremos las listas de los asteroides y laser
List<Asteroid> asteroids = new ArrayList<Asteroid>();
List<Laser> lasers = new ArrayList<Laser>();

//Vector for the lasers
PVector p1 = new PVector(PposX, mouseY);

// velocidad de movieiento de los asteorides
public float moveSpeedPlus = 0;
int score = 0;
int scene = 1;
int asteroidsRemaining;
explosion explosion1;
ArrayList<explosion>explosionList = new ArrayList<explosion>();

void setup() {
  // fullScreen: pantalla de juego completa
  fullScreen(P3D);
  fill(255);
  // aquí es donde se cargan los archivos de sonido e imagenes
  minim = new Minim(this) ;
  minim2 = new Minim(this) ;
  au_player1 = minim.loadFile(  "sc1.wav")  ;
  au_player2 = minim.loadFile(  "sc.wav")  ;
  au_player3 = minim.loadFile("1.mp3")  ;
  au_player4 = minim2.loadFile("2.mp3")  ;
  explosion  =minim2.loadFile("explsion.mp3")  ;
  level  =minim2.loadFile("level.mp3")  ;
  scifi002  =minim2.loadFile("scifi002.mp3")  ;
   
  img2 =loadImage("sprite.png");//
  img5 =loadImage("sprite3.png");//
  img6=loadImage("Space2.jpg");//
  img12=loadImage("power.png");
  
  
  //configuracion para el texto de la historia
  surface.setResizable(false);
  stroke(0);
  c = 0;
  initShipPosition();
  textYOffset = height-150;
  fill(250, 250, 0);
  textAlign(CENTER, CENTER);
  textSize(MAX_TEXT_SIZE + MIN_TEXT_SIZE);
  textCounter = 0;
  spaceScene = false;
  imdsg12 = loadImage("Space2.jpg");
  imdsg12.resize(width, height);
  sphereDetail(20);
}
//Inicialia la posicion de la nave
void initShipPosition(){
  shipX = 0;
  shipY = -50;
  shipZ = 100;
  shipAngle = 0;
}

void setBackground(){
  background(0);
  image(img6,0,0);
}
// draw: esta funcion mostrara todas las posibles pantallas del juego
// y comportamientos
void draw() {
  if (!spaceScene){
    setBackground();
    setText();
  }
  else{
    
    //Es el baground de la esena principal
    background(0);
    image(img6,0,0); // 
    
    // Si escena == 1, restablece la mayoría de las variables y muestra la escena 1
    if (scene == 1) {
      scene1();
      health = 100;
      score = 0;
      moveSpeedPlus = 0;
      wave = 0;
    }
    if (scene == 3) {
      scene3();
    }
    // Si scene == 4, restablece la variable de asteroide a su valor 
    //predeterminado y destruye todos los asteroides restantes.
    if (scene == 4) {
  
      asteroids2 = 5;
      for (int j = asteroids.size() - 1; j >= 0; ) {
        asteroids.remove(j);
        break;
      }
      scene4();
    }
  
    if (health <= 0) {
  
      scene = 4;
    }
  }
}
void keyPressed() {
  // para acceder a los nuevos esenarios
  if (scene == 1) {
    if (key == ENTER) {
      scene = 3;
    }
  }
  if (scene == 3) {
    if(key == '1'){
      numeroBlas=2;
    }
    if (key == ' ') {
      //si se presiona espacio se crea un laser
      au_player1.play(2) ;//
      bulletTick++;
      //Si los restos de bulletTick dividido por 10 es igual a 0 o si bulletTick es 0, dispara un nuevo láser.
      if (bulletTick % 10 == 0 || bulletTick == 0) {
        lasers.add(new Laser());
      }
    }
  }
  if (scene == 4) {
    if (key == ENTER) {
      scene = 1;
    }
  }
}

// Si se libera espacio, se estable  bullet Tick de nuevo a -1.
void keyReleased(){
  bulletTick = -1;
}

//Crear nuevas estrellas , reproduce el sonido e incicialisa
//los asteroides cuando se cambia a la esena 3
void changeScene(){
  frameRate(60);
  p = new Player();

  for (int i = 0; i < stars; i++) {
    s[i] = new Star();
  }
    au_player3.play(2) ;// 
  setupAsteroids();
  
  spaceScene = true;
}


//Funcion que acomoda los textos de la historia en la pantalla inicial
void setText(){
  pushMatrix();
  translate(width/2, height/2);
  rotateX(PI/4);
  text(STORY_TEXT, 0, textYOffset);
  textYOffset -= TEXT_SPEED;
  textCounter++;
  popMatrix();
  if (textCounter > 10) {
    textSize(14);
    fill(255);
    text("Presione F ", width - 60, height - 30);
    fill(250, 250, 0);
    textSize(MAX_TEXT_SIZE + MIN_TEXT_SIZE);
    if (key == 'f') {
      changeScene();
    }
  }
  if (textCounter == 2500) {
    changeScene();
  }
}
