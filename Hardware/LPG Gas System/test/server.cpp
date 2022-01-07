// #include <Arduino.h>
// #include <ESP8266WiFi.h>

// #include "privateInfo.h"

// WiFiClient client;
// WiFiServer server(80);
// #define LED_Red D5
// #define LED_Yellow D6
// #define LED_Green D7
// #define LED_Status 2

// void blink(int, int);

// IPAddress local_IP(192, 168, 29, 200);
// IPAddress gateway(192, 168, 29, 1);
// IPAddress subnet(255, 255, 255, 0);
// IPAddress primaryDNS(8, 8, 8, 8);
// IPAddress secondaryDNS(8, 8, 4, 4);

// void setup()
// {

//   pinMode(LED_Status, OUTPUT);

//   Serial.begin(9600);

//   if (!WiFi.config(local_IP, gateway, subnet, primaryDNS, secondaryDNS))
//   {
//     Serial.println("SDA Failed to configure");
//   }

//   WiFi.begin(WIFI, PASS);

//   while (WiFi.status() != WL_CONNECTED)
//   {
//     delay(500);
//     Serial.print(".");
//   }

//   Serial.println();
//   Serial.println("NodeMCU is Connected");
//   Serial.println(WiFi.localIP());

//   server.begin();
//   pinMode(LED_Red, OUTPUT);
//   pinMode(LED_Yellow, OUTPUT);
//   pinMode(LED_Green, OUTPUT);
// }

// void loop()
// {

//   blink(LED_Status, 3000);
// }

// void blink(int LED_PIN, int d)
// {
//   digitalWrite(LED_PIN, LOW);
//   delay(50);
//   digitalWrite(LED_PIN, HIGH);
//   delay(d);
// }