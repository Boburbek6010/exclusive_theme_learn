import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

@immutable
class ThemeController{

  static const ThemeController _instance = ThemeController._internal();
   const ThemeController._internal();

   final String _boxName = "setting";
   final String _modeKey = "isLight";

   static Future<ThemeController>init()async{
     await Hive.initFlutter();
     await Hive.openBox<bool>(_instance._boxName);
     return _instance;
   }

   Box<bool> get box => Hive.box<bool>(_boxName);

   bool get read{
     return box.get(_instance._modeKey, defaultValue: true)!;
   }

   void update(){
     box.put(_instance._modeKey, !read);
   }

  ValueListenable<Box<bool>> get notifier => Hive.box<bool>(_boxName).listenable();

}

extension CustomContext on BuildContext{
  ThemeController get mode => ThemeController._instance;
  ThemeData get theme => Theme.of(this);
}