//JavaのSwingを取り込む
//http://kousaku-kousaku.blogspot.jp/2008/10/processingfilechooser.html
import javax.swing.*;
//画像インスタンスを用意 
PImage pimage;

//選択ファイルを用意し
//ファイルを空にしておく
String getFile = null;

//ファイルを取り込むファンクション 
void fileLoader(){
  //選択ファイルパスのドット以降の文字列を取得
  String ext = getFile.substring(getFile.lastIndexOf('.') + 1);
  //その文字列を小文字にする
  ext.toLowerCase();
  //文字列末尾がjpg,png,gif,tgaのいずれかであれば 
  if(ext.equals("jpg") || ext.equals("png") ||  ext.equals("gif") || ext.equals("bmp")){
    //選択ファイルパスの画像を取り込む
    pimage = loadImage(getFile);
    //入力画像に取り込んだ画像を代入
    Img = pimage;
    imginit();
  }
  //選択ファイルパスを空に戻す
  getFile = null; 
}

//ファイル選択画面、選択ファイルパス取得の処理 
String getFileName(){
  //処理タイミングの設定 
  SwingUtilities.invokeLater(new Runnable() { 
    public void run() {
 try {
   //ファイル選択画面表示 
   JFileChooser fc = new JFileChooser(); 
   int returnVal = fc.showOpenDialog(null);
   //「開く」ボタンが押された場合
   if (returnVal == JFileChooser.APPROVE_OPTION) {
     //選択ファイル取得 
     File file = fc.getSelectedFile();
     //選択ファイルのパス取得 
     getFile = file.getPath(); 
   } 
 }
 //上記以外の場合 
 catch (Exception e) {
   //エラー出力 
   e.printStackTrace(); 
 } 
    } 
  } 
  );
  //選択ファイルパス取得
  return getFile; 
}