// dart day_01_sonar_sweep_part_1.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_01.txt');
  final String contents = await file.readAsString();
  int c = 0;
  List<String> inputlist = contents.split('\n');

  for (int i = 0; i < inputlist.length - 1; i++) {
    if (int.parse(inputlist[i + 1]) > int.parse(inputlist[i])) {
      c++;
    }
  }

  print(c);
}
