import 'package:flutter/material.dart';
import 'package:flutter_prompt/flutter_prompt.dart';
import 'package:flutter_prompt_example/custom_style.dart';
import 'package:flutter_prompt_example/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.white, fontSize: 10),
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => switch (states) {
                MaterialState.disabled => Colors.grey,
                MaterialState.selected => Colors.green,
                MaterialState.pressed => Colors.yellow,
                _ => Colors.blue,
              },
            ),
          ),
        ),
      ),
      home: Prompt.initRoot(
        child: const Home(),
        style: MyCustomStyle()
      ),
    );
  }
}
