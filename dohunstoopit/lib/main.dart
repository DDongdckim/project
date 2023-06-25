import 'package:dohunstoopit/component/color_checkbox.dart';
import 'package:dohunstoopit/provider/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorTheme(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: context.watch<ColorTheme>().color,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("dohunstoopit"),
        ),
        body: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColorCheckBox(color: "red"),
            ColorCheckBox(color: "green"),
            ColorCheckBox(color: "blue")
          ],
        ),
      ),
    );
  }
}
