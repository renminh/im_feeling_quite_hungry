import 'package:flutter/material.dart';

enum AnswerType {
	correct,
	contains,
	incorrect,
	notAnswered
}

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
	'L': AnswerType.notAnswered,

	'Z': AnswerType.notAnswered, 'X': AnswerType.notAnswered,
	'C': AnswerType.notAnswered, 'V': AnswerType.notAnswered,
	'B': AnswerType.notAnswered, 'N': AnswerType.notAnswered,
	'M': AnswerType.notAnswered,
};
