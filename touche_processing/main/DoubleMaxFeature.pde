// Released under Creative Commons License 
// Developed by Gabriele Gambotto with love

//Concrete Feature
class DoubleMaxFeature implements FeatureInterface {

  //First and second maximum
  PVector positions;
  PVector values;

  /**********************************************************
  *********************   CONSTRUCTORS  *********************
  **********************************************************/

  DoubleMaxFeature() {
    
    positions = new PVector(0, 0);
    values = new PVector(0, 0);
    
  }
  
  /**********************************************************
  ************************   LOGIC  *************************
  **********************************************************/
    
  void detect(float[] sensorValues) {
    
    //find the first global maximum and its position
    values.x = 0;
    values.y = 0;

    for (int i = 0; i < sensorValues.length; i++) {
      
      if (sensorValues[i] > values.x) {
        values.x = sensorValues[i];
        positions.x = i;
      }
      
    }
   
    for (int i = (int) positions.x; i < sensorValues.length; i++) {
      
      if (sensorValues[i] > values.y) {
        values.y = sensorValues[i];
        positions.y = i;
      }
      
    }
    
  }
  
  
}

