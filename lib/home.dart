import 'dart:math';

import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/components/word_grid.dart' show WordGrid;
import 'package:im_feeling_quite_hungry/components/keyboard_row.dart' show KeyboardRow;
import 'package:provider/provider.dart';

import 'controller.dart';
import 'constants/words.dart';

class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late String word;

  @override
  void initState() {
    final r = Random().nextInt(words.length);
    word = words[r];

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false).setCorrectWord(word: word);
    });

    super.initState();
  }

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("IFQH"),
				centerTitle: true,
				elevation: 0,
			),

			//  Column is used to hold the grid and keyboard area
			body: Column(
				// And expanded forces the child to take up all the space in proportion
				// to whatever element is along with it
				children: [
          Divider(
            thickness: 2,
          ),
					Expanded(
						flex: 5,
						//child: Container(color: Colors.red),
						child: WordGrid(),
					),
					Expanded(
						flex: 3,
						//child: Container(color: Colors.green),
						child: Container(
							//color: Colors.green,
							child: Column(
								children: [
									KeyboardRow(min: 0, max: 9),
									KeyboardRow(min: 10, max: 18),
									KeyboardRow(min: 19, max: 27),
								],
							),
						),
					)
				],
			),
		);
	}
}
