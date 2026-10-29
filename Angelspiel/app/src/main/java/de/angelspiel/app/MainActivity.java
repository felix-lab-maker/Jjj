package de.angelspiel.app;
import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.WebChromeClient;
import android.graphics.Color;
public class MainActivity extends Activity {
 private WebView web;
 @Override public void onCreate(Bundle b){
  super.onCreate(b);
  getWindow().setStatusBarColor(Color.rgb(6,22,35));
  getWindow().setNavigationBarColor(Color.rgb(8,28,44));
  web=new WebView(this);
  web.setBackgroundColor(Color.rgb(6,22,35));
  web.getSettings().setJavaScriptEnabled(true);
  web.getSettings().setDomStorageEnabled(true);
  web.getSettings().setAllowFileAccess(true);
  web.getSettings().setAllowContentAccess(false);
  web.setWebChromeClient(new WebChromeClient());
  web.setWebViewClient(new WebViewClient(){
    @Override public boolean shouldOverrideUrlLoading(WebView v,String url){
      return !url.startsWith("file:///android_asset/");
    }
  });
  setContentView(web);
  web.loadUrl("file:///android_asset/index.html");
 }
 @Override public void onBackPressed(){
  new android.app.AlertDialog.Builder(this)
   .setTitle("Angelspiel verlassen?")
   .setMessage("Deine Fänge und Fortschritte bleiben gespeichert.")
   .setPositiveButton("Beenden",new android.content.DialogInterface.OnClickListener(){
     public void onClick(android.content.DialogInterface d,int w){finish();}
   })
   .setNegativeButton("Weiter angeln",null)
   .show();
 }
}
