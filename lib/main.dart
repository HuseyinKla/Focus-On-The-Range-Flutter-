import 'package:flutter/material.dart';

import 'MainMenu.dart';

void main() {
  runApp(FOTR());
}

class FOTR extends StatelessWidget {
  const FOTR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo[900]),
        scaffoldBackgroundColor: Colors.indigo[300],
      ),
    );
  }
}
