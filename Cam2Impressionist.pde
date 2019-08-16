// Source code reference from https://www.openprocessing.org/sketch/703945

PImage img;

String[] images = { "img1.jpg", "img16.jpg", "img5.jpg",
                    "img6.jpg", "img17.jpg", "img8.jpg",
                    "img9.jpg", "img10.jpg", "img11.jpg",
                    "img12.jpg", "img13.jpg", "img15.jpg" };
int index, ctr;

void setup() {
  size(1280,800);
  background(255);
  frameRate(24);
  noStroke();
  
  ctr = 0;
  index = 0;
  
  //img = loadImage("/Users/dhananjaih/Downloads/tumblr_n0kp38UsQ31r6eyjlo1_500.png");
  //img = loadImage("/Users/dhananjaih/Downloads/IMG_2925.JPG");
  img = loadImage( images[index] );
  img.loadPixels();
}

void draw() {
  //image(img,0,0);
  // perform paitinng ops
  
  for(int i=0; i<200; i++) {
    drawPill();
  }
  ctr++;
  
  if (ctr >= 24*30) {
    ctr = 0;
    index++;
    background(255);
    img = loadImage( images[index % images.length] );
    img.loadPixels();
  }
  //println(ctr);
}

void drawPill() {
  int x = (int)random(width);
  int y = (int)random(height);
  
  color c = img.get(x, y);
  //color c = video.pixels[x+y*video.width];
  
  float lum = .2126 * red(c) + .7152 * green(c) + .0722 * blue(c);
  float angle = lum / 255 * PI;
  fill(c);
  
  //println(">>");
  
  pill(x, y, random(2, 10), random(2, 20), angle);
}

void pill( int x, int y, float w, float h, float rotation) {
  float size = w/6;
  float precision = w/600;
  push();
    translate(x, y);
    rotate(rotation);
    
    ellipse(0,0,w,h);
    
    /*beginShape();
      for(int j=0; j<TWO_PI; j+=precision){
        float s = size;
        if(j>PI) s = size*0.7;
          vertex(cos(j+PI)*s, sin(j+PI)*s + (j<PI ? -h/2 : h/2));
      }
    endShape(CLOSE);*/
  pop();
}
