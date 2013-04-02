//Class to use the touche shield.
class Touche{
  
 /**********************************************************
  *********************    VARIABLES   *********************
  **********************************************************/
  
  private int frequenciesNumber;
  private String inString;
  // different matrix row holds temporal datas for filtering issues
  private float[][] rawValues; 
  private float[] filteredValues;
  private GestureDetector gestureDetector;
  
  
  /**********************************************************
  *********************   CONSTRUCTORS  *********************
  **********************************************************/
  
  //Basic Constructor, we need to set the number of frequancies we are sending
  Touche(int frequenciesNumber){
    
    this.frequenciesNumber = frequenciesNumber;
    //initialize the array
    //A default value of 0 for arrays of integral types is guaranteed
    // by the Java language specification. 
    rawValues = new float[2][frequenciesNumber];
    filteredValues = new float[frequenciesNumber];
    
  }
  
  //Overloaded Constructor, we need to set the number of frequancies we are sending and the type of gesture detector needed.
  Touche(int frequenciesNumber, GestureDetector detector){
    
    this.frequenciesNumber = frequenciesNumber;
    this.gestureDetector = detector;
    
    //initialize the array
    //A default value of 0 for arrays of integral types is guaranteed
    // by the Java language specification. 
    rawValues = new float[2][frequenciesNumber];
    filteredValues = new float[frequenciesNumber];
    
  }
  
  /**********************************************************
  ************************  FUNCTIONS  **********************
  **********************************************************/
  
  void parseSerial(String inString){
    rawValues[0] = rawValues[1];
    rawValues[1] = float(split(inString, ';'));
  }
  
  //For Smoother result we apply a simple moving average filter.
  //The smoothness is proportional to the window length
  private void applyMovingAverageFilter(){
     
    // hipass iir y[i] := α * (y[i-1] + x[i] - x[i-1])
    //y lowpass iir [i] := y[i-1] + α * (x[i] - y[i-1])
    
    for (int i = 1; i < frequenciesNumber; i++){
      
      //filteredValues[i] = 0.05 * (filteredValues[i] + rawValues[1][i] - filteredValues[i]);
      //filteredValues[i] = filteredValues[i] + 0.05 * (rawValues[1][i] - filteredValues[i]);
      //filteredValues[i] = (rawValues[1][i-1] + rawValues[1][i] + rawValues[1][i+1])/3;
      
    }
    
  }
    
  
  /**********************************************************
  *******************  GETTER AND SETTER  *******************
  **********************************************************/
  
  //Return the raw datas
  float[] getRawValues(){
    return rawValues[1];
  }
  
  //Return the filtered datas  
  float[] getFilteredValues(){
    applyMovingAverageFilter();
    return filteredValues;
  }
  /*
  //Get the global maximum as a vector (value, position)
  GlobalMaxFeature getGlobalMaximum(){
    findGlobalMax();
    return globalMax;
  }
  */
  //Set the gesture detector to use. The detector will create its feature.
  void setDetector(GestureDetector detector){
    gestureDetector = detector;
  }
  
  GlobalMaxFeature getFeature(){
    return (GlobalMaxFeature)gestureDetector.getFeature();
  }
  
  State getState(float[] values){
    return gestureDetector.getState(values);
  }
  
  void setState(int number, String name, float[] values){
    gestureDetector.setState(number, name, values);
  }
  
  
}
