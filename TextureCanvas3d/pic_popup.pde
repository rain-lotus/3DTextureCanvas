void pic_popup(PImage elevation, PImage img) {
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
    vertex(x, y, z, x, y);

    //右下
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
    vertex(x, y, z + 1, x-1, y);

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