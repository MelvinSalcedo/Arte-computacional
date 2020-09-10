void scene4() {
  stars();
  //pantalla de game over
  translate(0, 0);
  textSize(60);
  fill(255);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2 - 100);
  textSize(40);
  text("PUNTAJE: " + score, width/2, height/2);
  text("OLA: " + wave, width/2, height/2 + 50);
  text("ENTER PARA JUGAR DE NUEVO", width/2, height/2 + 150);
}
