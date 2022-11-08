//      dart day_04_giant_squid_part_1.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_04.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split(',');
  int c1 = 0;
  int c2 = 0;
  int winnerBoard = 0;
  int winnerNum = 0;
  List<String> checklist = <String>[];

  List<String> boardsNumbers =
      inputList[inputList.length - 1].split(RegExp(r'\s+'));
  dynamic remover = inputList.removeAt(inputList.length - 1);
  inputList.add(boardsNumbers[0]);
  remover = boardsNumbers.removeAt(0);
  List<List<List<int>>> boards = List<List<List<int>>>.generate(
      boardsNumbers.length ~/ 25,
      (int h) => List<List<int>>.generate(
          5, (int i) => List<int>.generate(5, (int j) => 0)));
  for (int h = 0; h < boardsNumbers.length ~/ 25; h++) {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        boards[h][i][j] = int.parse(boardsNumbers[(h * 25) + (i * 5) + j]);
      }
    }
  }

  outerLoop:
  for (int k = 0; k < inputList.length; k++) {
    checklist.add(inputList[k]);
    for (int h = 0; h < boardsNumbers.length ~/ 25; h++) {
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          for (int l = 0; l < checklist.length - 1; l++) {
            if (boards[h][i][j] == int.parse(checklist[l])) {
              c1++;
            }
            if (boards[h][j][i] == int.parse(checklist[l])) {
              c2++;
            }
            if (c1 == 5 || c2 == 5) {
              winnerNum = k - 1;
              winnerBoard = h;
              break outerLoop;
            }
          }
        }
        c1 = 0;
        c2 = 0;
      }
    }
  }
  c1 = 0;
  c2 = 0;
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      for (int l = 0; l < checklist.length - 1; l++) {
        if (boards[winnerBoard][i][j] == int.parse(checklist[l])) {
          c1++;
        }
      }
      if (c1 == 0) {
        c2 += boards[winnerBoard][i][j];
      } else {
        c1 = 0;
      }
    }
  }
  // print('c2 $c2 winNum ${checklist[winnerNum]}');

  print(c2 * int.parse(checklist[winnerNum]));

}

  // for (int i = 0; i < 5; i++) {
  //   print(boards[winnerBoard][i]);
  // }

  // for (int l = 0; l < checklist.length - 1; l++) {
  //   print(inputList[l]);
  // }

  // int sum = 0;
  //   for (int i = 0; i < 5; i++) {
  //     for (int j = 0; j < 5; j++) {
  //       sum += boards[winnerBoard][i][j];
  //     }
  //   }
  // print(sum);

  // for (int h = 0; h < boardsNumbers.length ~/ 25; h++) {
  //   for (int i = 0; i < 5; i++) {
  //     print(boards[h][i]);
  //   }
  //   print('');
  // }

  // for (int k = 0; i < inputList.length; k++) {
  //   print(inputList[k]);
  // }
