// dart day_1_sonar_sweep.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/input1.txt');
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
