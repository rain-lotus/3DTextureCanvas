void build(PImage elevation, PImage img) {
  elevation.loadPixels();
  //面
  float x, y, z;
  int w = elevation.width;
  int h = elevation.height;
  int l = elevation.pixels.length;
  color c;

  for (int i = 0; i < l; i++) {
    c = elevation.pixels[i];
    x = i%elevation.width;
    y = -i/elevation.width;
    z = brightness(c)/20;

    //yはマイナス，面は反時計回り
    model.addVertex(new UVertex(x, y, z));
    if (i < w || i%w == 0) continue;
    model.addFace(i-w, i-1, i-(w+1)); 
    model.addFace(i, i-1, i-w);
  }

  //壁上
  for (int i = 0; i < w; i++) {
    x = i;
    y = 0;
    z = -10;
    model.addVertex(new UVertex(x, y, z));
    if (i == 0) continue;
    model.addFace(i-1, l+i, l+(i-1));
    model.addFace(i-1, i, l+i);
  }//l+w-1

  //壁右
  for (int i = 0; i < h; i++) {
    //奥
    x = w-1;
    y = -i;
    z = -10;
    model.addVertex(new UVertex(x, y, z));
    if (i == 0) continue;
    if (i == 1) {
      model.addFace(w*i-1, l+w-1, l+w);
      model.addFace(w*i-1, w*(i+1)-1, l+w);
    } else {
      model.addFace(w*i-1, l+w+(i-2), l+w+(i-1));
      model.addFace(w*i-1, w*(i+1)-1, l+w+(i-1));
    }
    //一番下l+w+h-2
  }

  //壁下
  for (int i = 0; i < elevation.width; i++) {
    //奥
    x = i;
    y = -(elevation.height-1);
    z = -10;
    model.addVertex(new UVertex(x, y, z));
    if (i == 0) continue;
    if (i == w-1) {
      model.addFace(l-2, l+w+h-2+i, l-1);//021
      model.addFace(l-1, l+w+h-2+i, l+w+h-2);//123
    } else {
      model.addFace(l-w+i-1, l+w+h-2+i, l-w+i);//021
      model.addFace(l-w+i, l+w+h-2+i, l+w+h-1+i);//123
    }
  }//right l+w+h+w-3; left l+w+h-1;

  //壁左
  for (int i = 0; i < elevation.height; i++) {
    //奥
    x = 0;
    y = -i;
    z = -10;
    model.addVertex(new UVertex(x, y, z));
    if (i == 0) continue;
    if (i == 1) {
      model.addFace(0, l, w);
      model.addFace(w, l, l+w*2+h-3+i);
    } else if (i == h-1) {
      model.addFace(w*(i-1), l+w*2+h+(i-4), w*i);
      model.addFace(w*i, l+w*2+h+(i-4), l+w+h-1);
    } else {
      model.addFace(w*(i-1), l+w*2+h+(i-4), w*i);//
      model.addFace(w*i, l+w*2+h+(i-4), l+w*2+h+(i-3));
    }
  }
  // l, l+w-1
  // right l+w+h+w-3; left l+w+h-1;

  //底
  model.addFace(l, l+w-1, l+w+h+w-3);
  model.addFace(l, l+w+h+w-3,  l+w+h-1);
}