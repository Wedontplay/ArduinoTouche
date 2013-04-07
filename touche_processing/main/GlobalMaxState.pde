// Released under Creative Commons License 
// Developed by Gabriele Gambotto with love

//Concrete State
class GlobalMaxState extends State{

  
  /**********************************************************
  *********************   CONSTRUCTORS  *********************
  **********************************************************/

  GlobalMaxState (){
    
    this.name = "undefined";
    this.feature = new GlobalMaxFeature();
    initialized = false;
  
  }
  
  GlobalMaxState (String name, GlobalMaxFeature feature){
  
    this.name = name;
    this.feature = feature;
    initialized = false;
  
  }
  
  
  GlobalMaxFeature getFeature(){
  return (GlobalMaxFeature)feature;
  }
}
