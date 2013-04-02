//Abstract feature detector class.
//Concrete detector must extend from that class 
abstract class GestureDetector{
  
  Vector<State> states;
  
  abstract void setState(int number, String name, float[] values);
  abstract State getState(float[] values);
  abstract FeatureInterface getFeature();
  
}
