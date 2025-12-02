import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/ifqh.dart';

class KeyboardRow extends StatelessWidget {
	const KeyboardRow({super.key});

	@override
	Widget build(BuildContext context) {
		List<Widget> letters = [];

		for (int i = 0; i < answerKeyHashmap.length; i++) {
			//print(answerHashmap.keys.elementAt(i));
			//print(answerHashmap.values.elementAt(i));
			String letter = answerKeyHashmap.keys.elementAt(i);
			Widget letterWidget = Container(
				child: Text(letter),
			);
			letters.add(letterWidget);
		}

		return Row(
			children: letters
		);
	}
}
