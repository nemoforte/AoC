// dart day_09_smoke_basin_part_1.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_09.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');
  StringBuffer lowpoints = StringBuffer();

  // generate aux array
  List<List<int>> array = List<List<int>>.generate(
      inputlist.length + 2,
      (int j) =>
          List<int>.generate(inputlist[0].trim().length + 2, (int i) => 10));
  for (int j = 1; j < array.length - 1; j++) {
    for (int i = 1; i < array[0].length - 1; i++) {
      array[j][i] = int.parse(inputlist[j - 1][i - 1]);
    }
  }

  // count lowpoints
  for (int j = 1; j < inputlist.length + 1; j++) {
    for (int i = 1; i < inputlist[0].length; i++) {
      if (array[j][i] < array[j][i + 1] &&
          array[j][i] < array[j][i - 1] &&
          array[j][i] < array[j - 1][i] &&
          array[j][i] < array[j + 1][i]) {
        lowpoints.write(array[j][i].toString());
      }
    }
  }

  // sum risk levels
  int risklevels = 0;
  for (int i = 0; i < lowpoints.toString().length; i++) {
    risklevels += int.parse(lowpoints.toString()[i]) + 1;
  }
  print(risklevels);
  
}
