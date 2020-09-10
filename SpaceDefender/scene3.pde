void scene3() {
  //Game
  stars();
  lasers();
  asteroid();
  player();
  //Renderiza todas las colisiones que hubo, por ende crea explosiones
  for(int i = 0; i < explosionList.size(); i++){  // render explosion
    explosionList.get(i).renderExp();
  }
  
  //calcula cada la distancia entre el player y cada uno de los asteroides
  for (int i = 0; i < asteroids.size(); i++) {
    distance[i] = dist(PposX, mouseY, asteroids.get(i).Xpos(), asteroids.get(i).Ypos());
    if (distance[i] < asteroids.get(i).r/2 + 0.5 * 190 / 2 || asteroids.get(i).hitWall()) {
      health = health - 10;

      /*rValSmallEllipse = 255;
      gValSmallEllipse = 0;
      bValSmallEllipse = 0;

      rValEyeRect = 255;
      gValEyeRect = 0;
      bValEyeRect = 0;

      rValEyeEllipse = 250;
      gValEyeEllipse = 128;
      bValEyeEllipse = 114;*/

      asteroids.remove(i);
      break;
    } else {
      /*rValSmallEllipse = 100;
      gValSmallEllipse = 100;
      bValSmallEllipse = 100;

      rValEyeRect = 0;
      gValEyeRect = 0;
      bValEyeRect = 255;

      rValEyeEllipse = 135;
      gValEyeEllipse = 206;
      bValEyeEllipse = 250;*/
    }
  }

  // Verfica si los asterories eliminados en cada ola es 0
  // si es cero crea una nueva ola con nuevos enemigos 
  // añade nuevas funcionalidades al player
  if (asteroids.size() == 0) {
    moveSpeedPlus = moveSpeedPlus + 0.1;
    asteroids2 = asteroids2 + 1;
    wave = wave + 1;
    level.play(1);
    if(wave==3){
      scifi002.play(1);
      numeroBlas=2;
      asteroids2=10;
    }
    
    if(wave==4){
      asteroids2=20;
    }
    
    if(wave>=5){
      asteroids2=40;
    }
    if (spawnField < 5000) {
      spawnField = spawnField + 300;
    } else if (spawnField > 5000 && spawnField < 10000) {
      spawnField = spawnField + 200;
    } else {
      spawnField = spawnField + 100;
    }

    setupAsteroids();
  }

  //Muestra los submenus de la esena 3
  asteroidsRemaining = asteroids.size();
  roundedHealth = round(health);
  textSize(30);
  fill(255);
  textAlign(CENTER);
  text("Salud: " + roundedHealth + "%", width/2 - 150, 50);

  text("Puntaje: " + score, width/2 + 50, 50);

  text("Ola: " + wave, width/2 + 200, 50);
  text("Asteroides restantes: " + asteroidsRemaining, width/2, height - 50);
  //End Game
}
