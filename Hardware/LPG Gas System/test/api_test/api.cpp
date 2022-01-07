#include <Arduino.h>
#include <ESP8266WebServer.h>
#include <ArduinoJson.h>

#include "privateInfo.h"

#define HTTP_REST_PORT 80
#define WIFI_RETRY_DELAY 500
#define MAX_WIFI_INIT_RETRY 50

ESP8266WebServer http_rest_server(HTTP_REST_PORT);


String get_data() {
    // int gas_per = 100;
    // int force_per = 100;
    // int gas_val = 255;
    // int force_val = 100;
    String str;

    DynamicJsonDocument doc(1024);
    doc["id"] = 1;
    doc["percentage"]["force"] = 100;
    doc["percentage"]["gas"] = 100;
    doc["value"]["force"] = 100;
    doc["value"]["gas"] = 100;

    serializeJsonPretty(doc, str);
    return str;
}


/**
    Function To Initialize WiFi
*/
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

/**
    config REST API function
*/
void config_rest_server_routing() {
  http_rest_server.on("/", HTTP_GET, []() {
    http_rest_server.send(200, "text/html",  "Welcome to REST Web Server");
  });

  // Add your REST APIs & the functions to be run when call those APIs
  // http://network_ip/data
  http_rest_server.on("/data", HTTP_GET, []() {
    http_rest_server.send(200, "text/json", get_data());
  });
}

void setup(void) {
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

  config_rest_server_routing();

  http_rest_server.begin();
  Serial.println("HTTP REST Server Started");

  pinMode(D0, OUTPUT);
  pinMode(D1, OUTPUT);
}

void loop(void) {
  http_rest_server.handleClient();
  digitalWrite(D0, HIGH);
  digitalWrite(D1, LOW);
  delay(2000);
  digitalWrite(D1, HIGH);
  digitalWrite(D0, LOW);

}