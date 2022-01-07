#include <Arduino.h>
#include <ESP8266WebServer.h> 
#include "network.h"
#include "privateInfo.h"
#include "constants.h"

int init_wifi() {
  int retries = 0;
  Serial.println("Connecting to WiFi ...");

  WiFi.mode(WIFI_STA);
  WiFi.begin(WIFI, PASS);

  // check the status of WiFi connection to be WL_CONNECTED
  while ((WiFi.status() != WL_CONNECTED) && (retries < MAX_WIFI_INIT_RETRY)) {
    retries++;
    delay(WIFI_RETRY_DELAY);
    Serial.print(".");
    // Dots will print to show still connecting...
  }
  return WiFi.status(); // retucrn the WiFi connection status
}

void network_setup() {
  Serial.begin(9600);
  Serial.println("MCU Program Started...");
  if (init_wifi() == WL_CONNECTED) {
    Serial.println("WIFI Connetted");
    Serial.print(WIFI);
    Serial.print("--- IP: ");
    Serial.println(WiFi.localIP());
  }
  else {
    Serial.print("Error connecting to: ");
    Serial.println(WIFI);
  }
}