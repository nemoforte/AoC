// dart day_5_hydrothermal_venture_part_2.dart

import 'dart:io';

//read txt
Future<void> main() async {
  final File file = File('inputs/day_5.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(RegExp(' -> |,|\n'));

  // // show inputlist
  // for (int i = 0; i < inputlist.length; i++) {
  //   print(inputlist[i]);
  // }

  // create and fill cords array
  List<List<int>> cords = List<List<int>>.generate(
      inputlist.length ~/ 4, (int i) => List<int>.generate(4, (int j) => 0));
  int c = 0;
  int tablesize = 0;
  for (int i = 0; i < (inputlist.length ~/ 4); i++) {
    for (int j = 0; j < 4; j++) {
      cords[i][j] = int.parse(inputlist[c]);
      if (int.parse(inputlist[c]) > tablesize) {
        tablesize = int.parse(inputlist[c]);
      }
      c++;
    }
  }

  // // show variables
  // print(c);
  // print(inputlist.length);
  // print(tablesize);

  // generate table of vents
  List<List<int>> vents = List<List<int>>.generate(tablesize + 1,
      (int i) => List<int>.generate(tablesize + 1, (int j) => 0));

  // // show cords array
  // for (int i = 0; i < inputlist.length ~/ 4; i++) {
  //   print(cords[i]);
  // }

  // draw diagonal lines
  int x = 0;
  int y = 0;
  for (int i = 0; i < inputlist.length ~/ 4; i++) {
    if ((cords[i][0] - cords[i][2]).abs() ==
        (cords[i][1] - cords[i][3]).abs()) {
      // if |x1 - x2| = |y1 - y2|
      x = cords[i][0];
      y = cords[i][1];
      if (cords[i][1] < cords[i][3]) {
        // y1 < y2
        if (cords[i][0] < cords[i][2]) {
          // x1 < x2
          while (x <= cords[i][2]) {
            vents[y][x]++;
            x++;
            y++;
          }
        } else {
          // x1 > x2
          while (x >= cords[i][2]) {
            vents[y][x]++;
            x--;
            y++;
          }
        }
      } else {
        // if y1 > y2
        if (cords[i][0] < cords[i][2]) {
          // x1 < x2
          while (x <= cords[i][2]) {
            vents[y][x]++;
            x++;
            y--;
          }
        } else {
          // x1 > x2
          while (x >= cords[i][2]) {
            vents[y][x]++;
            x--;
            y--;
          }
        }
      }
    }
  }

// draw horizontal and vertical lines
  for (int i = 0; i < inputlist.length ~/ 4; i++) {
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
  for (int x = 0; x < tablesize; x++) {
    for (int y = 0; y < tablesize; y++) {
      if (vents[y][x] >= 2) {
        c++;
      }
    }
  }

  // // print vents array
  // for (int i = 0; i <= tablesize; i++) {
  //   print(vents[i]);
  // }

  //print result
  print(c);
}
