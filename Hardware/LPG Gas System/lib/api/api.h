#include <Arduino.h>
#include <ESP8266WebServer.h>

String create_json(int force, int gas);

void config_rest_server_routing();

void start_server();

void handle_server_client();