//      dart day_4_giant_squid_part_1.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_4.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(',');

  List<String> boardsnumbers = inputlist[inputlist.length-1].split(RegExp(r'\s+'));
  dynamic remover = inputlist.removeAt(inputlist.length - 1);
  inputlist.add(boardsnumbers[0]);
  remover = boardsnumbers.removeAt(0);
  List<List<String>> boards = List<List<String>>.generate(boardsnumbers.length ~/ 25, (int i) => List<String>.generate(25, (int j) => '*'));
  for (int i = 0; i < boardsnumbers.length ~/ 25; i++){
    for (int j = 0; j < 25; j++) {
      boards[i][j] = boardsnumbers[(i*25)+j];
    }
  }

  for (int i = 0; i < boards.length; i++) {
    print(boards[i]);
  }


  // final List<String> boards = <String>[];
  // for (int dataRow = 2; dataRow < inputlist.length; dataRow += 6) {
  //   final List<List<int>> board = <List<int>>[];
  //   for (int bingoRow = 0; bingoRow < 5; bingoRow++) {
  //     final String rawRow = inputlist[dataRow + bingoRow].trimLeft();
  //     board.add(rawRow.split(RegExp(r'\s+')).map(int.parse).toList());
  //   }
  //   print(board);
  // }
}
