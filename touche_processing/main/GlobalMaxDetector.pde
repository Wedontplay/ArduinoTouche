class GlobalMaxDetector extends GestureDetector {

  /**********************************************************
  *********************     VARIABLES   *********************
  **********************************************************/
  private int maxDistance;
  private int bufferDistance;
  private GlobalMaxState detectedState;
  private Vector<GlobalMaxState> states;
  private GlobalMaxFeature globMax;

  /**********************************************************
  *********************   CONSTRUCTORS  *********************
  **********************************************************/
  
  GlobalMaxDetector(int statesNumber) {
    
    //Init the object in a reliable state
    maxDistance = 0;
    bufferDistance = 0;
    globMax = new GlobalMaxFeature(); 
    detectedState = new GlobalMaxState("Undefined", new GlobalMaxFeature());
    
    states = new Vector<GlobalMaxState>();  
    for (int i = 0; i < statesNumber; i++) {
      states.add(new GlobalMaxState("Undefined", new GlobalMaxFeature()));
    }
  }


  /**********************************************************
  ********************  GETTER E SETTER  ********************
  **********************************************************/
  void setState(int number, String name, float[] values) {

    maxDistance = values.length;
    
    GlobalMaxState selectedState = states.elementAt(number);

    selectedState.getFeature().detect(values);
    selectedState.setName(name);
    selectedState.setInitialized(true);
  }


  GlobalMaxState getState(float[] values) {

    globMax.detect(values);  
    maxDistance = values.length;
    
    for (GlobalMaxState state : states) {
      
      if (state.getInitialized() == true) {
        GlobalMaxFeature feat = state.getFeature();
        bufferDistance = abs(state.getFeature().position - globMax.position); 
        
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

