// dart day_10_syntax_scoring_part_1.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_10.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');
  for (int j = 0; j < inputlist.length; j++) {
    inputlist[j] = inputlist[j].trim();
  }

  // input list to array 2d cause idk how to operate on Strings
  List<List<String>> array =
      List<List<String>>.generate(inputlist.length, (int j) => <String>[]);
  for (int j = 0; j < inputlist.length; j++) {
    for (int i = 0; i < inputlist[j].length; i++) {
      array[j].add(inputlist[j][i]);
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

  // calculating results
  int sum = 0;
  for (int j = 0; j < array.length; j++) {
    outerLoop:
    for (int i = 0; i < array[j].length; i++) {
      if (array[j][i] == ')') {
        sum += 3;
        // print(j);
        break outerLoop;
      } else if (array[j][i] == ']') {
        sum += 57;
        // print(j);
        break outerLoop;
      } else if (array[j][i] == '}') {
        sum += 1197;
        // print(j);
        break outerLoop;
      } else if (array[j][i] == '>') {
        sum += 25137;
        // print(j);
        break outerLoop;
      }
    }
  }
  print(sum);
}
