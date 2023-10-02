import 'package:flutter/material.dart';
import 'package:messaging_app_ui/theme/theme_notifier.dart';
import 'package:provider/provider.dart';


Color appBarTittleColor(ThemeData themeData){
  print(themeData.toString());
  return themeData == ThemeData.light()? Colors.black: Colors.white;
}