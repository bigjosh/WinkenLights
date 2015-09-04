  
// Panel is 24x104 (11x51 actual LEDs with 2x spacing and no LEDs in the corners) 
// returns endindex

import processing.core.*;

public class SmallPanel {

    public static final int lwidth = 13;
    public static final int lheight = 53;
    
   // Pixels
    public static final int pwidth = lwidth*2 -1 ;
    public static final int pheight = lheight *2 -1 ;
     
 
    public static final int pixelCount = ((lwidth-2)*2) + ((lheight-2)*2);  // -2 becuase there are no LEDs in the corners
    
    public int topy;
    public int bottomy;
    
    public int rightx;
    public int leftx;

    // We don't want to add corner pixles twice, so each string only includes starting pixel but not
    // ending pixel since it will be picked up on next string

    // Keep in mind that the panel is facing the wall so everything backwards. 

    public SmallPanel( OPC opc, int index, int centerx, int centery  ) {
  
      
      // this works becuase we have a center LED on each string and so rounds down
      topy = centery - (pheight/2);
      bottomy = centery + (pheight/2);
      
      rightx = centerx+(pwidth/2);
      leftx = centerx-(pwidth/2);
      
  //    println("centerx="+Integer.toString(centerx) );

  //   println("rightx="+Integer.toString(rightx) );
  //println("leftx="+Integer.toString(leftx) );
 
  //  println("index start="+Integer.toString(index) );
  
      // top left half
      // +1 becuase we have an even number of pixels so middle is between center 2 pixels
      for( int x=centerx; x>leftx; x-=2 ) {  // Left x-2 becuase no corners on these
          opc.led( index++ , x , topy);
      }
    //  println("index top="+Integer.toString(index) );

      // left side
      for( int y=topy+2; y<bottomy; y+=2 ) {    // topy+2 becuase  the corner was covered when we did the top
          opc.led( index++, leftx, y );
      }
    //  println("index right="+Integer.toString(index) );

      //bottom
      for( int x=leftx+2; x<rightx; x+=2) {
         opc.led( index++, x , bottomy ); 
      }
      
      //right side
      for( int y=bottomy-2; y>topy; y-=2)  {
         opc.led( index++, rightx , y);
      }
      
      // top right half 
      for( int x=rightx-2; x>centerx; x-=2) {
         opc.led( index++ , x , topy); 
      }
      
//      println("index="+Integer.toString(index)+":"+Integer.toString(this.pixelCount) );

  }
}