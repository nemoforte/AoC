// dart day_08_seven_segment_search_part_2.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_08.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(RegExp(' |\n'));

  // build array
  List<List<String>> input = List<List<String>>.generate(inputlist.length ~/ 15,
      (int i) => List<String>.generate(14, (int j) => ''));
  int k = 0;
  for (int j = 0; j < inputlist.length ~/ 15; j++) {
    for (int i = 0; i < 14; i++) {
      if (inputlist[k] != '|') {
        input[j][i] = inputlist[k];
        k++;
      } else {
        k++;
        input[j][i] = inputlist[k];
        k++;
      }
    }
  }

  // trim
  for (int j = 0; j < inputlist.length ~/ 15; j++) {
    input[j][13] = input[j][13].trim();
  }

  // finding values
  String zero = '';
  String one = '';
  String two = '';
  String three = '';
  String four = '';
  String five = '';
  String six = '';
  String seven = '';
  String eight = '';
  String nine = '';

  // finding 1, 4, 7, 8
  int sum = 0;
  for (int j = 0; j < inputlist.length ~/ 15; j++) {
    for (int i = 0; i < 10; i++) {
      if (input[j][i].length == 2) {
        one = input[j][i];
      } else if (input[j][i].length == 3) {
        seven = input[j][i];
      } else if (input[j][i].length == 4) {
        four = input[j][i];
      } else if (input[j][i].length == 7) {
        eight = input[j][i];
      }
    }

    // finding 0, 6, 9
    bool c4;
    bool c1;

    for (int i = 0; i < 10; i++) {
      if (input[j][i].length == 6) {
        c4 = true;
        for (int l = 0; l < four.length; l++) {
          if (!input[j][i].contains(four[l])) {
            c4 = false;
          }
        }
        c1 = true;
        for (int l = 0; l < one.length; l++) {
          if (!input[j][i].contains(one[l])) {
            c1 = false;
          }
        }
        if (c4 == true) {
          nine = input[j][i];
        } else if (c1 == false) {
          six = input[j][i];
        } else {
          zero = input[j][i];
        }
      }
    }

    // // finding 2, 3, 5
    // bool c6;
    //   for (int i = 0; i < 10; i++) {
    //     if (input[j][i].length == 5) {
    //       c1 = true;
    //       for (int l = 0; l < one.length; l++) {
    //         if (!input[j][i].contains(one[l])) {
    //           c1 = false;
    //         }
    //       }
    //       c6 = true;
    //       for (int l = 0; l < input[j][i].length; l++) {
    //         if (!six.contains(input[j][i][l])) {
    //           c6 = false;
    //         }
    //       }
    //       if (c1 == true) {
    //         three = input[j][i];
    //       } else if (c6 == true) {
    //         five = input[j][i];
    //       } else {
    //         two = input[j][i];
    //       }
    //     }
    //   }

    // going for the result
    bool c6;
    String result = '';

    result = '';
    for (int i = 10; i < 14; i++) {
      if (input[j][i].length == 2) {
        result += '1';
      } else if (input[j][i].length == 3) {
        result += '7';
      } else if (input[j][i].length == 4) {
        result += '4';
      } else if (input[j][i].length == 7) {
        result += '8';
      } else if (input[j][i].length == 6) {
        c4 = true;
        for (int l = 0; l < four.length; l++) {
          if (!input[j][i].contains(four[l])) {
            c4 = false;
          }
        }
        c1 = true;
        for (int l = 0; l < one.length; l++) {
          if (!input[j][i].contains(one[l])) {
            c1 = false;
          }
        }
        if (c4 == true) {
          result += '9';
        } else if (c1 == false) {
          result += '6';
        } else {
          result += '0';
        }
      } else if (input[j][i].length == 5) {
        c1 = true;
        for (int l = 0; l < one.length; l++) {
          if (!input[j][i].contains(one[l])) {
            c1 = false;
          }
        }
        c6 = true;
        for (int l = 0; l < input[j][i].length; l++) {
          if (!six.contains(input[j][i][l])) {
            c6 = false;
          }
        }
        if (c1 == true) {
          result += '3';
        } else if (c6 == true) {
          result += '5';
        } else {
          result += '2';
        }
      }
    }
    sum += int.parse(result);
  }

  // // check
  // print('0 $zero');
  // print('1 $one');
  // print('2 $two');
  // print('3 $three');
  // print('4 $four');
  // print('5 $five');
  // print('6 $six');
  // print('7 $seven');
  // print('8 $eight');
  // print('9 $nine');

  print(sum);
}
