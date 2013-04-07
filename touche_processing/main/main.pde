import processing.serial.*;

// The serial port
Serial myPort;        
// Touche object
Touche touche;
// points to draw
float points[];
//User Interface
UserInterface ui;
State currentState;
boolean handshake = false;
  
void setup () {
  
  // set the window size:
  size(800, 600);        
  
  // instantiate the objects
  touche = new Touche(400, new GlobalMaxDetector(9));
  points = new float[400];
  ui = new UserInterface();
  // List all the available serial ports
  println(Serial.list());
  
  // I know that the first port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 115200);
  
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  
  // set inital background:
  background(0);
  frameRate(60);
}

void draw () {
  
  background(0);
  stroke(255);
  
  ui.drawGraph(points); 
  
  if(handshake){
    ui.drawDetectorPanel(touche.getFeature().position, touche.getFeature().value, currentState.name);   
  }  
  
}

void serialEvent (Serial myPort) {
  
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  
  //send datas to the object
  if (inString != null) {
    handshake = true;
    touche.parseSerial(inString);
    points = touche.getRawValues();
    currentState = touche.getState(points);
  }
}

void keyPressed() {
  
  switch (key) {
   
    case 48:
      touche.setState(0, "Free", points); 
      break;
    
    case 49:
      touche.setState(1, "Approaching Far", points); 
      break;  

    case 50:
      touche.setState(2, "Approaching Near", points); 
      break;  

    case 51:
      touche.setState(3, "One Finger", points); 
      break;  
      
    case 52:
      touche.setState(4, "Two Finger", points); 
      break;  
      
    case 53:
      touche.setState(5, "Three Finger", points); 
      break;        
      
    case 54:
      touche.setState(6, "Four Finger", points); 
      break;              
      
    case 55:
      touche.setState(7, "Five Finger", points); 
      break;                    
      
    case 56:
      touche.setState(8, "Full Hand", points); 
      break;                    
  }
  
}

