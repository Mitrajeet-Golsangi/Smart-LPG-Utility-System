#include <Arduino.h>
#include <LiquidCrystal.h>

#include "lcd_display.h"

#define MAX_FORCE 466

/**
* @brief Displaying the force from force sensor on LCD display
* 
* @param force      : takes the analogInput from force sensor
* @param maxForce   : takes the maximum value that can be measured by the force sensor. Default = 466
* @param lcd        : takes the LiquidCrystal instance created in the main program
*/
void displayForce(int force, int maxForce = MAX_FORCE, LiquidCrystal lcd)
{
    float forcePercent = (float)force / (float)maxForce * 100;
    lcd.setCursor(0, 1);
    lcd.print(forcePercent);
}

/**
 * @brief Display the reading from the gas sensor on LCD display
 * 
 * @param gas           : takes analogInput from gas sensor
 * @param threashold    : takes the danger threashold for sounding alarm 
 * @param lcd           : takes the LiquidCrystal instance created in the main program
 */

void displayGas(int gas, LiquidCrystal lcd)
{
    lcd.setCursor(0, 1);
    lcd.print(gas);
}

/**
 * @brief Raise an alert if the reading is not within the normal range
 * 
 * @param threshold     : the value upto which the reading is taken normal
 * @param reading       : the actual value provided by the sensor
 * @param lowAlert      : switches the condition for raising an alert
 * @return true         : If the reading from gas sensor crosses the threashold
 * @return false        : If the reading from gas sensor is under the threashold
 */

bool raiseAlert(int threshold, int reading, bool lowAlert = false)
{

    if (lowAlert)
    {
        if (reading <= threshold)
            return true;
        else
            return false;
    }
    else
    {

        if (reading >= threshold)
            return true;
        else
            return false;
    }
}