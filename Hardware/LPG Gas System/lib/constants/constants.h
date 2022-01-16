#include<Arduino.h>
#include<ESP8266WebServer.h>

#define WIFI_RETRY_DELAY 500
#define MAX_WIFI_INIT_RETRY 50

extern ESP8266WebServer rest_server;

#define MUX_1 D5
#define MUX_2 D6
#define MUX_3 D7
