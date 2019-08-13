int cx;
int num = 20;
PVector[] inkArray = new PVector[num];
PVector prevPos = new PVector(0,0);
float[] maxSize = new float[num];
float w,a;
PImage img;

void setup(){
  size(1024,768);
  background(225,229,232);
  
  img = loadImage("bg4.png");
  
  
  //pixelDensity(2);
  cx = width/2;
  
  for(int i=0;i<num;i++){
    inkArray[i] = new PVector(cx+random(-width/2,width/2),0);
    maxSize[i] = random(height);   
  }
}
  
void draw(){
  
  
  noStroke();
  
    stroke(157,30,0);
    fill(252,54,11);
  
  ellipse(width/2,height/2,300,300);
  
  image(img,0,0);
  
  //push();
  //noStroke();
  //fill(200,0,0);
  //lights();
  //translate(width/2,height/2,-10);
  //sphere(200);
  //pop();
  
  
  
  for(int i=0;i<num;i++){
    
    prevPos.x = inkArray[i].x;
    prevPos.y = inkArray[i].y;
    
    inkArray[i].x += random(-0.5,0.5);
    inkArray[i].y += random(3);
    
    w = maxSize[i]/(inkArray[i].y+40);
    a = map(inkArray[i].y,maxSize[i],0,0,200);
    
    strokeWeight(w);
    
    //if(frameCount<=500){
    //stroke(249,168,156,a);
    //}
    //else if(frameCount<=1000){
    //stroke(95,23,136,a);
    //}
    //else if(frameCount<=1500){
    //stroke(227,107,130,a);
    //}
    //else if(frameCount<=2000){
    //stroke(150,141,207,a);
    //}
    //else if(frameCount<=2500){
    //stroke(225,182,209,a);
    //}
    //else{
    //}
    stroke(0,a);
    
   
    
    
    if (inkArray[i].y < maxSize[i]) {
      line(prevPos.x, prevPos.y, inkArray[i].x, inkArray[i].y);
    } else {
      inkArray[i] = new PVector(random(-width/2, width/2) + cx, 0); 
      maxSize[i] = random(height);
    }
    
  }
  
  
}
