PImage Img, Out, tex;

void setup() {
  size(500, 500, P3D);
  Img = loadImage("test2.bmp"); 
  tex = loadImage("tex.png");
  tex = tex.get(0, 0, Img.width, Img.height);
  Out = new PImage(200, 200, RGB);
  noStroke();
  colorMode(HSB, 256);
} 


void draw() {

  background(0);

  fix(Img, Out, tex);
  image(Out, 0, 0);

  ambientLight(120, 120, 120);    //環境光を当てる
  lightSpecular(255, 255, 255);    //光の鏡面反射色（ハイライト）を設定
  directionalLight(100, 100, 100, 0, 1, -1);    //指向性ライトを設定

  translate(200, 200);
  rotateX(frameCount/50.0);
  make_face(Out);
}

void fix(PImage in, PImage out, PImage texture) {
  in.loadPixels();
  for (int y = 0; y < in.height; y++ ) {
    for (int x = 0; x < in.width; x++ ) {
      color c = in.get(x, y);
      color tC = texture.get(x, y);
      int b = int((brightness(c) + brightness(tC))*0.5);
      c = color(hue(c), saturation(c), b);
      out.set(x, y, c);
    }
  }
}

void make_face(PImage img) {
  img.loadPixels();

  beginShape(TRIANGLE_STRIP);
  texture(img);
  float x, y, z;

  for (int i = 0; i < img.pixels.length - img.width; i++) {
    color c = img.pixels[i];
    x = i%img.width;
    y = i/img.width;
    z = brightness(c)/20;
    vertex(x, y, z, x, y);
    if (i%img.width == 0) {
      vertex(x, y, z, x, y);
    }

    c = img.pixels[i+img.width];
    x = i%img.width;
    y = i/img.width + 1;
    z = brightness(c)/20;
    vertex(x, y, z, x, y);
    if (i%img.width == img.width-1) {
      vertex(x, y, z, x, y);
    }
  }
  endShape();
}