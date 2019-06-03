#include <SharpIR.h>

#define ir_0 A0
#define ir_1 A1
#define ir_2 A2
#define ir_3 A3
#define ir_4 A4
#define ir_5 A5
#define ir_6 A6
#define ir_7 A7
#define mod_1 100500
#define mod_2 20150

SharpIR SharpIR_0(ir_0, mod_1);
SharpIR SharpIR_1(ir_1, mod_1);
SharpIR SharpIR_2(ir_2, mod_2);
SharpIR SharpIR_3(ir_3, mod_2);
SharpIR SharpIR_4(ir_4, mod_1);
SharpIR SharpIR_5(ir_5, mod_1);
SharpIR SharpIR_6(ir_6, mod_2);
SharpIR SharpIR_7(ir_7, mod_2);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode (A0, INPUT);
  pinMode (A1, INPUT);
  pinMode (A2, INPUT);
  pinMode (A3, INPUT);
  pinMode (A4, INPUT);
  pinMode (A5, INPUT);
  pinMode (A6, INPUT);
  pinMode (A7, INPUT);
}

void loop() {
  delay(150);
  int dis_0 = SharpIR_0.distance();
  delay(150);// this returns the distance to the object you're measuring
  int dis_1 = SharpIR_1.distance();
  delay(150);
  int dis_2 = SharpIR_2.distance();
  delay(150);
  int dis_3 = SharpIR_3.distance();
  delay(150);
  int dis_4 = SharpIR_4.distance();
  delay(150);
  int dis_5 = SharpIR_5.distance();
  delay(150);
  int dis_6 = SharpIR_6.distance();
  delay(150);
  int dis_7 = SharpIR_7.distance();
  delay(150);

  Serial.print(dis_3);
  Serial.print(",");
  Serial.print(dis_2);
  Serial.print(",");
  Serial.print("0");
  Serial.print(",");
  Serial.print("0");
  Serial.print(",");
  Serial.print("0");
  Serial.print(",");
  Serial.print("0");
  Serial.print(",");
  Serial.print("0");
  Serial.print(",");
  Serial.print("0");
  Serial.print(",");
  /*Serial.print(dis_0);
  Serial.print(",");
  Serial.print(dis_1);
  Serial.print(",");
  Serial.print(dis_2);
  Serial.print(",");
  Serial.print(dis_3);
  Serial.print(",");
  Serial.print(dis_4);
  Serial.print(",");
  Serial.print(dis_5);
  Serial.print(",");
  Serial.print(dis_6);
  Serial.print(",");
  Serial.print(dis_7);
  Serial.print(",");
  */
}
