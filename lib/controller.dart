import 'package:flutter/material.dart';
import 'package:im_feeling_quite_hungry/ifqh.dart';
import 'package:im_feeling_quite_hungry/models/tile_model.dart';

class Controller extends ChangeNotifier {
  String correctWord = "";
  int currentTile = 0;
  int currentRow = 0;
  List<TileModel> tilesEntered = [];

  void setCorrectWord({required String word}) {
    correctWord = word;
    print("Correct word: $correctWord");
  }

  void setKeyTapped({required String value}){
    if (value == 'ENTER'){
      if (currentTile % 5 == 0 && currentTile != 0) {
        checkWord();
        currentTile = 0;
      }
    } else if (value == 'BACK') {
      if(currentTile > 0) {
        currentTile--;
        tilesEntered.removeLast();
      }
    } else {
      if(currentTile < 5) {
        tilesEntered.add(TileModel(letter: value, type: AnswerType.notAnswered));
        currentTile++;
      }
    }
    notifyListeners();
  }

  void checkWord() {
    // start + end of current row of tiles
    int rowStartIndex = currentRow * 5;
    int rowEndIndex = rowStartIndex + 5;

    // add every guessed letter to guessed[].
    List<String> guessed = [];
    for (int i = rowStartIndex; i < rowEndIndex; i++) {
      guessed.add(tilesEntered[i].letter);
    }

    String guessedWord = guessed.join();
    List<String>remainingCorrect = correctWord.characters.toList();

    // on the correct permutation of the guess -> all green
    if (guessedWord == correctWord) {
      for (int i = rowStartIndex; i < rowEndIndex; i++) {
        tilesEntered[i].type = AnswerType.correct;
        answerKeyHashmap.update(tilesEntered[i].letter, (value) => AnswerType.correct);
      }
      currentRow++;
      notifyListeners();
      return;
    }

    // first pass -> marking correct and in correct order
    for (int i = 0; i < 5; i++) {
      if (guessedWord[i] == correctWord[i]) {
        remainingCorrect.remove(guessedWord[i]);
        tilesEntered[i + rowStartIndex].type = AnswerType.correct;
        answerKeyHashmap.update(guessedWord[i], (value) => AnswerType.correct);
      }
    }

    // second pass -> marking correct but in wrong order
    for (int i = 0; i < 5; i++) {
      if (tilesEntered[rowStartIndex + i].type == AnswerType.correct) continue;

      String letter = guessedWord[i];
      if (remainingCorrect.contains(letter)) {
        tilesEntered[rowStartIndex + i].type = AnswerType.contains;
        remainingCorrect.remove(letter);
        if (answerKeyHashmap[letter] == AnswerType.notAnswered) {
          answerKeyHashmap.update(letter, (value) => AnswerType.contains);
        }
      }
    }

    // third pass -> marking incorrect
    for (int i = rowStartIndex; i < rowEndIndex; i++) {
      if (tilesEntered[i].type == AnswerType.notAnswered) {
        tilesEntered[i].type = AnswerType.incorrect;
        answerKeyHashmap.update(tilesEntered[i].letter, (value) => AnswerType.incorrect);
      }
    }
    currentRow++;
    notifyListeners();
  }
}