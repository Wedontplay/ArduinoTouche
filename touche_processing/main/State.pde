class State{

  String name = "";
  GlobalMaxFeature feature;
  boolean initialized;
  
  State (){
    
    this.name = "undefined";
    this.feature = new GlobalMaxFeature();
    initialized = false;
  
  }
  
  State (String name, GlobalMaxFeature feature){
  
    this.name = name;
    this.feature = feature;
    initialized = false;
  
  }
}
