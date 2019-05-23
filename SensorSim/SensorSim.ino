//This program simulates the data that would be send by the sensor to the interface.
// This is done by sending a String of data over serial to the computer.

int Sensor_1 = 10;
int Sensor_2 = 20;
int Sensor_3 = 30;
int Sensor_4 = 55;

void setup()
{
  Serial.begin(9600);
}

void loop() {
    Serial.print(Sensor_1);
    Serial.print(",");
    Serial.print(Sensor_2);
    Serial.print(",");
    Serial.print(Sensor_3);
    Serial.print(",");
    Serial.print(Sensor_4);
    Serial.print(",");
    delay(500);
    Sensor_1 = Sensor_1 + 10;
    Sensor_3 = Sensor_3 +5;
}
