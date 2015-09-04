class OrbitEffect implements Effect {

  PImage dot1, dot2;
  
  public OrbitEffect()
  {
    dot1 = loadImage("greenDot.png");
    dot2 = loadImage("purpleDot.png");
  }
  
  float px, py;
  
  void activate() {
  }
  
  void draw()
  {
    background(0);
    
    blendMode(ADD);
    
    // Smooth out the mouse location
    px = width/2;
    py = height/2;
    
    float a = millis() * 0.001;
    float r = py * 0.25;
    float dotSize = r * 4;  
  
    float dx = width/2 + cos(a) * r;
    float dy = height/2 + sin(a) * r;
    
   // println("image1");
    
    // Draw it centered at the mouse location
    image(dot1, dx - dotSize/2, dy - dotSize/2, dotSize, dotSize);
  //println("image2");
    // Another dot, mirrored around the center
    image(dot2, width - dx - dotSize/2, height - dy - dotSize/2, dotSize, dotSize);
  }
  
}