#include<Arduino.h>
#include "get_force.h"

bool setForceTrue(int p1, int p2, int p3) {
    digitalWrite(p1, HIGH);
    digitalWrite(p2, LOW);
    digitalWrite(p3, HIGH);
    
    if (digitalRead(p1) == 1 && digitalRead(p2) == 0 && digitalRead(p3) == 1)
        return true;
    else
        return false;
}