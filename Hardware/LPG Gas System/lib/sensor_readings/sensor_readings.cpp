#include<Arduino.h>
#include "sensor_readings.h"
#include "constants.h"

int get_gas() {
    digitalWrite(MUX_1, HIGH);
    digitalWrite(MUX_2, HIGH);
    digitalWrite(MUX_3, HIGH);

    return analogRead(A0);
}
int get_force() {
    digitalWrite(MUX_1, HIGH);
    digitalWrite(MUX_2, LOW);
    digitalWrite(MUX_3, HIGH);

    return analogRead(A0);
}