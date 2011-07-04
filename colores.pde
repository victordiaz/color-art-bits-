import processing.opengl.*; 
import megamu.shapetween.*; 

/*
@title: ""
 @description: 
 @date_and_time:  08/06/2011 :
 @weather: 
 @place: Spain -> Barcelona -> Hostel  
 @mood: 5 (1 minimum to 5 maximum)
 @comments: 
 */


String[] lines;
int index = 0; 
Vector<Picture> pictures = new Vector<Picture>(); 
float q_x = 10; 
float q_y = 0; 
float despl = 0; 
float lp_x = 0; 
int val = 0; 
int val_x = 10; 
PImage fondo; 
PImage fondo2; 

Tween ani, ani1, ani2; 

PFont font = createFont("Helvetica", 198); 


void setup() { 
  size(screen.width, screen.height, OPENGL); 

  fondo = loadImage("guernica.jpeg"); 
  fondo2 = loadImage("firma_picasso-1.png"); 
  
  lines = loadStrings("picasso.csv");  
  if (index < lines.length) {


    for(int j = 0; j <= lines.length ; j++) { 
      String[] l = split(lines[index], '\t'); 
      println(l.length) ; 
      Picture p = new Picture(); 
      p.name = l[0]; 
      p.url = l[1]; 
      p.imageFile = l[2]; 
      int l2 = l.length - 4; 
      p.colors = new color[l2]; 
      //println(l[0]); 
      //println(l[1]); 
     
     println(l2); 
      
      for(int i = 0; i < l2; i++) { 
        //println(l[2]); 
        String[] q = l[3 + i].split(","); 
        println(q); 
        p.colors[i] = color(int(q[0]), int(q[1]), int(q[2]));
      } 
      
      if(l2 > 5) { 
        pictures.add(p); 
      } 
   
      // Go to the next line for the next run through draw()
      index = j;  
    
    } 
    
    ani = new Tween(this, 2, Tween.SECONDS, Shaper.COSINE); 
    ani.end(); 
    
      
    ani1 = new Tween(this, 2, Tween.SECONDS, Shaper.COSINE); 
    ani1.end(); 
    
        
    ani2 = new Tween(this, 2, Tween.SECONDS, Shaper.COSINE); 
    ani2.end(); 
    
    
  } 
  

  //background(255); 
  smooth();
}

void draw() { 
  background(0); 
  
  tint(55); 
  image(fondo, 0, 0); 
  
  tint(255); 
  image(fondo2, 55, 25); 
  
  fill(255); 
  textFont(font, 198); 

  //image(pictures.get(0).image, 10, 10); 
  int index = int((mouseX - despl)  / q_x); 
  println(index); 
  text(pictures.get(index).name.substring(0, 4), width - 455, 180); 
  pictures.get(index).loadPicture(); 
  
  stroke(255); 
  line(mouseX, height, mouseX, mouseY); 
  image(pictures.get(index).image, mouseX, mouseY); 
  
  
  int count = 0; 
   for (Picture p: pictures) { 
      //p.loadPicture(); 
      //println(p.name); 
      rectMode(CORNER); 
      for (int j = 0; j < p.colors.length; j++) {  
        fill(p.colors[j]); 

        rect(q_x*count + despl, height + -q_y*j, q_x, q_y); 
        //println(pictures.get(0).colors[j]); 
      }  
     
     count = count + 1; 
    } 
   
    
    if (ani.isTweening()) { 
      q_y = 25 * ani.position(); 
      //println(q_y); 
    } 
    
      
    if (ani1.isTweening()) { 
      despl = lerp(lp_x, val, ani1.position()); 
      
      if (ani.position() >= 1) { 
        lp_x = despl; 
      } 
      println(despl); 
    } 
    
         
    if (ani2.isTweening()) { 
      //println("qq1" + val_x); 
      //println("qq2"+lerp(0, val_x, ani2.position())); 
      
      if (ani2.position() >= 1) { 
       // lp_x = despl; 
      } 
      //println(despl); 
    } 
    
} 


void keyPressed() {
  if(key == 'q') { 
 
    ani.start(); 
 
  } else if(key == 'w') { 
 

    ani.reverse(); 
    ani.start(); 

 
  } else if(key == 'o') { 

    val += 55; 
    ani1.start(); 
 
  }  else if(key == 'p') { 
 
    val -= 55; 
    ani1.start(); 
    
  } 
   else if(key == 'k') { 

    val_x += 10;  
    ani2.start(); 
 
  }  else if(key == 'l') { 
 
    val_x -= 10; 
    ani2.start(); 
    
  } 
  

} 



