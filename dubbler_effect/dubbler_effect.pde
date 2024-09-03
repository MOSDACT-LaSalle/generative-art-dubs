/*---------------------------------
 Name: Carlos Dubón
 Date: Sept 2024
 Title:  Dubbler Effect
 Description:
 An interactive generative art piece inspired
 by radars and the negative space, designed to
 appreciate the patterns created by the 
 intersection of circles and moire patterns
 over different colors.
 Links:
 http://carlosdubon.me
 https://github.com/dubs92
 -----------------------------------*/


ArrayList<Circle> circles = new ArrayList<Circle>(); //defining and calling the array
 //variables used for the first configuration (before the class was created) and the background interaction
float circleSize; 
float circleChange = 5;
float circleOriginX;
float circleOriginY;
float seconds=0;
float bgColor;
float satStart=40;
float bnessStart=80;



void setup(){
  //size(1920,1080);
  fullScreen(2); //set up so it displays fullscreen on the second monitor, if not available, change value to 1)
  colorMode(HSB,360,100,100,100);
  background(bgColor,satStart,bnessStart);
  noCursor();
  
   /* for used to create multiple circles 
   the amount of circles is indicated in 
   in the second parameter, can be easily changed, 
   with different sizes and properties*/
   
  for (int i = 0; i < 10; i++) {
    float x = random(width);  // Random X position
    float y = random(height);  // Random Y position
    float size = random(50, 200);  // Random initial size
    float sizeVar = random(1, 5);  // Random growth rate
    color strokeColor = color(0, 0, 100,50);  // Random stroke color
    
    circles.add(new Circle(x, y, size, sizeVar, strokeColor));
  }
}
  


void draw(){
  float sat = satStart + map(mouseX,0,width, -40,60); //changes for the saturation for the bg
  float bness = bnessStart + map(mouseY, 0, height, -80,20); //changes for the brightness of the bg
  bgColor=seconds; //changes for the hue of the bg
  noStroke(); //no stroke for the bg
  fill(bgColor,sat,bness,10); //fill with transparency, so motion blur can be appreciated
  rect(0,0,width, height); //rectangle that fills all the background
  //noFill(); //nofill for the circle (original code)
  //stroke(295,0,100,100); (part of the original code, defininf the color of the stroke for the circle)
  //for to display the circles
    for (Circle c : circles) {
    c.update();
    c.display();
  }

  seconds = (frameCount)/30;
  //println(seconds); //checking the second counter
  if (seconds == 360){ //each time the hue gets to 360, it will come back to 0 to restart
    seconds = 0;
  }
  }
