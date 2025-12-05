import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/ifqh.dart';
import 'package:provider/provider.dart';
import 'package:im_feeling_quite_hungry/controller.dart';

class WordGrid extends StatelessWidget {
	int numLetters = 5;
	int numWords = 5;

  WordGrid({super.key});

	@override
	Widget build(BuildContext context) {
		return Container(
			//color: Colors.yellow,
			child: GridView.builder(
				padding: EdgeInsets.fromLTRB(36, 20, 36, 20),
				// to prevent scrolling we use physics
				physics: NeverScrollableScrollPhysics(),
				// should be a multiple of numLetters! but item count creates
				// n-items based on the itemBuilder function, so we have 5
				// letters per row, times 6, gives us 30 letters for 6 words or
				// 6 rows
				itemCount: numLetters * numWords,
				// Grid Delegate manages the layout of the childre while
				// Item builder builds the widget on demand!
				gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
					// spacing of rows and columns respectively
					mainAxisSpacing: 4,
					crossAxisSpacing: 4,
					// number of columns, that is, number of rows
					crossAxisCount: numLetters,
				),
				itemBuilder: (context, index) {
					return Tile(index: index);
				},
			),
		);
	}
}



class Tile extends StatefulWidget {
  const Tile ({super.key, required this.index});

  final int index;

  @override
  State<Tile> createState() => TileState();
}

class TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller> (
      builder:(_, notifier, __) {
        Color borderColor = Color.fromARGB(255, 211, 214, 215);
        Color textColor = Colors.black;
        late AnswerType answerType;
        Color bgColor = Colors.transparent;
        String text = "";
        Color fontColor = Colors.white;

        if (widget.index < notifier.tilesEntered.length) {
          text = notifier.tilesEntered[widget.index].letter;
          answerType = notifier.tilesEntered[widget.index].type;

          if (answerType != AnswerType.notAnswered) {
            textColor = Colors.white;
          }

          if (answerType == AnswerType.correct) {
            borderColor = Colors.transparent;
            bgColor = tileColorCorrectGreen;
          } else if (answerType == AnswerType.contains) {
            borderColor = Colors.transparent;
            bgColor = tileColorContainsYellow;
          } else if (answerType == AnswerType.incorrect) {
            borderColor = Colors.transparent;
            bgColor = Theme.of(context).primaryColorDark;
          } else {
            borderColor = Colors.transparent;
            fontColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
            bgColor = const Color.fromARGB(255, 199, 199, 199);    
          }

          return Container(
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(
                color: borderColor,
            )),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsetsGeometry.all(6.0),
                child: Text(text, style: TextStyle(color: fontColor))
              )
            )
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(
                color: borderColor,
            )),
          );
        }
    });
  }
}