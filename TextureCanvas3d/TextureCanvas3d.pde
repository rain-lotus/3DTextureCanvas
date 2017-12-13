PImage Img, Out, Texture; 

Slider s = new Slider(100, 300, 0, 10);

void setup() {
  dragDropFile();
  size(500, 500, P3D);
  Img = loadImage("test2.bmp"); 
  Texture = loadImage("tex.png");
  Texture = Texture.get(0, 0, Img.width, Img.height);
  Out = new PImage(200, 200, RGB);
  noStroke();
  colorMode(HSB, 256);
} 

void draw() {
  ambientLight(0, 0, 50);    //環境光を当てる
  //lightSpecular(255, 255, 255);    //光の鏡面反射色（ハイライト）を設定
  directionalLight(0, 0, 256, 0, 1, -1);    //指向性ライトを設定

  background(0);

  //fix(Img, Out, Texture);
  image(elevation(Img, Texture), 0, 0);

  s.disp();

  translate(300, 300);
  rotateY(radians(-1 * (width/2 - mouseX)*0.2));
  rotateX(radians((height/2 - mouseY)*0.2));
  translate(-1 * Img.width/2, -1 * Img.height/2);
  pic_popup(elevation(Img, Texture), Img);
}