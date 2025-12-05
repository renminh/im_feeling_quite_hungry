import 'dart:ui';
import 'package:flutter/material.dart';

enum AnswerType {
	correct,
	contains,
	incorrect,
	notAnswered
}

const Color tileColorCorrectGreen = Color.fromARGB(255, 107, 170,100);
const Color tileColorContainsYellow = Color.fromARGB(255, 201, 180, 87);
const Color tileColorIncorrectGrey = Color.fromARGB(255, 133, 133, 133);

const Color keyboardColorCorrectGreen = Color.fromARGB(255, 107, 170,100);
const Color keyboardColorContainsYellow = Color.fromARGB(255, 201, 180, 87);
const Color keyboardColorIncorrectGrey = Color.fromARGB(255, 133, 133, 133);
const Color keyboardColorDefaultGrey = Color.fromARGB(255, 211, 211, 211);

const lightThemeLightShade = Color.fromARGB(255, 211, 214, 215);
const lightThemeDarkShade = Color.fromARGB(255, 120, 124, 127);

const darkThemeLightShade = Color.fromARGB(255, 130, 131, 133);
const darkThemeDarkShade = Color.fromARGB(255, 58, 58, 60);


// type hashmap will contain the states of all the keys depending on the word
  // grid.

  // The question is, should i really be using a hashmap? I could just represent
  // each of these characters as an int internally when retrieving input then
  // access that as the index via deducting whatever value if it's ascii from
  // the char to turn it into a proper indexable input.
  // The result then just becomes an array of type enums
  Map<String, AnswerType> answerKeyHashmap = {
    'Q': AnswerType.notAnswered, 'W': AnswerType.notAnswered,
    'E': AnswerType.notAnswered, 'R': AnswerType.notAnswered,
    'T': AnswerType.notAnswered, 'Y': AnswerType.notAnswered,
    'U': AnswerType.notAnswered, 'I': AnswerType.notAnswered,
    'O': AnswerType.notAnswered, 'P': AnswerType.notAnswered,

    'A': AnswerType.notAnswered, 'S': AnswerType.notAnswered,
    'D': AnswerType.notAnswered, 'F': AnswerType.notAnswered,
    'G': AnswerType.notAnswered, 'H': AnswerType.notAnswered,
    'J': AnswerType.notAnswered, 'K': AnswerType.notAnswered,
    'L': AnswerType.notAnswered, 'ENTER': AnswerType.notAnswered,

    'Z': AnswerType.notAnswered, 'X': AnswerType.notAnswered,
    'C': AnswerType.notAnswered, 'V': AnswerType.notAnswered,
    'B': AnswerType.notAnswered, 'N': AnswerType.notAnswered,
    'M': AnswerType.notAnswered, 'BACK': AnswerType.notAnswered,
  };