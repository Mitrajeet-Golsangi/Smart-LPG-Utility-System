#include <Arduino.h>
#include "basic_functions.h"

#define LED D0

/**
 * @brief Sets up the LED pin as output
 * 
 */

void onChipBlinkSetup()
{
    pinMode(D0, OUTPUT);
}

/**
 * @brief Blinks the LED
 * 
 * @param d : takes the delay between each high and low cycle
 */

void onChipBlink(int d)
{
    digitalWrite(LED, HIGH);
    delay(d);
    digitalWrite(LED, LOW);
    delay(d);
}