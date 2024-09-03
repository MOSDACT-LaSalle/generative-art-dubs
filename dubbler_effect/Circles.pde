//Circles will be drawn according to the following parameters

class Circle {
  float x, y; //variables for the origin point
  float size; //variable for the size of each circle
  float sizeVar; //variable for the size variation speed  
  color strokeColor; //variable for the stroke color
  
  Circle(float x, float y, float size, float sizeVar, color strokeColor) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.sizeVar = sizeVar;
    this.strokeColor = strokeColor;
  } //defatult class structure
  
  void update() {
    size += sizeVar; //the size will change with the sizeVar variable.
    
    // change the direction of sizeVar if boundaries are reached
    if (size >= width/random(2,5) || size <= 0) {
      sizeVar = -sizeVar;
    }
  }
  
  void display() {
    noFill();
    stroke(strokeColor);
    circle(x, y, size);
  }
}
