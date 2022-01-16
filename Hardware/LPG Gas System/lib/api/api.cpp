#include <Arduino.h>
#include <ESP8266WebServer.h>
#include <ArduinoJson.h>
#include "api.h"
#include "sensor_readings.h"
#include "constants.h"

String create_json(int force, int gas)
{
    String str;

    DynamicJsonDocument doc(1024);
    doc["id"] = 1;
    doc["percentage"]["force"] = ((float)force / 1024) * 100;
    doc["percentage"]["gas"] = ((float)gas / 800) * 100;
    doc["value"]["force"] = force;
    doc["value"]["gas"] = gas;

    serializeJsonPretty(doc, str);
    return str;
}

void config_rest_server_routing()
{
    rest_server.on("/", HTTP_GET, []()
                   { rest_server.send(200, "text/html", "Welcome to REST Web Server"); });

    rest_server.on("/data", HTTP_GET, []()
                   {
        String data = create_json(get_force(), get_gas());
        rest_server.send(200, "text/json", data);
        Serial.println("DATA SENT"); });
}

void start_server()
{
    rest_server.begin();
    Serial.println("HTTP REST Server Started");
}
