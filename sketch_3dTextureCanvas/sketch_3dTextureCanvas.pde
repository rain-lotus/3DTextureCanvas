PImage Img, Out, Texture;

void setup() {
  size(500, 500, P3D);
  Img = loadImage("test2.bmp"); 
  Texture = loadImage("tex.png");
  Texture = Texture.get(0, 0, Img.width, Img.height);
  Out = new PImage(200, 200, RGB);
  noStroke();
  colorMode(HSB, 256);
} 


void draw() {
  ambientLight(0, 0, 30);    //環境光を当てる
  //lightSpecular(255, 255, 255);    //光の鏡面反射色（ハイライト）を設定
  directionalLight(0, 0, 256, 0, 1, -1);    //指向性ライトを設定

  background(0);

  fix(Img, Out, Texture);
  image(Out, 0, 0);

  translate(200, 200);
  rotateY(frameCount/50.0);
  translate(-100, 0);
  make_face(Out, Img);
}



void fix(PImage in, PImage out, PImage tex) {
  in.loadPixels();
  for (int y = 0; y < in.height; y++ ) {
    for (int x = 0; x < in.width; x++ ) {
      color c = in.get(x, y);
      color tC = tex.get(x, y);
      int b = int((brightness(c) + brightness(tC))*0.5);
      c = color(hue(c), saturation(c), b);
      out.set(x, y, c);
    }
  }
}



void make_face(PImage elevation, PImage img) {
  elevation.loadPixels();

  //面
  beginShape(TRIANGLE_STRIP);
  texture(img);
  float x, y, z;
  color c;
  for (int i = 0; i < elevation.pixels.length - elevation.width; i++) {
    //0,0
    c = elevation.pixels[i];
    x = i%elevation.width;
    y = i/elevation.width;
    z = brightness(c)/20;
    vertex(x, y, z, x, y);
    //左上
    if (i%elevation.width == 0) {
      vertex(x, y, z, x, y);
    }
    //0,1
    c = elevation.pixels[i+elevation.width];
    x = i%elevation.width;
    y = i/elevation.width + 1;
    z = brightness(c)/20;
    //右下
    vertex(x, y, z, x, y);
    if (i%elevation.width == elevation.width-1) {
      vertex(x, y, z, x, y);
    }
  }
  endShape();

  //壁上
  beginShape(TRIANGLE_STRIP);
  texture(img);
  for (int i = 0; i < elevation.width; i++) {
    //0,0
    c = elevation.get(i, 0);
    x = i;
    y = 0;
    z = brightness(c)/20;
    vertex(x, y, z, x, y);

    //奥
    x = i;
    y = 0;
    z = -10;
    vertex(x, y, z, x, y+1);
  }
  endShape();

  //壁右
  beginShape(TRIANGLE_STRIP);
  texture(img);
  for (int i = 0; i < elevation.height; i++) {
    //0,0
    c = elevation.get(elevation.width-1, i);
    x = elevation.width-1;
    y = i;
    z = brightness(c)/20;
    vertex(x, y, z, x-1, y);

    //奥
    x = elevation.width-1;
    y = i;
    z = -10;
    vertex(x, y, z, x, y);
  }
  endShape();

  //壁下
  beginShape(TRIANGLE_STRIP);
  texture(img);
  for (int i = 0; i < elevation.width; i++) {
    //0,0
    c = elevation.get(i, elevation.height-1);
    x = i;
    y = elevation.height-1;
    z = brightness(c)/20;
    vertex(x, y, z, x, y);

    //奥
    x = i;
    y = elevation.height-1;
    z = -10;
    vertex(x, y, z, x, y-1);
  }
  endShape();

  //壁左
  beginShape(TRIANGLE_STRIP);
  texture(img);
  for (int i = 0; i < elevation.height; i++) {
    //0,0
    c = elevation.get(0, i);
    x = 0;
    y = i;
    z = brightness(c)/20;
    vertex(x, y, z, x-1, y);

    //奥
    x = 0;
    y = i;
    z = -10;
    vertex(x, y, z, x, y);
  }
  endShape();
}