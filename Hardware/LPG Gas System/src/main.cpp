#include <Arduino.h>
#include <ESP8266WebServer.h>
#include <ESP8266WiFi.h>
#include <ArduinoJson.h>

#include "network_config.h"
#include "api.h"
#include "constants.h"
#include "sensor_readings.h"
#include "basic_functions.h"

ESP8266WebServer rest_server(80);

void setup()
{

  Serial.begin(9600);

  config_network();

  config_rest_server_routing();

  start_server();
}

void loop()
{
  rest_server.handleClient();
}
