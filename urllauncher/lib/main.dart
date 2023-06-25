import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => {goToWebsite("https://youtube.com")},
            child: const Text("click"),
          ),
        ),
      ),
    );
  }

  void goToWebsite(String address) {
    launchUrl(
      Uri.parse(address),
    );
  }
}
