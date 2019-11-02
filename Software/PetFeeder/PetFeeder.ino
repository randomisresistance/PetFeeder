// **** INCLUDES *****
#include "LowPower.h"

#define TWELVEHOURS 5400 // (60s*60s*12h)/8s = wainting cycles (MCU powers down for 8 seconds befor watchdogs wakes it up)
#define MAX_ANIMALS_PER_SHED 9
#define TIMEDIVIDER 1

/*Pin setup*/
int pumpPin   =   5;
int selectPin =   6;
int setPin    =   7; 
int motorPin  =   8;
int resetPin  =  29;

/*Pin vars*/
bool valSelectButton     = 0;   
bool valSetButton        = 0


/*Vars*/
int TwelveHourCount   = 0;
short AmoutOfServings = 1;

;

void setup()
{
  /*Set pins*/
  pinMode(selectPin, INPUT);    //Turn on Pin for select button  
  pinMode(setPin, INPUT)        //Turn on Pin for set button
  pinMode(pumpPin, OUTPUT);     //Turn on Pin for water pump
  pinMode(motorPin, OUTPUT);    //Turn on Pin for food dispenser
  pinMode(LED_BUILTIN, OUTPUT); //Turn on Blink LED to show the amout of servings

  
  /*Setup amount of servings depending on amount of animals in shed*/
  do
  {
    do
    {
      valSelectButton = 0;
      AmoutOfServings++;

      if(AmoutOfServings > MAX_ANIMALS_PER_SHED){
        AmoutOfServings = 1;
        }

      for(int i; AmoutOfServings <= MAX_ANIMALS_PER_SHED; i++)
      {
       /*LED blinks for selected AmoutOfServings times*/
       digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
       delay(200);                        // wait
       digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW  
      }
     
     valSelectButton = digitalRead(selectPin);  //read pin value for select
    } while(valSelectButton != 1);

    valSetButton = digitalRead(setPin);//read pin value for set
  } while(valSetButton != 1);
  
  
  /*Reduce AVR328P to 1 Mhz for powersaving*/
  CLKPR = 0x80;
  CLKPR = 0x04; /*divide by 0x04 = 16 (1 Mhz) | 0x02 = 8 (4 Mhz) | 0x01 = 4 (8 Mhz)*/
 
}

void loop() 
{
  /*ATmega328P maximum powersaving, complete power down for 8 seconds wakup by watchdog*/
  LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);
  TwelveHourCount++;
  
  if(TwelveHourCount>=TWELVEHOURS){
    /* Set clock speed back to 16 Mhz*/
    CLKPR = 0x80;
    CLKPR = 0x00;


    /*Dispense food and water in real scenario*/
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
    /*Do noting in real scenario*/
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
