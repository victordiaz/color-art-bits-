class Picture { 
  String name; 
  String url; 
  String imageFile; 
  color[] colors; 
  PImage image; 
  
  
  public void loadPicture() { 
    image = loadImage("./img/" + imageFile); 
    
  } 
  
} 

class Colors { 
  color rgb;
  String hexcolor; 
  
  
} 
