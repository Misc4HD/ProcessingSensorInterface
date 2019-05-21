import controlP5.*;
import processing.serial.*;

Table table;
Serial port;
ControlP5 cp5;
Textarea Textarea;

int myColor = color(255);
int c1,c2;
float n,n1;

void setup() {
  //print the available serial ports.
  printArray(Serial.list());
  //Select port from the listed array.
  //replace [0] to [1],[2]...for selecting a usable open port.
  port = new Serial(this,Serial.list()[0], 9600); 

  table = new Table();
  table.addColumn("Distance 1");
  table.addColumn("Distance 2");
  table.addColumn("Distance 3");

  size(400,400);
  noStroke();
  cp5 = new ControlP5(this);
  
  cp5.addButton("Measure")
     .setValue(0)
     .setPosition(100,25)
     .setSize(200,40);
     
  cp5 = new ControlP5(this);
  
  Textarea = cp5.addTextarea("txt")
                  .setPosition(20,100)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0))
                  ;

} 

void draw() {
  background(myColor);
  myColor = lerpColor(c1,c2,n);
  n += (1-n)* 0.1; 
}

/*
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n = 0;
}
*/

// function colorA will receive changes from 
// controller with name colorA
public void Measure() { 
  c1 = c2;
  c2 = color(0,204,0);
  String value = port.readString();
         if (value != null) {
           int[] list = int(split(value, ','));
           int filter = 0;
           for (int i = 0; i<list.length; i++ ) {
             filter = list[0];
           }
           TableRow newRow = table.addRow();
           newRow.setInt("Distance 1", filter);
           saveTable(table, "data/data.csv");
           println("Measurments done!");
           println(list);
           String display = Integer.toString(filter);
           Textarea.setText("Distance1: " + display);

         }
}
