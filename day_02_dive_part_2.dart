// dart day_02_dive_part_2.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_02.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split('\n');
  int horizontal = 0;
  int depth = 0;
  int aim = 0;
  for (int i = 0; i < inputList.length; i++) {
    List<String> tempList = inputList[i].split(' ');
    if (tempList[0] == 'up') {
      aim -= int.parse(tempList[1]);
    } else if (tempList[0] == 'down') {
      aim += int.parse(tempList[1]);
    } else {
      horizontal += int.parse(tempList[1]);
      depth += aim * int.parse(tempList[1]);
    }
  }
  // print(horizontal);
  // print(depth);
  print(horizontal * depth);
}
