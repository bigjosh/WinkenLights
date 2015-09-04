public class DotEffect implements Effect {

  PImage dot;
  
  public DotEffect() {
    // Load a sample image
    dot = loadImage("dot.png");
  }
  
  
  public void activate() {
    fill( 255 );
    blendMode(REPLACE);
  }
  
  
  public void draw() {
    background(0);
     float dotSize = height * 0.7;
    image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize); 
  
  }
  
}