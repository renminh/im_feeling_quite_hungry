import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/ifqh.dart';
import 'package:provider/provider.dart';
import 'package:im_feeling_quite_hungry/controller.dart';

class KeyboardRow extends StatelessWidget {
	KeyboardRow({super.key, required this.min, required this.max});

  final int min, max;
	@override
	Widget build(BuildContext context) {
		return Consumer<Controller>(
      builder: (_, notifier, __) {
        List<Widget> keys = [];
        final Size size = MediaQuery.sizeOf(context);
        
        for (int i = min; i <= max; i++) {
          final String keyText = answerKeyHashmap.keys.elementAt(i);
          final AnswerType keyType = answerKeyHashmap.values.elementAt(i);

          double width = keyText == 'ENTER' || keyText == 'BACK' 
                          ? size.width * 0.13 
                          : size.width * 0.085;

          Color color = Theme.of(context).primaryColorLight;
          Color textColor = Colors.black;

          if (keyType != AnswerType.notAnswered) {
            textColor = Colors.white;
          }

          if (keyType == AnswerType.correct) {
            color = keyboardColorCorrectGreen;
          } else if (keyType == AnswerType.contains) {
            color = keyboardColorContainsYellow;
          } else if (keyType == AnswerType.incorrect) {
            color = Theme.of(context).primaryColorDark;
          } else {
            textColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
          }
          
          Material textDesign = Material(
            color: color,
            child: InkWell(
              onTap: () {
                Provider.of<Controller>(context, listen: false)
                  .setKeyTapped(value: keyText);
              },
              child: Center(child: Text(keyText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor,
              ))),
          ));
          
          ClipRRect textButtonDesign = ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(6),
            child: SizedBox(
              width: width,
              height: size.height * 0.090,
              child: textDesign,
          ));

          Widget keyWidget = Padding(
            padding: EdgeInsetsGeometry.all(size.width * 0.006),
            child: textButtonDesign
            );
          keys.add(keyWidget);
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: keys
        );
      }
    );
	}
}
