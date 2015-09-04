import java.util.ListIterator;


OPC opc;

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

 
}


//Effect dotEffect;
//Effect orbitEffect;



ArrayList<Effect> effects = new ArrayList<Effect>();

ListIterator<Effect> effectsIterator;

Effect previousEffect;
Effect currentEffect;

void setup()
{
  
 size(200,200);
 frameRate(15);
 
   
 setupPanels();

  effects.add(new DotEffect());
  effects.add(new OrbitEffect());
  effects.add(new RingsEffect());
  effects.add(new BounceEffect());
  effects.add(new TextEffect());
  
  effectsIterator = effects.listIterator();

  currentEffect = effectsIterator.next();
  // Connect to the local instance of fcserver
  
}

void nextEffect() {
  
  if (!effectsIterator.hasNext()) {
   // if we hit end, start over
   effectsIterator = effects.listIterator();
  }
    
  currentEffect = effectsIterator.next(); 
}

void keyPressed() {
 nextEffect(); 
}

  
int stepper=0;  
  
  
void draw()
{
  
  if (stepper++ > 1000) {
     stepper=0;
     nextEffect();
  }
  
  if (currentEffect != previousEffect ) {
     currentEffect.activate();  
     previousEffect = currentEffect;
  }
  
  currentEffect.draw();
 // background(0);

  switch (key) {
    
    case '0':
      //drawMouseDot();
      break;
      
    case '1':
     //drawPlasma();
      break;
  }
}