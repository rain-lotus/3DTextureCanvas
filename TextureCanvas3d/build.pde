void build(PImage elevation, PImage img){
  elevation.loadPixels();

  //面
  float x, y, z;
  int w = elevation.width;
  color c;
  for (int i = 0; i < elevation.pixels.length; i++) {
    c = elevation.pixels[i];
    x = i%elevation.width;
    y = i/elevation.width;
    z = brightness(c)/20;
    
    model.addVertex(new UVertex(x, y, z));
    println(i);
    if (i < w || i%w == 0) continue;
    else {
      println(i-(w+1), i-1, i-w);
      println(i-w, i-1, i);
      model.addFace(i-(w+1), i-1, i-w); 
      model.addFace(i-w, i-1, i);
    }
  }

  ////壁上
  //beginShape(TRIANGLE_STRIP);
  //texture(img);
  //for (int i = 0; i < elevation.width; i++) {
  //  //0,0
  //  c = elevation.get(i, 0);
  //  x = i;
  //  y = 0;
  //  z = brightness(c)/20;
  //  vertex(x, y, z, x, y);

  //  //奥
  //  x = i;
  //  y = 0;
  //  z = -10;
  //  vertex(x, y, z, x, y+1);
  //}
  //endShape();

  ////壁右
  //beginShape(TRIANGLE_STRIP);
  //texture(img);
  //for (int i = 0; i < elevation.height; i++) {
  //  //0,0
  //  c = elevation.get(elevation.width-1, i);
  //  x = elevation.width-1;
  //  y = i;
  //  z = brightness(c)/20;
  //  vertex(x, y, z + 1, x-1, y);

  //  //奥
  //  x = elevation.width-1;
  //  y = i;
  //  z = -10;
  //  vertex(x, y, z, x, y);
  //}
  //endShape();

  ////壁下
  //beginShape(TRIANGLE_STRIP);
  //texture(img);
  //for (int i = 0; i < elevation.width; i++) {
  //  //0,0
  //  c = elevation.get(i, elevation.height-1);
  //  x = i;
  //  y = elevation.height-1;
  //  z = brightness(c)/20;
  //  vertex(x, y, z, x, y);

  //  //奥
  //  x = i;
  //  y = elevation.height-1;
  //  z = -10;
  //  vertex(x, y, z, x, y-1);
  //}
  //endShape();

  ////壁左
  //beginShape(TRIANGLE_STRIP);
  //texture(img);
  //for (int i = 0; i < elevation.height; i++) {
  //  //0,0
  //  c = elevation.get(0, i);
  //  x = 0;
  //  y = i;
  //  z = brightness(c)/20;
  //  vertex(x, y, z, x-1, y);

  //  //奥
  //  x = 0;
  //  y = i;
  //  z = -10;
  //  vertex(x, y, z, x, y);
  //}
  //endShape();
}