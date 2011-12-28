import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import processing.opengl.*;

PeasyCam cam;
cubeDraw[] cubes;

float spin, spin2, spin3, spin4, diam, angle = 0.0;
int count;

void setup(){
  size(720, 480, OPENGL);
  smooth();
  noStroke();
  cam = new PeasyCam(this,2000);
  cam.setMinimumDistance(1);
  cam.setMaximumDistance(10000);
  int distance = 3;
  count = int(pow(distance, distance));
  cubes = new cubeDraw[count];
  int index = 0;
  for (int y = 0; y < distance; y++) {
    for (int x = 0; x < distance; x++) {
      for (int z = 0; z < distance; z++) {

        cubes[index++] = new cubeDraw(100,100,100,1); 
      }
    }
  }
}
void draw(){
  background(255);
  pointLight(150, 150, 0, 0, 0, 0); 
  pointLight(25,255,200,100,0,0);
  pointLight(255,0,25,-100,0,-100);
  directionalLight(0, 102, 255, 0, 0, 1);
  spin4 += 0.03;
  rotateX(spin4);
  for (int i = 0; i < count; i++) {
    float r = 0.015;
    translate(0,0,0);
    rotateX(r = r++);
    rotateY(r = r++);
    rotateZ(r = r++);
    cubes[i].update();
    cubes[i].draw();
  }
}
class cubeDraw {
  float numX, numY, numZ;
  float numSize;
  // Contructor (required)
  cubeDraw(float inumX, float inumY, float inumZ, float inumSize) {
    numX = inumX;
    numY = inumY;
    numZ = inumZ;
    numSize = inumSize;
  }
  void update(){
    numX = numX++;
    if (numX >= 20){
      numX = numX--;
    }
    numY = numY++;
    if (numY >= 20){
      numY = numY--;
    }
    numZ = numZ++;
    if (numZ >= 20){
      numZ = numZ--;
    }
    numSize = numSize+1;
    if (numSize >= 1000){
      numSize = numSize*-1;
    }
    translate(10,-10,-10);
    rotateX(90);
    rotateY(-90);
    rotateZ(-45);
  }
  void draw() {
    diam = 60*sin(angle) + 90;
    angle += 0.001;
    if (angle > TWO_PI) { 
      angle = 0; 
    }
    spin2 += 0.0001;
    spin += 0.00001;
    rotateX(spin2);
    rotateY(spin2);
    rotateZ(spin2);
    for(int x=1;x<4;x++){
      for(int y=1;y<4;y++){
        for(int z=1;z<4;z++){
          pushMatrix();
          scale(1);
          translate(numX*5,numY*5,numZ*5);
          rotateX(spin);
          rotateY(spin);
          rotateZ(spin);
          fill(diam);
          box(numSize);
          popMatrix();
        }
      }
    }
  }
}

