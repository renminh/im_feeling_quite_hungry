import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/home.dart' show HomePage;
import 'package:im_feeling_quite_hungry/ifqh.dart';
import 'package:im_feeling_quite_hungry/themes/themes.dart';
import 'package:provider/provider.dart';
import 'controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller())
    ],
      child: const MainApp()
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: "I'm Feeling Quite Hungry!",
			theme: lightTheme,
      home: HomePage(),
		);
  }
}
