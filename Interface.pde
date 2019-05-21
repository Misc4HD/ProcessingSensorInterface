//import the used librarys.
import controlP5.*;
import processing.serial.*;
//define the image and table.
PImage img1;
PImage img2;
Table table;
//define the serial port and GUI controller.
Serial port;
ControlP5 cp5;
//define text boxes.
Textarea Textarea_1;
Textarea Textarea_2;
Textarea Textarea_3;
Textarea Textarea_4;
//define all intigers.
int distance_1 = 0;
int distance_2 = 0;
int distance_3 = 0;
int distance_4 = 0;

int myColor = color(255,255,255);

void setup() {
  img1 = loadImage("Opstelling_File.png");
  img2 = loadImage("Background.png");
  
  //print the available serial ports.
  printArray(Serial.list());
  //Select port from the listed array.
  //replace [0] to [1],[2]...for selecting a usable open port.
  port = new Serial(this,Serial.list()[0], 9600); 

  table = new Table();
  table.addColumn("Distance 1");
  table.addColumn("Distance 2");
  table.addColumn("Distance 3");
  table.addColumn("Distance 4");

  size(800,450);
  noStroke();
  cp5 = new ControlP5(this);
  
  cp5.addButton("Measure_1")
     .setValue(0)
     .setLabel("Measure")
     .setPosition(300,25)
     .setSize(200,40);
  cp5.addButton("Measure_2")
     .setValue(0)
     .setLabel("Measure")
     .setPosition(300,25)
     .setSize(200,40);

  cp5.getController("Measure_2").moveTo("garage_parkeren");
         
  Textarea_1 = cp5.addTextarea("Text_Distance_1")
                  .setPosition(100,100)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0))
                  ;                   
                  
  Textarea_2 = cp5.addTextarea("Text_Distance_2")
                  .setPosition(100,130)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0))
                  ;
  Textarea_3 = cp5.addTextarea("Text_Distance_3")
                  .setPosition(100,160)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0))
                  ;  
  Textarea_4 = cp5.addTextarea("Text_Distance_4")
                  .setPosition(100,190)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0))
                  ;
                  
  Textarea_1.moveTo("global");
  Textarea_2.moveTo("global");
  Textarea_3.moveTo("global");
  Textarea_4.moveTo("global");
                   
  cp5.getTab("default")
                 .activateEvent(true)
                 .setLabel("file parkeren")
                 .setHeight(40)
                 .setId(1)                 ;
  cp5.getTab("garage_parkeren")
                 .activateEvent(true)
                 .setLabel("garage parkeren")
                 .setHeight(40)
                 .setId(2)
                  ;
                             
} 

void draw() {
        image(img2, 0, 0);
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    if (theControlEvent.getTab().getId() == 1){
      background(myColor);
      myColor = lerpColor(0,255,1);
      image(img1, 40, 250);
    }else{
      background(myColor);
      myColor = lerpColor(0,255,1);  
    }
  }
}

/*
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n = 0;
}
*/

// function colorA will receive changes from 
// controller with name colorA
public void Measure_1() { 
  background(myColor);
      myColor = lerpColor(0,255,1);  
      image(img1, 40, 250);
  if ( port.available() > 0) {
    String value = port.readString();
           if (value != null) {
             int[] list = int(split(value, ','));
             distance_1 = list[0];
             distance_2 = list[1];
             distance_3 = list[2];
             distance_4 = list[3];      
             TableRow newRow = table.addRow();
             newRow.setInt("Distance 1", distance_1);
             newRow.setInt("Distance 2", distance_2);
             newRow.setInt("Distance 3", distance_3);
             newRow.setInt("Distance 4", distance_4);
             saveTable(table, "data/data.csv");
             String display_1 = Integer.toString(distance_1);
             String display_2 = Integer.toString(distance_2);
             String display_3 = Integer.toString(distance_3);
             String display_4 = Integer.toString(distance_4);
             Textarea_1.setText("Distance a: " + display_1);
             Textarea_2.setText("Distance b: " + display_2);
             Textarea_3.setText("Distance d: " + display_3);
             Textarea_4.setText("Distance f: " + display_4);
             println("Measurments done!");
             println(list);
         }
  }
}

public void Measure_2() { 
  background(myColor);
      myColor = lerpColor(0,255,1);  
      image(img1, 40, 250);
  if ( port.available() > 0) {
    String value = port.readString();
           if (value != null) {
             int[] list = int(split(value, ','));
             distance_1 = list[0];
             distance_2 = list[1];
             distance_3 = list[2];
             distance_4 = list[3];      
             TableRow newRow = table.addRow();
             newRow.setInt("Distance 1", distance_1);
             newRow.setInt("Distance 2", distance_2);
             newRow.setInt("Distance 3", distance_3);
             newRow.setInt("Distance 4", distance_4);
             saveTable(table, "data/data.csv");
             String display_1 = Integer.toString(distance_1);
             String display_2 = Integer.toString(distance_2);
             String display_3 = Integer.toString(distance_3);
             String display_4 = Integer.toString(distance_4);
             Textarea_1.setText("Distance a: " + display_1);
             Textarea_2.setText("Distance b: " + display_2);
             Textarea_3.setText("Distance d: " + display_3);
             Textarea_4.setText("Distance f: " + display_4);
             println("Measurments done!");
             println(list);
         }
  }
}

void keyPressed() {
  if(keyCode==TAB) {
    cp5.getTab("garage_parkeren").bringToFront();
  }
}
