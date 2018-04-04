PImage elevation(PImage in, PImage tex) {
  PImage result = new PImage(in.width, in.height, RGB);  
  result = mono(in);
  result = Laplacian(result);
  result = add_texture(result, tex);
  return result;
}

PImage Laplacian(PImage in) {
  PImage result = new PImage(in.width, in.height, RGB);
  in = mono(in);
  int[][] filter = {
    {0, 1, 0}, 
    {1, -4, 1}, 
    {0, 1, 0}, 
  };

  int filter_median = int(filter.length*0.5);
  for (int y = 1; y < in.height-1; y++) {
    for (int x = 1; x < in.width-1; x++) {
      float c = 0;
      for (int fx=0; fx<filter.length; fx++) {
        for (int fy=0; fy<filter[0].length; fy++) {
          // 出力画像の画素値を決定
          c += brightness(in.get(x+(fx-filter_median), y+(fy-filter_median)))*filter[fx][fy];
        }
      }
      result.set(x, y, color(0, 0, c));
    }
  }
  return result;
}

PImage mono(PImage in) {
  PImage result = new PImage(in.width, in.height, RGB);
  in.loadPixels();
  for (int i = 0; i < in.pixels.length; i++) {
    color c = in.pixels[i];
    result.pixels[i] = color(0, 0, int(0.299*red(c) + 0.587*green(c) + 0.144*blue(c)));
  }
  return result;
}

PImage add_texture(PImage in, PImage tex) {
  PImage result = new PImage(in.width, in.height, RGB);
  in.loadPixels();
  for (int y = 0; y < in.height; y++ ) {
    for (int x = 0; x < in.width; x++ ) {
      color c = in.get(x, y);
      color tC = tex.get(x, y);
      
      //スライダー
      float tex_str = tex_var.val();
      float bound_str = bound_var.val();

      int b = int(brightness(c)*bound_str + brightness(tC)*tex_str*(1-bound_str));
      //if(brightness(c) > brightness(tC)) b = int(brightness(c));
      //else b = int(brightness(tC));

      c = color(hue(c), saturation(c), b);
      result.set(x, y, c);
    }
  }
  return result;
}