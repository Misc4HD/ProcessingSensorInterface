//import the used librarys
import controlP5.*;
import processing.serial.*;
//define the image and table
PImage img1;
PImage img2;
Table table1;
Table table2;
//define the serial port and GUI controller
Serial port;
ControlP5 cp5;
PrintWriter output;
//define text boxes
Textarea Textarea_1;
Textarea Textarea_2;
Textarea Textarea_3;
Textarea Textarea_4;
//define all intigers
int distance_1 = 0;
int distance_2 = 0;
int distance_3 = 0;
int distance_4 = 0;

int myColor = color(255,255,255);

void setup() {
  int s = second();
  int mi = minute();
  int h = hour();
  int d = day();
  int m = month();
  int y = year();
  output = createWriter("temp.txt");
  output.println(s + "-"+ mi + "-" + h + "_" + d + "-" + m + "-" + y);
  output.flush(); 
  output.close();
  //load background images
  img1 = loadImage("Opstelling_File.png");
  img2 = loadImage("Background.png");
  //print the available serial ports
  printArray(Serial.list());
  //select port from the listed array
  //replace [0] to [1],[2]...for selecting a usable open port
  port = new Serial(this,Serial.list()[0], 9600); 
  //create a new table and generate the collums
  table1 = new Table();
  table1.addColumn("Distance 1");
  table1.addColumn("Distance 2");
  table1.addColumn("Distance 3");
  table1.addColumn("Distance 4");
  table2 = new Table();
  table2.addColumn("Distance 1");
  table2.addColumn("Distance 2");
  table2.addColumn("Distance 3");
  table2.addColumn("Distance 4");
  //window size off the app
  size(800,450);
  noStroke();
  
  cp5 = new ControlP5(this);
  //create the buttons in the tabs  
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
  //move button 2 to tab 2
  cp5.getController("Measure_2").moveTo("garage_parkeren");
  //create all the used text boxes       
  Textarea_1 = cp5.addTextarea("Text_Distance_1")
                  .setPosition(100,100)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0));                   
  Textarea_2 = cp5.addTextarea("Text_Distance_2")
                  .setPosition(100,130)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0));
  Textarea_3 = cp5.addTextarea("Text_Distance_3")
                  .setPosition(100,160)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0));  
  Textarea_4 = cp5.addTextarea("Text_Distance_4")
                  .setPosition(100,190)
                  .setSize(200,200)
                  .setFont(createFont("arial",20))
                  .setLineHeight(14)
                  .setColor(color(0));
  //move all the text boxes to the global front to display them on all tabs               
  Textarea_1.moveTo("global");
  Textarea_2.moveTo("global");
  Textarea_3.moveTo("global");
  Textarea_4.moveTo("global");
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
} 

void draw() {
        image(img2, 0, 0);
}
//check in which tab the user is and reader the correspondent background and image
void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    if (theControlEvent.getTab().getId() == 1){
      background(myColor);
      myColor = lerpColor(0,255,1);
      image(img1, 40, 250);
    }else{
      background(myColor);
      myColor = lerpColor(0,255,1);  
      image(img1, 40, 250);
    }
  }
}
//button click event
public void Measure_1() { 
  //set the background and image again to prevent it from disappearing  
  background(myColor);
  myColor = lerpColor(0,255,1);  
  image(img1, 40, 250);
  //check if the serial port is available
  if ( port.available() > 0) {
    //read the serial port as a string
    String value = port.readString();
      //if the serial port reads null ignore it
      if (value != null) {
             //split the string in to a list of intigers
             int[] list = int(split(value, ','));
             //create a new row in the table and add data to it
             TableRow newRow = table1.addRow();
             newRow.setInt("Distance 1", list[0]);
             newRow.setInt("Distance 2", list[1]);
             newRow.setInt("Distance 3", list[2]);
             newRow.setInt("Distance 4", list[3]);
             //convert the integers to strings
             String display_1 = Integer.toString(list[0]);
             String display_2 = Integer.toString(list[1]);
             String display_3 = Integer.toString(list[2]);
             String display_4 = Integer.toString(list[3]);
             //display the strings in the text boxes 
             Textarea_1.setText("Distance a: " + display_1);
             Textarea_2.setText("Distance b: " + display_2);
             Textarea_3.setText("Distance d: " + display_3);
             Textarea_4.setText("Distance f: " + display_4);
             //print info to the console
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
             TableRow newRow = table2.addRow();
             newRow.setInt("Distance 1", list[0]);
             newRow.setInt("Distance 2", list[1]);
             newRow.setInt("Distance 3", list[2]);
             newRow.setInt("Distance 4", list[3]);
             String display_1 = Integer.toString(list[0]);
             String display_2 = Integer.toString(list[1]);
             String display_3 = Integer.toString(list[2]);
             String display_4 = Integer.toString(list[3]);
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

void exit() {
  String[] lines = loadStrings("temp.txt");
  saveTable(table1, "Sensor_data/File_parkeren_" + lines[0] + ".csv");
  saveTable(table2, "Sensor_data/Garage_parkeren_" + lines[0] + ".csv");

}
