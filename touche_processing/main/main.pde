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
  touche = new Touche(400, new GlobalMaxDetector(3));
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
      touche.setState(1, "Approaching", points); 
      break;  

    case 50:
      touche.setState(2, "Contact", points); 
      break;  
  }
  
}

