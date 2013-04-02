
// Touche
#define SET(x,y) (x |=(1<<y))				//-Bit set/clear macros
#define CLR(x,y) (x &= (~(1<<y)))       		// |
#define CHK(x,y) (x & (1<<y))           		// |
#define TOG(x,y) (x^=(1<<y))            		//-+
#define N 400  //How many frequencies

float results[N];            //-Filtered result buffer
float freq[N];            //-Filtered result buffer
int sizeOfArray = N;
int values[2][N];
int filteredValues[N];

boolean request = false;

void setup()
{
  pinMode(12, INPUT);
  Serial.begin(115200); 
  Serial.flush();
}



void loop()
{
  
  while( Serial.available() > 0 ){
    byte c = Serial.read();
    request = true;  
  }
  uint8_t val;

// TOUCHE
  int counter = 0;

  TCCR1A = 0b10000010;        //-Set up frequency generator
  TCCR1B = 0b00011001;        //-+
  ICR1 = 110;
  OCR1A = 55;

  pinMode(7, INPUT);        //put wrong connection into Hi-Z
  pinMode(8, OUTPUT);        //-Signal generator pin
  pinMode(9, OUTPUT);        //-Sync (test) pin
    
  for (unsigned int d = 0; d < N; d++)
  {
    int v = analogRead(0);    //-Read response signal
    CLR(TCCR1B, 0);           //-Stop generator
    TCNT1 = 0;                //-Reload new frequency
    ICR1 = d;                 // |
    OCR1A = d/2;              //-+
    SET(TCCR1B, 0);           //-Restart generator
    
    
    Serial.print(v);
    Serial.print(";");


  }
  
  Serial.print("\n");        //String Terminator
  
TOG(PORTB, 0);            //-Toggle pin 9 after each sweep (good for scope)
}

