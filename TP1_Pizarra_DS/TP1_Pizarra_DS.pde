/*///////////////////////////////////////////////////////////////////
                               TPO 1
           Programación Orientada al Arte Multimedial I
                    Profesor Mauricio Gutierrez
                      Alumna Daniela Serra
                        1er Período 2022
 //////////////////////////////////////////////////////////////////*/

// import the library
import com.hamoid.*;

// create a new VideoExport-object
VideoExport videoExport;

//Declaración de variables globales

//Opción de colores para el lápiz
color blanco = color(255, 255, 255);
color negro = color (0, 0, 0);
color rojo = color (255, 0, 0);
color amarillo = color (255, 255, 0);
color azul = color (0, 0, 255);
color verde = color (0, 255, 0);
color naranja = color (270, 130, 0);
color violeta = color (130, 0, 130);

//Color de lápiz por defecto
color lapiz = blanco;


//Color de fondo y goma aleatorio
color fondo = color(random(255, 0), random(0, 255), random(255));

//Variable grosor de línea
int grosorLinea = 1;

//Variable tamaño paleta
int r = 40;

// Configuración de la ventana
void setup() {
  size(600, 600);
  background (fondo);
  
    // video
  videoExport = new VideoExport(this, "myVideo.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

//Loop de dibujo
void draw() {
    // Save a frame!
  videoExport.saveFrame();
  //Al presionar el botón izquierdo se dibuja
  if (mousePressed == true && (mouseButton == LEFT)) {
    lapiz = blanco;
    //Al presionar teclas 1, 2 o 3 se elige el grosor de línea
    if (keyPressed == true) {
      if (key == '1') {
        grosorLinea = 5;
      }
      if (key == '2') {
        grosorLinea = 10;
      }
      if (key == '3') {
        grosorLinea = 15;
      }
    }

    // función línea
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

  //seleccionar color de línea
  if (keyPressed == true) {
    if (key == 'b') {    //tecla b = blanco
      lapiz = blanco;
    }
    if (key == 'n') {    //tecla n = negro
      lapiz = negro;
    }
    if (key == 'r') {    //tecla r = rojo
      lapiz = rojo;
    }
    if (key == 'z') {    //tecla z = azul
      lapiz = azul;
    }
    if (key == 'a') {    //tecla a = amarillo
      lapiz = amarillo;
    }
    if (key == 'v') {    //tecla v = verde
      lapiz = verde;
    }
    if (key == 'n') {    //tecla n = naranja
      lapiz = naranja;
    }
    if (key == 't') {    //tecla t = violeta
      lapiz = violeta;
    }
  }
  //Goma
  if (mousePressed == true && (mouseButton == RIGHT)) {
    lapiz = fondo; // color de "lápiz" = color de fondo
    if (keyPressed == true) {
      if (key == '1') {    //apreto tecla 1
        grosorLinea = 5; //tamaño de goma "chico"
      }
      if (key == '2') {    //apreto tecla 2
        grosorLinea = 10;//tamaño de goma "mediano"
      }
      if (key == '3') {    //apreto tecla 3
        grosorLinea = 15;//tamaño de goma "grande"
      }
      if (key == '4') {    //apreto tecla 3
        background(fondo);//borra todo
      }
      line(pmouseX, pmouseY, mouseX, mouseY); //linea que borra
    } else {
      line(pmouseX, pmouseY, mouseX, mouseY); //linea que borra
    }
  }
  stroke(lapiz); //función que llama el color del lápiz
  strokeWeight(grosorLinea);// función que llama el grosor de línea
}
//video
void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
