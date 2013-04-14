// Released under Creative Commons License 
// Developed by Gabriele Gambotto with love

//Concrete State
class DoubleMaxState extends State{

  
  /**********************************************************
  *********************   CONSTRUCTORS  *********************
  **********************************************************/

  DoubleMaxState (){
    
    this.name = "undefined";
    this.feature = new DoubleMaxFeature();
    initialized = false;
  
  }
  
  DoubleMaxState (String name, DoubleMaxFeature feature){
  
    this.name = name;
    this.feature = feature;
    initialized = false;
  
  }
  
  
  DoubleMaxFeature getFeature(){
  return (DoubleMaxFeature)feature;
  }
}
