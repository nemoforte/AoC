//      dart day_4_giant_squid_part_1.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_4.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(',');
  int c1 = 0;
  int c2 = 0;
  int winnerboard = 0;
  int winnernum = 0;
  List<String> checklist = <String>[];

  List<String> boardsnumbers =
      inputlist[inputlist.length - 1].split(RegExp(r'\s+'));
  dynamic remover = inputlist.removeAt(inputlist.length - 1);
  inputlist.add(boardsnumbers[0]);
  remover = boardsnumbers.removeAt(0);
  List<List<List<int>>> boards = List<List<List<int>>>.generate(
      boardsnumbers.length ~/ 25,
      (int h) => List<List<int>>.generate(
          5, (int i) => List<int>.generate(5, (int j) => 0)));
  for (int h = 0; h < boardsnumbers.length ~/ 25; h++) {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        boards[h][i][j] = int.parse(boardsnumbers[(h * 25) + (i * 5) + j]);
      }
    }
  }

  outerLoop:
  for (int k = 0; k < inputlist.length; k++) {
    checklist.add(inputlist[k]);
    for (int h = 0; h < boardsnumbers.length ~/ 25; h++) {
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
              winnernum = k - 1;
              winnerboard = h;
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
        if (boards[winnerboard][i][j] == int.parse(checklist[l])) {
          c1++;
        }
      }
      if (c1 == 0) {
        c2 += boards[winnerboard][i][j];
      } else {
        c1 = 0;
      }
    }
  }
  // print('c2 $c2 winnum ${checklist[winnernum]}');

  print(c2 * int.parse(checklist[winnernum]));

}

  // for (int i = 0; i < 5; i++) {
  //   print(boards[winnerboard][i]);
  // }

  // for (int l = 0; l < checklist.length - 1; l++) {
  //   print(inputlist[l]);
  // }

  // int sum = 0;
  //   for (int i = 0; i < 5; i++) {
  //     for (int j = 0; j < 5; j++) {
  //       sum += boards[winnerboard][i][j];
  //     }
  //   }
  // print(sum);

  // for (int h = 0; h < boardsnumbers.length ~/ 25; h++) {
  //   for (int i = 0; i < 5; i++) {
  //     print(boards[h][i]);
  //   }
  //   print('');
  // }

  // for (int k = 0; i < inputlist.length; k++) {
  //   print(inputlist[k]);
  // }
