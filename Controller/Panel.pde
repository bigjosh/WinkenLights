  
// Panel is 28x180 (90x14 actual LEDs with 2x spacing) 
// returns endindex

import processing.core.*;

public class Panel {

    // LEDs
    public static final int lwidth = 14;
    public static final int lheight = 90;
    
    // Pixels
    public static final int pwidth  = (lwidth-1)*2;
    public static final int pheight = (lheight-1) *2;
 
    public static final int pixelCount = (lwidth*2) + (lheight*2) - 4;  // -4 becuase the corners are only added once
  
    public int topy;
    public int bottomy;
    
    public int rightx;
    public int leftx;

    // We don't want to add corner pixles twice, so each string only includes starting pixel but not
    // ending pixel since it will be picked up on next string

    // Keep in mind that the panel is facing the wall so everything backwards. 

    public Panel( OPC opc, int index, int centerx, int centery  ) {
  
      
      // we don't have to /2 becuase our pixels are spaced x2
      topy = centery - (pheight/2) ;
      bottomy = centery + (pheight/2) ;
      
      rightx = centerx+(pwidth/2);
      leftx = centerx-(pwidth/2);
      
  //    println("centerx="+Integer.toString(centerx) );

  //   println("rightx="+Integer.toString(rightx) );
  //println("leftx="+Integer.toString(leftx) );
 
  //  println("index start="+Integer.toString(index) );
  
      // top left half
      // -1 becuase we have an even number of pixels so middle is between center 2 pixels
      for( int x=centerx-1; x>leftx; x-=2 ) {
          opc.led( index++ , x , topy);
      }
    //  println("index top="+Integer.toString(index) );

      // left side
      for( int y=topy; y<bottomy; y+=2 ) {    // topy+2 becuase  the corner was covered when we did the top
          opc.led( index++, leftx, y );
      }
    //  println("index right="+Integer.toString(index) );

      //bottom
      for( int x=leftx; x<rightx; x+=2) {
         opc.led( index++, x , bottomy ); 
      }
      
      //right side
      for( int y=bottomy; y>topy; y-=2)  {
         opc.led( index++, rightx , y);
      }
      
      // top left half 
      for( int x=rightx; x>centerx; x-=2) {
         opc.led( index++ , x , topy); 
      }
      
      println(" panel index="+Integer.toString(index) );

  }
}