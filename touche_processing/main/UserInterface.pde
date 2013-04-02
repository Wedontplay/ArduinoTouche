class UserInterface{
    
  
  /**********************************************************
  *********************   CONSTRUCTORS  *********************
  **********************************************************/
  
  UserInterface(){
    
  }

  /**********************************************************
  *********************     ELEMENTS    *********************
  **********************************************************/
  
  void drawGraph(float[] points){
    
    //draw the title
    fill(0, 102, 153);
    textSize(32);
    text("Raw Values", 140, 40); 
    
    //draw the graph
    stroke(255, 0, 0);
    noSmooth();
    for (int i = 0; i < points.length; i++){
      point(i + 21, map(points[i], 1024, 0, 40, 500));
    }
    
    fill(0, 102, 153);
    textSize(20);
    text("Frequencies", 160, 520);
  
  }
  
  void drawDetectorPanel(int maxPos, float maxVal, String gesture){
  
    //draw the title
    fill(0, 102, 153);
    textSize(32);
    text("Gesture Detection", 480, 40);
    
    textSize(28);
    text("Max Position: " + maxPos, 450, 100);
    text("Max Value: " + maxVal, 450, 140);
  
    textSize(22);
    text("Press keys from 0 to 5 to detect the gestures", 450, 200, 300, 100);
    
    textSize(28);
    text("Detected Gesture:", 450, 350);
    textSize(50);
    fill(255,0,0);
    text( gesture, 450, 400, 350, 100);
  }
    
}
