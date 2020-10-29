// **** INCLUDES *****
#include "LowPower.h"

#define TWELVEHOURS 5400 // (60s*60s*12h)/8s = wainting cycles (MCU powers down for 8 seconds befor watchdogs wakes it up again)
#define MAX_ANIMALS_PER_SHED 9
#define TIMEDIVIDER 1

// sometimes HIGH means LED_OFF, so we use a define here
#define LED_ON HIGH
#define LED_OFF LOW

/*Pin setup*/
short pumpPin = 5;
short selectPin = 6;
short setPin = 7;
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
    unsigned long now;

    bool set_button = 0;
    bool select_button = 0;

    while (state != FINISH)
    {
        now = millis();
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
        if (now - last_button_poll > 100)
        {
            // buttons are low active
            set_button = (digitalRead(set_button) == LOW);
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
    }

    /*Reduce AVR328P to 1 Mhz for powersaving*/
    CLKPR = 0x80;
    CLKPR = 0x04; /*divide by 0x04 = 16 (1 Mhz) | 0x02 = 8 (4 Mhz) | 0x01 = 4 (8 Mhz)*/
}

void loop()
{
    /*ATmega328P maximum powersaving, complete power down for 8 seconds wakup by watchdog*/
    LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);
    TwelveHourCount++;

    if (TwelveHourCount >= TWELVEHOURS)
    {
        /* Set clock speed back to 16 Mhz*/
        CLKPR = 0x80;
        CLKPR = 0x00;

        /*Dispense food and water in real scenario*/
        digitalWrite(LED_BUILTIN, HIGH); // turn the LED on (HIGH is the voltage level)
        delay(10000 / TIMEDIVIDER);      // wait for 10 second
        digitalWrite(LED_BUILTIN, LOW);  // turn the LED off by making the voltage LOW
        delay(1000 / TIMEDIVIDER);       // wait for a secon.
        TwelveHourCount = 0;             //reset Twelve Hour Counter

        /* Set clock speed down to 1 Mhz*/
        CLKPR = 0x80;
        CLKPR = 0x04;
    }

    else
    {
        /*Do noting in real scenario*/
        /* Set clock speed back to 16 Mhz*/
        CLKPR = 0x80;
        CLKPR = 0x00;

        digitalWrite(LED_BUILTIN, HIGH); // turn the LED on (HIGH is the voltage level)
        delay(500 / TIMEDIVIDER);        // wait for half second
        digitalWrite(LED_BUILTIN, LOW);  // turn the LED off by making the voltage LOW

        /* Set clock speed down to 1 Mhz*/
        CLKPR = 0x80;
        CLKPR = 0x04;
    }
}
