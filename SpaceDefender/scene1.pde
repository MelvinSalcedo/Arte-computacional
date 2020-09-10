void scene1() {
  stars();
  //stars(): llamamos a las estrellas de fodo
  // esena de menu principal
  fill(255);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("DEFENSA ESPACIAL", width/2, 100);
  text("INSTRUCCIONES", width/2, height/2 - 200);
  textSize(40);
  text("CONTROLES:", width/2, height/2 - 100);
  textSize(30);
  text("-MOVER EL RATÓN ARRIBA Y ABAJO PARA MOVER", width/2, height/2 -50);
  text("-PRESIONE ESPACIO PARA DISPARAR UNA BALA", width/2, height/2);
  textSize(40);
  text("PRESIONA ENTER PARA CONTINUAR", width/2, height/2 + 300);
  textSize(30);
  text("Sobrevivir el mayor tiempo posible y recoger puntos!", width/2, height/2 + 150);
}
