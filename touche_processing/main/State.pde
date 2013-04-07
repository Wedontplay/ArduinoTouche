// Released under Creative Commons License 
// Developed by Gabriele Gambotto with love

//Root class for state, every states must extend this class
abstract class State{

  /**********************************************************
  ***********************  VARIABLES  ***********************
  **********************************************************/
  protected String name;
  protected FeatureInterface feature;
  protected boolean initialized;
 
 
  /**********************************************************
  ********************  GETTER E SETTER  ********************
  **********************************************************/
  abstract FeatureInterface getFeature();

  void setName(String name){
    this.name = name;
  }
  
  String getName(){
    return name;
  }
  
  void setInitialized(boolean val){
    initialized = val;
  } 
  
  boolean getInitialized(){
    return initialized;
  } 

  
}
