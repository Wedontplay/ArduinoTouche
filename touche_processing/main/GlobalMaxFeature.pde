class GlobalMaxFeature implements FeatureInterface {

  int position;
  float value;

  GlobalMaxFeature() {
    position = 0;
    value = 0;
  }
  
    
  void detect(float[] sensorValues) {

    //find the global maximum and its position
    //Zeroing the value
    value = 0;

    for (int i = 0; i < sensorValues.length; i++) {
      
      if (sensorValues[i] > value) {
        value = sensorValues[i];
        position = i;
      }
      
    }
    
  }
  
}
