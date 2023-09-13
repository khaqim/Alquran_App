import 'package:belajar_flutter_dari_nol/pages/bookmarks.dart';
import 'package:belajar_flutter_dari_nol/pages/homepage.dart';
import 'package:belajar_flutter_dari_nol/splashpage.dart';
import 'package:belajar_flutter_dari_nol/surahdetails.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
