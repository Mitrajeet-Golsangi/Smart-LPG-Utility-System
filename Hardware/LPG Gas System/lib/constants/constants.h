#include<Arduino.h>
#include<ESP8266WebServer.h>

#define HTTP_REST_PORT 80
ESP8266WebServer http_rest_server(HTTP_REST_PORT);

#define WIFI_RETRY_DELAY 500
#define MAX_WIFI_INIT_RETRY 50

#define MUX_1 D5
#define MUX_2 D6
#define MUX_3 D7
