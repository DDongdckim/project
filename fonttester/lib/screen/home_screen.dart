import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String str = "";

  void onChanged(text) {
    setState(() {
      str = text;
    });
  }

  List<String> fontFamilies = [
    "BebasNeue",
    "Inspiration",
    "Orbitron",
    "Oswald",
    "RubikPixels",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                _InputBox(
                  onChanged: onChanged,
                ),
                ...fontFamilies
                    .map((e) => _TextBox(
                          str: str,
                          family: e,
                        ))
                    .toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InputBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const _InputBox({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: (text) {},
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.blueAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
      ),
    );
  }
}

class _TextBox extends StatelessWidget {
  final String str;
  final String family;
  const _TextBox({required this.str, required this.family});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 200.0,
          width: 50.0,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  family,
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    str,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: family,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
