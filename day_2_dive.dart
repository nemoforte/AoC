// dart day_2_dive.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/input2.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');
  int horizontal = 0;
  int depth = 0;
  for (int i = 0; i < inputlist.length; i++) {
    List<String> templist = inputlist[i].split(' ');
    if (templist[0] == 'up') {
      depth -= int.parse(templist[1]);
    } else if (templist[0] == 'down') {
      depth += int.parse(templist[1]);
    } else {
      horizontal += int.parse(templist[1]);
    }
  }
  // print(horizontal);
  // print(depth);
  print(horizontal * depth);
}
