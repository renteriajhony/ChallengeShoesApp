import 'package:flutter/services.dart' as services;

void changeStatusBarLight(){
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.light);
}
void changeStatusBarDark(){
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.dark);
}