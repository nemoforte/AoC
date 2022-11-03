// dart day_01_sonar_sweep_part_2.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_01.txt');
  final String contents = await file.readAsString();
  int c = 0;
  List<String> inputlist = contents.split('\n');
  List<String> sum = <String>[];

  for (int i = 0; i < inputlist.length - 2; i++) {
    sum.add((int.parse(inputlist[i]) +
            int.parse(inputlist[i + 1]) +
            int.parse(inputlist[i + 2]))
        .toString());
  }

  for (int i = 0; i < sum.length - 1; i++) {
    if (int.parse(sum[i + 1]) > int.parse(sum[i])) {
      c++;
    }
  }

  // print(sum[0]);
  // print(sum[sum.length - 1]);

  print(c);
}