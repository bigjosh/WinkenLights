OPC opc;
PImage dot;

static final float LEDS_PER_METER = 60;

static final int LEDS_PER_CHANNEL = 204;    //number of LED slots on each pin

Panel panels[] = new Panel[3];

SmallPanel smallPanel;

void setupPanels() {
  
  opc = new OPC(this, "192.168.7.2", 7890);

  int index=0;
  
  final int panelGapLEDs = 8;  // Number of LEDs between panels (note that you should ignore the frame- onlyt care about the distance from the pixels)
  
  final int panelSpacing = panelGapLEDs *2 ;    // Number of pixels between panels (note that you should ignore the frame- onlyt care about the distance from the pixels)

  smallPanel = new SmallPanel( opc , index , (width/2) - (Panel.pwidth/2) - panelSpacing - Panel.pwidth - panelSpacing - (SmallPanel.pwidth/2)  , height/2);

  index=LEDS_PER_CHANNEL;  // SKip ahead to next channel

  for(int i=0; i<3; i++ ){
    
    panels[i] = new Panel( opc , index ,   (width/2)  + ((Panel.pwidth+panelSpacing) * (i-1) ) , height/2 );
  
    println( "pixelcount =" + Integer.toString( Panel.pixelCount ));
  
    index += Panel.pixelCount;
  }
  
  
  for(int i=0; i<60;i++ ) {
     //opc.led( index++ , 20 , ( (height/2) - 30 ) + ((100/60) * i ) );   
  }
  
 // index = opc.addSmallPanel( index , width/2 , height/2 );
 
}

float dotSize;

void setup()
{
  
 size(300,300);
 frameRate(15);
 
 dotSize = height * 0.7;
   
 setupPanels();
  // Load a sample image
  dot = loadImage("dot.png");

  // Connect to the local instance of fcserver
  
}

// Draw a dot controlled by the mouse cursor

void drawMouseDot() {
  // Draw the image, centered at the mouse location

  image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
  
}

void drawPlasma() {
  
}
  
void draw()
{
  background(0);

  switch (key) {
    
    case '0':
      drawMouseDot();
      break;
      
    case '1':
      drawPlasma();
      break;
  }
}