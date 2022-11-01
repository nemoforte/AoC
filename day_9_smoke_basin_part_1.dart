// dart day_9_smoke_basin_part_1.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_9.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');
  int c = 0;
  StringBuffer lowpoints = StringBuffer();

  for (int j = 1; j < inputlist.length - 1; j++) {
    c = 0;
    for (int i = 1; i < inputlist[0].length - 1; i++) {
      if (int.parse(inputlist[j][i]) < int.parse(inputlist[j][i-1])) {
        c++;
      }
      // if (int.parse(inputlist[j][i]) < int.parse(inputlist[j-1][i])) {
      //   c++;
      // }
      // if (int.parse(inputlist[j][i]) < int.parse(inputlist[j][i+1])) {
      //   c++;
      // }
      // if (int.parse(inputlist[j][i]) < int.parse(inputlist[j+1][i])) {
      //   c++;
      // }
      if (c == 4) {
        lowpoints.write(inputlist[i][j]);
      }
    }
  }
  print(lowpoints);
}
