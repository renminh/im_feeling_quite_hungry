import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/ifqh.dart';
import 'package:im_feeling_quite_hungry/components/word_grid.dart' show WordGrid;
import 'package:im_feeling_quite_hungry/components/keyboard_row.dart' show KeyboardRow;

class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
					Expanded(
						flex: 5,
						//child: Container(color: Colors.red),
						child: WordGrid(),
					),
					Expanded(
						flex: 3,
						//child: Container(color: Colors.green),
						child: Container(
							color: Colors.green,
							child: Column(
								children: [
									KeyboardRow(),
									KeyboardRow(),
									KeyboardRow(),
								],
							),
						),
					)
				],
			),
		);
	}
}
