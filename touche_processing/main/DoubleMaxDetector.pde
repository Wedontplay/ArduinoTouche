// Released under Creative Commons License 
// Developed by Gabriele Gambotto with love

//Concrete Detector

import java.util.*;

class DoubleMaxDetector extends GestureDetector {

  /**********************************************************
  *********************     VARIABLES   *********************
  **********************************************************/
  private float maxDistance;
  private float bufferDistance;
  private DoubleMaxState detectedState;
  private Vector<DoubleMaxState> states;
  private DoubleMaxFeature doubleMax;
  

  /**********************************************************
  *********************   CONSTRUCTORS  *********************
  **********************************************************/
  
  DoubleMaxDetector(int statesNumber) {
    
    //Init the object in a reliable state
    maxDistance = 2;
    bufferDistance = 0;
    doubleMax = new DoubleMaxFeature(); 
    detectedState = new DoubleMaxState("Undefined", new DoubleMaxFeature());
    
    states = new Vector<DoubleMaxState>();  
    for (int i = 0; i < statesNumber; i++) {
      states.add(new DoubleMaxState("Undefined", new DoubleMaxFeature()));
    }
  }


  /**********************************************************
  ********************  GETTER E SETTER  ********************
  **********************************************************/
  void setState(int number, String name, float[] values) {

    DoubleMaxState selectedState = states.elementAt(number);

    selectedState.getFeature().detect(values);
    selectedState.setName(name);
    selectedState.setInitialized(true);
  }


  DoubleMaxState getState(float[] values) {

    //since for opposite vector the cosine is -1 and for parallel is 1
    //the maximum distance is 2
    maxDistance = 2;
    doubleMax.detect(values);
    
    for (DoubleMaxState state : states) {
      
      if (state.getInitialized() == true) {
        DoubleMaxFeature feat = state.getFeature();
        bufferDistance = 1 - feat.positions.dot(state.getFeature().positions); 
        
        if (bufferDistance < maxDistance) {
          maxDistance = bufferDistance;
          detectedState = state;
        }
        
      }
      
    }

    return detectedState;
    
  }
  
  DoubleMaxFeature getFeature(){
    return doubleMax;
  }
  
}

