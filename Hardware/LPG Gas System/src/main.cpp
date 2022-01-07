#include <Arduino.h>
#include <ESP8266WebServer.h>
#include <ArduinoJson.h>

#include "network.h"
#include "api.h"
#include "constants.h"

void setup(void) {

  network_setup();

  config_rest_server_routing();

  http_rest_server.begin();
  Serial.println("HTTP REST Server Started");
}

void loop(void) {
    http_rest_server.handleClient();
}