public class BounceEffect implements Effect {

  PImage dot;
  
  float dotSize;
  
  public BounceEffect() {
    // Load a sample image
    dot = loadImage("dot.png");
    dotSize = 30;

}
  
float x=0;
float y=0;

float xv;
float yv;
  
  public void activate() {
    
    fill( 0 , 255 , 0 );
    blendMode(REPLACE);
    
    x = random( width);
    xv = random(10) -5 ;
    y=  -1 * random(50) ;
    yv = 0;
    
  }
  
  
  static final float G = 9.8;
  
  public void draw() {
    background(0);

    if (x<0 || x>width) xv = -xv;
    
    x += xv;
    
 
    yv +=0.5;        //Gravity
    
    yv *=0.99;    // Friction
 
    y += yv;
    
    if ( y> height ) {
      yv = -yv;
      y = height - ( y-height);
    }
    
    if ( y > (height*0.9) && abs(yv) < 3) activate();  // Reboot when we stop

     
    image(dot, x - dotSize/2, y - dotSize/2, dotSize, dotSize); 

   //     image(dot, (width/2) - dotSize/2, (height/2) - dotSize/2, 100, 100); 

    
    //println( "x,y " , x ,y );
  
  }
  
}