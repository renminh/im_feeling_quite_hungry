import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/home.dart' show HomePage;

ThemeData theme = ThemeData(
	// fill this in for the theme
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
			debugShowCheckedModeBanner: false,
			title: "I'm Feeling Quite Hungry!",
			//theme: theme,
      home: HomePage(),
		);
  }
}
