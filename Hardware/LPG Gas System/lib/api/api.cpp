#include<Arduino.h>
#include <ESP8266WebServer.h>
#include <ArduinoJson.h>
#include "api.h"
#include "sensor_readings.h"
#include "constants.h"

String create_json(int force, int gas) {
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

void config_rest_server_routing(int force, int gas) {
    http_rest_server.on("/", HTTP_GET, []() {
        http_rest_server.send(200, "text/html",  "Welcome to REST Web Server");
    });

    http_rest_server.on("/data", HTTP_GET, []() {
        String data = create_json(get_force(), get_gas());
        http_rest_server.send(200, "text/json", data);
    });
}
