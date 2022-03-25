/* Random Walker
 * por Daniela Serra*/

// import the library
import com.hamoid.*;

// create a new VideoExport-object
VideoExport videoExport;

int x = 400;
int y = 700;
int pasos = 10;

void setup() {
  size (700,700);

  fill (255);
  
  //configuracion de video
  videoExport = new VideoExport(this, "RandomWalkerDS.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

 void draw() {
   
      // Save a frame!
   videoExport.saveFrame();
   
   //fondo y transparencia
   fill (60,50);
   rect(-1, -1, 701,701);
   
   //lineas
   stroke(random(100,255), random(150,255), random(180,255));
   line (x,y,random(450), random(200));
   line(x,y, random(50), random(150));
   line(x,y,random(200),random(450));
   line (x,y,random(650), random(650));
   line (x,y,random(150), random(200));
   line(x,y, random(50), random(150));
   line (x,y,random(550), random(550));

   //movimiento
   int choice = int( random(6) );
   switch (choice){
     case 0:
     x=x + pasos;
     break;
     
     case 1:
     x= x - pasos;
     break;
     
     case 2:
     y = y + pasos;
     break;
     
     case 3:
     y= y - pasos;
     break;
     
     case 4:
     y++;
     break;
     
     case 5:
     x++;
     break;
     
     case 6:
     x= x+(pasos*10);
     break;
     
     case 7:
     y= y+(pasos*3);
     break;
     

   }
   
 
 
 // toroide
 
 if(x>width)x=0;
 if(x<0) x= width;
 if(y<0) y = height;
 if(y> height) y=0;
 
 
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}     
