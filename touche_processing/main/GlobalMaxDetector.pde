class GlobalMaxDetector extends GestureDetector {

  /**********************************************************
  *********************     VARIABLES   *********************
  **********************************************************/
  private int maxDistance;
  private int bufferDistance;
  private State detectedState;
  private Vector<State> states;
  private GlobalMaxFeature globMax;

  /**********************************************************
  *********************   CONSTRUCTORS  *********************
  **********************************************************/
  
  GlobalMaxDetector(int statesNumber) {
    
    //Init the object in a reliable state
    maxDistance = 0;
    bufferDistance = 0;
    globMax = new GlobalMaxFeature(); 
    detectedState = new State("Undefined", new GlobalMaxFeature());
    
    states = new Vector<State>();  
    for (int i = 0; i < statesNumber; i++) {
      states.add(new State("Undefined", new GlobalMaxFeature()));
    }
  }


  /**********************************************************
  ********************  GETTER E SETTER  ********************
  **********************************************************/
  void setState(int number, String name, float[] values) {

    maxDistance = values.length;
    
    State selectedState = states.elementAt(number);

    selectedState.feature.detect(values);
    selectedState.name = name;
    selectedState.initialized = true;
  }


  State getState(float[] values) {

    globMax.detect(values);  
    maxDistance = values.length;
    
    for (State state : states) {
      
      if (state.initialized == true) {
        
        bufferDistance = abs(state.feature.position - globMax.position); 
        
        if (bufferDistance < maxDistance) {
          maxDistance = bufferDistance;
          detectedState = state;
        }
        
      }
      
    }

    return detectedState;
    
  }
  
  GlobalMaxFeature getFeature(){
    return globMax;
  }
  
}

