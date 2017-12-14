PImage Img, Out, Texture; 

Slider tex_var = new Slider(100, 700, 0, 1);
Slider bound_var = new Slider(100, 750, 0, 1);

void setup() {
  size(800, 800, P3D);
  Img = loadImage("2017_9こさめ2.png"); 
  Texture = loadImage("tex5.jpg");
  Texture = Texture.get(0, 0, Img.width, Img.height);
  Out = new PImage(Img.width, Img.height, RGB);
  noStroke();
  colorMode(HSB, 256);
} 

void draw() {
  ambientLight(0, 0, 80);    //環境光を当てる
  lightSpecular(0, 0, 255);    //光の鏡面反射色（ハイライト）を設定
  directionalLight(0, 0, 256, 0, 1, -1);    //指向性ライトを設定
  background(0);
  //fix(Img, Out, Texture);
  //image(elevation(Img, Texture), 0, 0);

  tex_var.disp();
  bound_var.disp();

  translate(width/2, height/2 - 50);
  rotateY(radians(-1 * (width/2 - mouseX)*0.2));
  rotateX(radians((height/2 - mouseY)*0.2));
  translate(-1 * Img.width/2, -1 * Img.height/2);
  pic_popup(elevation(Img, Texture), Img);
}

void mousePressed() {
  tex_var.mousePressed();
  bound_var.mousePressed();
}

void mouseReleased() {
  tex_var.mouseReleased();
  bound_var.mouseReleased();
}