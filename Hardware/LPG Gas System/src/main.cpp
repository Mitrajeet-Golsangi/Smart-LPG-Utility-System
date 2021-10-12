#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

#include "basic_functions.h"

void setup()
{
  // put your setup code here, to run once:
  onChipBlinkSetup();
}

void loop()
{
  // put your main code here, to run repeatedly:
  onChipBlink(1000);
}