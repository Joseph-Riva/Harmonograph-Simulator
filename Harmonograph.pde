
float nx;
float ny;
float x;
float y;
//time variable 
float t=0;
//amplitudes for x
float a1;
float a2;
//amplitude for y
float a3;
float a4;
//Frequencies for x 
float f1 = 1; 
float f2 = 9; 
//Frequencies for y 
float f3 = 5;
float f4 = 1;
//Phases for x 
float p1 = 3;
float p2 = 2; 
//Phases for y
float p3 = 7*PI/6;
float p4 = 2; 
//dampening constants
float d1= .001;
float d2 = .005;
float d3 = .01;
float d4 = .005; 
void setup(){
  //adjusts how many times draw() executes per second 
  frameRate(120);
  size(1000,1000);
  background(0);
  textSize(32);
  text("press 'r' to restart drawing", width/2, 50);
  x = width/2;
  y = height/2;
  a1 = a2 = a3 = a4 = 100;
  //frameRate(120);
}
void draw(){
  if(keyPressed){
    if(key == 'r'){
      setup();
      background(0);
      t = 0;
    }
  }  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  color c = color(r,g,b);
  //stroke(r,g,b);
  stroke(255);
  //gets euler's number 
  nx = width/2 + a1*cos(f1*t + p1)*exp(-d1*t) + a2*cos(f2*t + p2)*exp(-d2*t);
  ny = height/2 + a3*sin(f3*t + p3)*exp(-d3*t) + a4*sin(f4*t + p4)*exp(-d4*t);
  //print("x:" + nx);
  //print("y" + ny);
  if(t==0){
    stroke(0);
  }
  line(x,y,nx,ny);
  //setting line position to be the current x and y positions so the line is drawn from the last loops coordinates 
  //to this one and you get a clean curve
  x = nx;
  y = ny;
  //increase time every draw at a rate of framerate
  t = t+.01;
}
