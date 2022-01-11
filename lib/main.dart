import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';
import 'package:ortalama_hesaplama/widgets/main_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Sabitler.baslikText,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainWidget(),
    );
  }
}

