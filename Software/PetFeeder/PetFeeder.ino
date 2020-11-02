// **** INCLUDES *****
#include "LowPower.h"

#define TWELVEHOURS 5400*2      // (60s*60s*12h)/4s = wainting cycles (MCU powers down for 4 seconds before watchdogs wakes it up again)
#define MAX_ANIMALS_PER_SHED 9
#define TIMEDIVIDER 0x04        // Clock Prescale Divider (power of two, e.g., 0x04 -> divider=16)

// sometimes HIGH means LED_OFF, so we use a define here
#define LED_ON HIGH
#define LED_OFF LOW

/*Pin setup*/
short pumpPin = 2;
short selectPin = 4;
short setPin = 3;
short motorPin = 8;
short resetPin = 29;

/*Vars*/
int TwelveHourCount = 0;
short AmountOfServings = 0;

typedef enum
{
    START,
    SHOW_VALUE,
    WAIT,
    FINISH
} states_t;

void setup()
{
    /*Set pins*/
    pinMode(selectPin, INPUT);    //Turn on Pin for select button
    pinMode(setPin, INPUT);       //Turn on Pin for set button
    pinMode(pumpPin, OUTPUT);     //Turn on Pin for water pump
    pinMode(motorPin, OUTPUT);    //Turn on Pin for food dispenser
    pinMode(LED_BUILTIN, OUTPUT); //Turn on Blink LED to show the amout of servings

    /*Setup amount of servings depending on amount of animals in shed*/
    states_t state = START;
    bool led_state = LOW;
    short blinks_shown = 0;
    unsigned long time = millis();
    unsigned long last_button_poll = millis();
    unsigned long last_pump_pulse = 0;
    unsigned long now;

    bool set_button = 0;
    bool select_button = 0;

    while (state != FINISH)
    {
        now = millis();
        
        // keep powerbank alive by briefly turning on pump every 4 seconds
        // after reset, enable pump for 500ms to activate powerbank
        if (now - last_pump_pulse > 4000)
        {
            digitalWrite(pumpPin, HIGH);
            if (last_pump_pulse == 0)
                delay(500);
            else
                delay(10);
            digitalWrite(pumpPin, LOW);

            last_pump_pulse = now;
        }

        switch (state)
        {

        case START:
            // wait before blinking
            if (now - time > 1000)
            {
                time = now;
                state = SHOW_VALUE;
                blinks_shown = 0;
                led_state = LED_OFF;
            }
            break;

        case SHOW_VALUE:
            if (led_state == LED_OFF && now - time > 500)
            {
                time = now;
                led_state = LED_ON;
            }
            else if (led_state == LED_ON && now - time > 250)
            {
                time = now;
                led_state = LED_OFF;
                blinks_shown++;
            }
            if (blinks_shown == AmountOfServings)
            {
                state = WAIT;
            }
            break;

        case WAIT:
            break;
        }

        digitalWrite(LED_BUILTIN, led_state);

        // debounce
        if (now - last_button_poll > 500)
        {
            // buttons are low active
            set_button = (digitalRead(setPin) == LOW);
            select_button = (digitalRead(selectPin) == LOW);

            if (set_button || select_button)
            {
                last_button_poll = now;
            }
        }

        if (set_button)
        {
            AmountOfServings++;

            if (AmountOfServings > MAX_ANIMALS_PER_SHED)
                AmountOfServings = 1;

            // restart state machine
            state = START;
        }
        else if (select_button)
        {
            state = FINISH;
            // or just break;
        }
        set_button = 0;
        select_button = 0;
    }

    for (int i=0; i<10; i++)
    {
        digitalWrite(LED_BUILTIN, LED_ON);        
        delay(100);
        digitalWrite(LED_BUILTIN, LED_OFF);
        delay(100);
    }

    /*Reduce AVR328P to 1 Mhz for powersaving*/
    CLKPR = 1 << 7;
    CLKPR = TIMEDIVIDER; /*divide by 0x04 = 16 (1 Mhz) | 0x02 = 8 (4 Mhz) | 0x01 = 4 (8 Mhz)*/
}

void loop()
{
    /*ATmega328P maximum powersaving, complete power down for 8 seconds wakup by watchdog*/
    LowPower.powerDown(SLEEP_4S, ADC_OFF, BOD_OFF);
    TwelveHourCount++;

    /* Set clock speed back to 16 Mhz*/
    CLKPR = 0x80;
    CLKPR = 0x00;

    // keep powerbank alive by briefly turning on pump every 4 seconds
    digitalWrite(pumpPin, HIGH);
    delay(10);
    digitalWrite(pumpPin, LOW);

    if (TwelveHourCount >= TWELVEHOURS)
    {
        /*Dispense food and water in real scenario*/
        digitalWrite(LED_BUILTIN, LED_ON);    // turn the LED on (HIGH is the voltage level)
        delay(10000);                         // wait for 10 second /*TBD*/
        digitalWrite(LED_BUILTIN, LED_OFF);   // turn the LED off by making the voltage LOW
        delay(1000);                          // wait for a secon. /*TBD*/
        TwelveHourCount = 0;                  //reset Twelve Hour Counter
    }

    else
    {
        /*Do noting in real scenario*/
        digitalWrite(LED_BUILTIN, LED_ON);    // turn the LED on (HIGH is the voltage level)
        delay(50);                            // wait for half second
        digitalWrite(LED_BUILTIN, LED_OFF);   // turn the LED off by making the voltage LOW
    }

    /* Set clock speed down to 1 Mhz*/
    CLKPR = 0x80;
    CLKPR = TIMEDIVIDER;
}