// **** INCLUDES *****
#include "LowPower.h"

#define TWELVEHOURS 5400 
#define TIMEDIVIDER 1

int TwelveHourCount = 0;

void setup()
{
  /*Reduce AVR328P to 1 Mhz for powersaving*/
  CLKPR = 0x80;
  CLKPR = 0x04; /*divide by 0x04 = 16 (1 Mhz) | 0x02 = 8 (4 Mhz) | 0x01 = 4 (8 Mhz)*/
  
  /*Turn on Blink LED*/
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(5,OUTPUT);
}

void loop() 
{
  /*ATmega328P maximum powersaving complete power down for 8 seconds wakup by watchdog*/
  //LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);
  TwelveHourCount++;

    CLKPR = 0x80;
    CLKPR = 0x00;

  digitalWrite(5, HIGH);
  digitalWrite(LED_BUILTIN, HIGH); 
  delay(1000/TIMEDIVIDER);
  digitalWrite(5, LOW);
  digitalWrite(LED_BUILTIN, LOW); 
  delay(1000/TIMEDIVIDER);


  return;
  
  if(TwelveHourCount>=TWELVEHOURS){
    /* Set clock speed back to 16 Mhz*/
    CLKPR = 0x80;
    CLKPR = 0x00;
     
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(10000/TIMEDIVIDER);          // wait for 10 second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    delay(1000/TIMEDIVIDER);           // wait for a secon.
    TwelveHourCount=0;                 //reset Twelve Hour Counter

    /* Set clock speed down to 1 Mhz*/
    CLKPR = 0x80;
    CLKPR = 0x04;
  }
  
  else{
    /* Set clock speed back to 16 Mhz*/
    CLKPR = 0x80;
    CLKPR = 0x00;
    
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(500/TIMEDIVIDER);            // wait for half second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    
    /* Set clock speed down to 1 Mhz*/
    CLKPR = 0x80;
    CLKPR = 0x04;
    }
}
