//import the used librarys
import controlP5.*;
import processing.serial.*;
//define the image and table
PImage img1;
PImage img2;
PImage img3;
PImage img4;
Table table1;
Table table2;
//define the serial port and GUI controller
Serial port;
ControlP5 cp5;
//define text boxes
Textarea Textarea_1;
Textarea Textarea_2;
Textarea Textarea_3;
Textarea Textarea_4;
Textarea Textarea_5;
Textarea Textarea_6;
Textarea Textarea_7;
Textarea Textarea_8;
Textarea Textarea_9;
Textarea Textarea_10;
Textarea Textarea_11;
Textarea Textarea_12;
Textarea Textarea_13;
Textarea Textarea_14;
Textarea Textarea_15;
Textarea Textarea_16;
Textarea Textarea_17;
Textarea Textarea_18;
Textarea Textarea_19;
Textarea Textarea_20;
PrintWriter output;
PrintWriter output1;
int myColor = color(255, 255, 255);
void setup() {
  size(800, 550);
  noStroke();
  background(myColor);
  img1 = loadImage("Backgrounds/Opstelling_File.png");
  img2 = loadImage("Backgrounds/Background.png");
  img3 = loadImage("Backgrounds/Opstelling_Garage.png");
  img4 = loadImage("Backgrounds/NoCom.png");
  //create a new table and generate the collums
  table1 = new Table();
  table1.addColumn("Distance a");
  table1.addColumn("Distance b");
  table1.addColumn("Distance c");
  table1.addColumn("Distance d");
  table1.addColumn("Distance e");
  table1.addColumn("Distance f");
  table1.addColumn("Distance g");
  table1.addColumn("Distance h");
  table1.addColumn("Distance i");
  table1.addColumn("Hoek");
  table2 = new Table();
  table2.addColumn("Distance a");
  table2.addColumn("Distance b");
  table2.addColumn("Distance c");
  table2.addColumn("Distance d");
  table2.addColumn("Distance e");
  table2.addColumn("Distance f");
  table2.addColumn("Distance g");
  table2.addColumn("Hoek");
  output1 = createWriter("Sensor_data/tempd.txt");
  output1.println("20");
  output1.flush();
  output1.close();
  //window size off the app
  cp5 = new ControlP5(this);
  //create the buttons in the tabs 
  cp5.addButton("Save1")
    .setValue(0)
    .setLabel("Save")
    .setPosition(300, 45)
    .setSize(200, 40);
  cp5.addButton("Save2")
    .setValue(0)
    .setLabel("Save")
    .setPosition(300, 45)
    .setSize(200, 40);
  //move button to tab 2
  cp5.getController("Save2")
    .moveTo("garage_parkeren");
  //create all the used text boxes       
  Textarea_1 = cp5.addTextarea("Text_Distance_1")
    .setPosition(100, 100)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_2 = cp5.addTextarea("Text_Distance_2")
    .setPosition(330, 100)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_3 = cp5.addTextarea("Text_Distance_3")
    .setPosition(100, 130)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_4 = cp5.addTextarea("Text_Distance_4")
    .setPosition(550, 130)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_5 = cp5.addTextarea("Text_Distance_5")
    .setPosition(590, 6)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_6 = cp5.addTextarea("Text_Distance_6")
    .setPosition(550, 100)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_7 = cp5.addTextarea("Text_Distance_7")
    .setPosition(330, 130)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_8 = cp5.addTextarea("Text_Distance_8")
    .setPosition(100, 160)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_9 = cp5.addTextarea("Text_Distance_9")
    .setPosition(330, 160)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_10 = cp5.addTextarea("Text_Distance_10")
    .setPosition(550, 160)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_11 = cp5.addTextarea("Text_Distance_11")
    .setPosition(330, 190)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_12 = cp5.addTextarea("Text_Distance_12")
    .setPosition(100, 100)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_13 = cp5.addTextarea("Text_Distance_13")
    .setPosition(330, 100)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_14 = cp5.addTextarea("Text_Distance_14")
    .setPosition(100, 130)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_15 = cp5.addTextarea("Text_Distance_15")
    .setPosition(550, 130)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_16 = cp5.addTextarea("Text_Distance_16")
    .setPosition(330, 130)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_17 = cp5.addTextarea("Text_Distance_17")
    .setPosition(100, 160)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_18 = cp5.addTextarea("Text_Distance_18")
    .setPosition(330, 160)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_19 = cp5.addTextarea("Text_Distance_19")
    .setPosition(550, 160)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  Textarea_20 = cp5.addTextarea("Text_Distance_20")
    .setPosition(330, 190)
    .setSize(200, 200)
    .setFont(createFont("arial", 20))
    .setLineHeight(14)
    .setColor(color(0));
  //move all the text boxes to the global front to display them on all tabs               
  Textarea_1.moveTo("default");
  Textarea_2.moveTo("default");
  Textarea_3.moveTo("default");
  Textarea_4.moveTo("default");
  Textarea_5.moveTo("global");
  Textarea_6.moveTo("global");
  Textarea_7.moveTo("default");
  Textarea_8.moveTo("default");
  Textarea_9.moveTo("default");
  Textarea_10.moveTo("default");
  Textarea_11.moveTo("default");
  Textarea_12.moveTo("garage_parkeren");
  Textarea_13.moveTo("garage_parkeren");
  Textarea_14.moveTo("garage_parkeren");
  Textarea_15.moveTo("garage_parkeren");
  Textarea_16.moveTo("garage_parkeren");
  Textarea_17.moveTo("garage_parkeren");
  Textarea_18.moveTo("garage_parkeren");
  Textarea_19.moveTo("garage_parkeren");
  Textarea_20.moveTo("garage_parkeren");
  PFont font = createFont("arial", 20);
  cp5.addTextfield("input")
    .setPosition(700, 0)
    .setSize(100, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255));
  cp5.getController("input")
    .moveTo("global");
  //create used tabs                 
  cp5.getTab("default")
    .activateEvent(true)
    .setLabel("file parkeren")
    .setHeight(40)
    .setId(1);
  cp5.getTab("garage_parkeren")
    .activateEvent(true)
    .setLabel("garage parkeren")
    .setHeight(40)
    .setId(2);
  image(img2, 40, 200);
  image(img2, 100, 200);
  image(img2, 40, 500);
  image(img2, 100, 500);
  image(img1, 40, 300);
  myColor = lerpColor(0, 255, 1);
  int lastPort = Serial.list()
    .length - 1;
  if (lastPort < 0) {
    println("No com ports found pleas restart");
      image(img4, 130, 230);

  } else {
    println("Locating device...");
    //print the available serial ports
    printArray(Serial.list());
    //select port from the listed array
    //replace [0] to [1],[2]...for selecting a usable open port
    port = new Serial(this, Serial.list()[0], 9600);
    //load background images
  }
}
void draw() {
  image(img2, 50, 0);
  int lastPort = Serial.list().length - 1;
  if (lastPort < 0) {
    Textarea_1.setText("Distance a: ");
    Textarea_2.setText("Distance b: ");
    Textarea_3.setText("Distance d: ");
    Textarea_4.setText("Distance f: ");
    Textarea_5.setText("Distance c:");
    Textarea_6.setText("Distance c: ");
    Textarea_7.setText("Distance e: ");
    Textarea_8.setText("Distance g: ");
    Textarea_9.setText("Distance h: ");
    Textarea_10.setText("Distance i: ");
    Textarea_11.setText("Hoek α: ");
    Textarea_12.setText("Distance a: ");
    Textarea_13.setText("Distance b: ");
    Textarea_14.setText("Distance d: ");
    Textarea_15.setText("Distance f: ");
    Textarea_16.setText("Distance e: ");
    Textarea_17.setText("Distance g: ");
    Textarea_20.setText("Hoek α: " );
  } else {
    String value = port.readString();
    if (value != null) {
    output = createWriter("Sensor_data/temps.txt");
    output.println(value);
    output.flush();
    output.close();
    String[] value1 = loadStrings("Sensor_data/tempd.txt");
    String[] test = loadStrings("Sensor_data/temps.txt");
    int[] list = int(split(test[0], ','));
    int[] listc = int(split(value1[0], ','));
    //convert the integers to strings
    String display_1a = Integer.toString(list[0]);
    String display_2b = Integer.toString(list[1]);
    String display_3d = Integer.toString(list[2]);
    String display_4f = Integer.toString(list[3]);
    String display_5a = Integer.toString(list[4]);
    String display_6b = Integer.toString(list[5]);
    String display_7g = Integer.toString(list[6]);
    float hoekr = atan2((list[1] - list[0]), listc[0]);
    float hoekrr = atan2((list[5] - list[4]), listc[0]);
    float hoekd = degrees(hoekr);
    float hoekdd = degrees(hoekrr);
    float e = list[2] * cos(abs(hoekr));
    float g = list[3] * cos(abs(hoekr));
    float h = list[0] * cos(abs(hoekr));
    float i = list[1] * cos(abs(hoekr));
    float ee = list[5] * cos(abs(hoekrr));
    float dd = list[6] * cos(abs(hoekrr));
    float ff = list[4] * cos(abs(hoekrr));
    int ei = Math.round(e);
    int gi = Math.round(g);
    int hi = Math.round(h);
    int ii = Math.round(i);
    int eei = Math.round(ee);
    int ffi = Math.round(ff);
    int ddi = Math.round(dd);
    hoekd = fixDec(hoekd, 2);
    hoekdd = fixDec(hoekdd, 2);
    //display the strings in the text boxes 
    Textarea_1.setText("Distance a: " + display_1a);
    Textarea_2.setText("Distance b: " + display_2b);
    Textarea_3.setText("Distance d: " + display_3d);
    Textarea_4.setText("Distance f: " + display_4f);
    Textarea_5.setText("Distance c:");
    Textarea_6.setText("Distance c: " + value1[0]);
    Textarea_7.setText("Distance e: " + ei);
    Textarea_8.setText("Distance g: " + gi);
    Textarea_9.setText("Distance h: " + hi);
    Textarea_10.setText("Distance i: " + ii);
    Textarea_11.setText("Hoek α: " + hoekd);
    Textarea_12.setText("Distance a: " + display_5a);
    Textarea_13.setText("Distance b: " + display_6b);
    Textarea_14.setText("Distance d: " + ddi);
    Textarea_15.setText("Distance f: " + ffi);
    Textarea_16.setText("Distance e: " + eei);
    Textarea_17.setText("Distance g: " + display_7g);
    Textarea_20.setText("Hoek α: " + hoekdd);
    }
  }
}
float fixDec(float n, int d) {
  return Float.parseFloat(String.format("%." + d + "f", n));
}
//check in which tab the user is and reader the correspondent background and image
void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    if (theControlEvent.getTab()
      .getId() == 1) {
      background(myColor);
      myColor = lerpColor(0, 255, 1);
      image(img1, 40, 300);
    } else {
      background(myColor);
      myColor = lerpColor(0, 255, 1);
      image(img3, 200, 230);
    }
  }
}
public void input(String theText) {
  // automatically receives results from controller input
  println("Distance c: " + theText);
  output1 = createWriter("Sensor_data/tempd.txt");
  output1.println(theText);
  output1.flush();
  output1.close();
}
public void Save1() {
  String[] value = loadStrings("Sensor_data/temps.txt");
  String[] value1 = loadStrings("Sensor_data/tempd.txt");
  int[] list = int(split(value[0], ','));
  int[] tempd = int(split(value1[0], ","));
  if (list[0] >= 0 && tempd[0] >= 0) {
    float hoekr = atan2((list[1] - list[0]), tempd[0]);
    float hoekd = degrees(hoekr);
    float e = list[2] * cos(abs(hoekr));
    float g = list[3] * cos(abs(hoekr));
    float h = list[0] * cos(abs(hoekr));
    float i = list[1] * cos(abs(hoekr));
    int ei = Math.round(e);
    int gi = Math.round(g);
    int hi = Math.round(h);
    int ii = Math.round(i);
    hoekd = fixDec(hoekd, 2);
    TableRow newRow = table1.addRow();
    newRow.setInt("Distance a", list[0]);
    newRow.setInt("Distance b", list[1]);
    newRow.setInt("Distance c", tempd[0]);
    newRow.setInt("Distance d", list[2]);
    newRow.setInt("Distance e", ei);
    newRow.setInt("Distance f", list[3]);
    newRow.setInt("Distance g", gi);
    newRow.setInt("Distance h", hi);
    newRow.setInt("Distance i", ii);
    newRow.setFloat("Hoek", hoekd);
    println("Save done!");
    println(list);
  } else {
    println("Error");
  }
}
public void Save2() {
  String[] value = loadStrings("Sensor_data/temps.txt");
  String[] value1 = loadStrings("Sensor_data/tempd.txt");
  int[] list = int(split(value[0], ','));
  int[] tempd = int(split(value1[0], ","));
  if (list[0] >= 0 && tempd[0] >= 0) {
    float hoekrr = atan2((list[5] - list[4]), tempd[0]);
    float hoekdd = degrees(hoekrr);
    float ee = list[5] * cos(abs(hoekrr));
    float dd = list[6] * cos(abs(hoekrr));
    float ff = list[4] * cos(abs(hoekrr));
    int eei = Math.round(ee);
    int ffi = Math.round(ff);
    int ddi = Math.round(dd);
    hoekdd = fixDec(hoekdd, 2);
    TableRow newRow = table2.addRow();
    newRow.setInt("Distance a", list[4]);
    newRow.setInt("Distance b", list[5]);
    newRow.setInt("Distance c", tempd[0]);
    newRow.setInt("Distance d", ddi);
    newRow.setInt("Distance e", eei);
    newRow.setInt("Distance f", ffi);
    newRow.setInt("Distance g", list[6]);
    newRow.setFloat("Hoek", hoekdd);
    println("Save done!");
    println(list);
  } else {
    println("Error");
  }
}
void keyPressed() {
  if (keyCode == TAB) {
    cp5.getTab("garage_parkeren")
      .bringToFront();
  }
}
void exit() {
  int lastPort = Serial.list()
    .length - 1;
  if (lastPort < 0) {
    int s = second();
    int mi = minute();
    int h = hour();
    int d = day();
    int m = month();
    int y = year();
    table1.removeRow(0);
    table2.removeRow(0);
    saveTable(table1, "Sensor_data/File_parkeren_" + s + "-" + mi + "-" + h + "_" + d + "-" + m + "-" + y + ".csv");
    saveTable(table2, "Sensor_data/Garage_parkeren_" + s + "-" + mi + "-" + h + "_" + d + "-" + m + "-" + y + ".csv");
    noLoop();
  } else {
    int s = second();
    int mi = minute();
    int h = hour();
    int d = day();
    int m = month();
    int y = year();
    table1.removeRow(0);
    table2.removeRow(0);
    saveTable(table1, "Sensor_data/File_parkeren_" + s + "-" + mi + "-" + h + "_" + d + "-" + m + "-" + y + ".csv");
    saveTable(table2, "Sensor_data/Garage_parkeren_" + s + "-" + mi + "-" + h + "_" + d + "-" + m + "-" + y + ".csv");
    port.stop();
    noLoop();
  }
}
