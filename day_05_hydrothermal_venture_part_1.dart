// dart day_05_hydrothermal_venture_part_1.dart

import 'dart:io';

//read txt
Future<void> main() async {
  final File file = File('inputs/day_05.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split(RegExp(' -> |,|\n'));

  // // show inputList
  // for (int i = 0; i < inputList.length; i++) {
  //   print(inputList[i]);
  // }

  // create and fill cords array
  List<List<int>> cords = List<List<int>>.generate(
      inputList.length ~/ 4, (int i) => List<int>.generate(4, (int j) => 0));
  int c = 0;
  int tableSize = 0;
  for (int i = 0; i < (inputList.length ~/ 4); i++) {
    for (int j = 0; j < 4; j++) {
      cords[i][j] = int.parse(inputList[c]);
      if (int.parse(inputList[c]) > tableSize) {
        tableSize = int.parse(inputList[c]);
      }
      c++;
    }
  }

  // // show variables
  // print(c);
  // print(inputList.length);
  // print(tableSize);

  // generate table of vents
  List<List<int>> vents = List<List<int>>.generate(tableSize + 1,
      (int i) => List<int>.generate(tableSize + 1, (int j) => 0));

  // // show cords array
  // for (int i = 0; i < inputList.length ~/ 4; i++) {
  //   print(cords[i]);
  // }

  // draw lines
  for (int i = 0; i < inputList.length ~/ 4; i++) {
    if (cords[i][0] == cords[i][2]) {
      // if x1 = x2
      if (cords[i][1] > cords[i][3]) {
        // if y1 > y2
        for (int y = cords[i][3]; y <= cords[i][1]; y++) {
          vents[y][cords[i][0]]++;
        }
      } else {
        for (int y = cords[i][1]; y <= cords[i][3]; y++) {
          vents[y][cords[i][0]]++;
        }
      }
    }
    if (cords[i][1] == cords[i][3]) {
      // if y1 = y2
      if (cords[i][0] > cords[i][2]) {
        // if x1 > x2
        for (int x = cords[i][2]; x <= cords[i][0]; x++) {
          vents[cords[i][1]][x]++;
        }
      } else {
        for (int x = cords[i][0]; x <= cords[i][2]; x++) {
          vents[cords[i][1]][x]++;
        }
      }
    }
  }

  // calculate result
  c = 0;
  for (int x = 0; x < tableSize; x++) {
    for (int y = 0; y < tableSize; y++) {
      if (vents[x][y] >= 2) {
        c++;
      }
    }
  }

  //print result
  print(c);
}
