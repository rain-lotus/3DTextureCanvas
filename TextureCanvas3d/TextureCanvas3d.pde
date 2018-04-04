PImage Img, Out, Texture, fold; 
String[] texs = {"tex1.png", "tex2.jpg", "tex3.jpg", "tex4.jpg", "tex5.jpg"};
int textnum = 0;

Slider tex_var = new Slider(70, 660, 0, 1);
Slider bound_var = new Slider(70, 710, 0, 1);

void setup() {
  size(800, 800, P3D);
  fold = loadImage("fold.png");
  Img = new PImage(500, 500, RGB);
  Texture = loadImage(texs[textnum]);
  imginit();
  noStroke();
  colorMode(HSB, 256);
} 

void imginit() {
  Texture = Texture.get(0, 0, Img.width, Img.height);
  Out = new PImage(Img.width, Img.height, RGB);
}

void draw() {
  if (getFile != null) {
    //ファイルを取り込む
    fileLoader();
  } 

  ambientLight(0, 0, 80);    //環境光を当てる
  lightSpecular(0, 0, 255);    //光の鏡面反射色（ハイライト）を設定
  directionalLight(0, 0, 256, 0, 1, -1);    //指向性ライトを設定
  background(0);
  //fix(Img, Out, Texture);
  //image(elevation(Img, Texture), 0, 0);

  tex_var.disp();
  bound_var.disp();

  image(fold, 630, 630);

  fill(255);
  triangle(520, 640, 570, 680, 520, 720);
  triangle(500, 640, 500, 720, 450, 680);

  translate(width/2, height/2 - 50);
  rotateY(radians(-1 * (width/2 - mouseX)*0.2));
  rotateX(radians((height/2 - mouseY)*0.2));
  translate(-1 * Img.width/2, -1 * Img.height/2);
  pic_popup(elevation(Img, Texture), Img);
}

void mousePressed() {
  tex_var.mousePressed();
  bound_var.mousePressed();

  if (630 < mouseX && mouseX < 730&&630 < mouseY&&mouseY < 730) getFile = getFileName();
  else if (450 < mouseX && mouseX < 500&&640 < mouseY&&mouseY < 720) {    
    textnum = (textnum+1)%texs.length;
    Texture = loadImage(texs[textnum]);
    imginit();
  }else if (520 < mouseX && mouseX < 570&&640 < mouseY&&mouseY < 720) {
    textnum--;
    if(textnum < 0) textnum = texs.length-1;
    Texture = loadImage(texs[textnum]);
    imginit();
  }
}

void mouseReleased() {
  tex_var.mouseReleased();
  bound_var.mouseReleased();
}