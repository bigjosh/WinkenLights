class TextEffect implements Effect {
  
  PFont f;
  
  String string = "     Wink     ";

  public TextEffect() {
     f = createFont("Arial", 32);
   
  }
  
  
  void activate() {
    colorMode(RGB,255);
    stroke( 0,0,255);
    textFont(f);
    textSize( (height * 3) /4 );
    fill( 0 , 0 , 128);
  }
  
  static final float  speed = 0.05;
  
  void draw() {
    background(0);
    int x = int( width + (millis() * -speed) % (textWidth(string) + width) );
    text(string, x , (height*7) /8  );//(height*7)/8 );  
  }
  
}