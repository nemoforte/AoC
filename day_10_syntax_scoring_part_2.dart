// dart day_10_syntax_scoring_part_2.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_10.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split('\n');
  for (int j = 0; j < inputList.length; j++) {
    inputList[j] = inputList[j].trim();
  }

  // input list to array 2d cause idk how to operate on Strings
  List<List<String>> array =
      List<List<String>>.generate(inputList.length, (int j) => <String>[]);
  for (int j = 0; j < inputList.length; j++) {
    for (int i = 0; i < inputList[j].length; i++) {
      array[j].add(inputList[j][i]);
    }
  }

  // reducing chunks
  for (int j = 0; j < array.length; j++) {
    // print(array[j].join(' '));
    for (int i = 0; i < array[j].length - 1; i++) {
      if (array[j][i] == '(' && array[j][i + 1] == ')') {
        array[j].removeAt(i);
        array[j].removeAt(i);
        // print(array[j].join(' '));
        if (i > 0) {
          i -= 2;
        } else {
          i--;
        }
      } else if (array[j][i] == '[' && array[j][i + 1] == ']') {
        array[j].removeAt(i);
        array[j].removeAt(i);
        // print(array[j].join(' '));
        if (i > 0) {
          i -= 2;
        } else {
          i--;
        }
      } else if (array[j][i] == '{' && array[j][i + 1] == '}') {
        array[j].removeAt(i);
        array[j].removeAt(i);
        // print(array[j].join(' '));
        if (i > 0) {
          i -= 2;
        } else {
          i--;
        }
      } else if (array[j][i] == '<' && array[j][i + 1] == '>') {
        array[j].removeAt(i);
        array[j].removeAt(i);
        // print(array[j].join(' '));
        if (i > 0) {
          i -= 2;
        } else {
          i--;
        }
      }
    }
  }

  // // show reduced array
  // for (int j = 0; j < array.length; j++) {
  //   print(array[j].join(''));
  // }

  // calculate scores
  List<int> results = <int>[];
  int result = 0;
  bool broken = false;
  for (int j = 0; j < array.length; j++) {
    result = 0;
    broken = false;
    outerLoop:
    for (int i = array[j].length - 1; i >= 0; i--) {
      result *= 5;
      if (array[j][i] == '(') {
        result += 1;
      } else if (array[j][i] == '[') {
        result += 2;
      } else if (array[j][i] == '{') {
        result += 3;
      } else if (array[j][i] == '<') {
        result += 4;
      } else if (array[j][i] == ')' ||
          array[j][i] == ']' ||
          array[j][i] == '}' ||
          array[j][i] == '>') {
        broken = true;
        break outerLoop;
      }
    }
    if (broken == false) {
      results.add(result);
    }
  }

  // bubble sort
  for (int step = 0; step < results.length; step++) {
    for (int i = 0; i < results.length - step - 1; i++) {
      if (results[i] > results[i + 1]) {
        swap(results, i);
      }
    }
  }

  // //print results array
  // for (int j = 0; j < results.length; j++) {
  //   print(results[j]);
  // }

  print(results[results.length ~/ 2]);

}

void swap(List<int> list, int i) {
  int temp = list[i];
  list[i] = list[i + 1];
  list[i + 1] = temp;
}
