// dart day_09_smoke_basin_part_1.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_09.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split('\n');
  StringBuffer lowPoints = StringBuffer();

  // generate aux array
  List<List<int>> array = List<List<int>>.generate(
      inputList.length + 2,
      (int j) =>
          List<int>.generate(inputList[0].trim().length + 2, (int i) => 10));
  for (int j = 1; j < array.length - 1; j++) {
    for (int i = 1; i < array[0].length - 1; i++) {
      array[j][i] = int.parse(inputList[j - 1][i - 1]);
    }
  }

  // count lowPoints
  for (int j = 1; j < inputList.length + 1; j++) {
    for (int i = 1; i < inputList[0].length; i++) {
      if (array[j][i] < array[j][i + 1] &&
          array[j][i] < array[j][i - 1] &&
          array[j][i] < array[j - 1][i] &&
          array[j][i] < array[j + 1][i]) {
        lowPoints.write(array[j][i].toString());
      }
    }
  }

  // sum risk levels
  int riskLevels = 0;
  for (int i = 0; i < lowPoints.toString().length; i++) {
    riskLevels += int.parse(lowPoints.toString()[i]) + 1;
  }
  print(riskLevels);
  
}
