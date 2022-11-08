// dart day_06_lanternfish_part_2.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_06.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split(',');
  List<int> intList = List<int>.generate(inputList.length, (int i) => 0);
  List<int> map = List<int>.generate(9, (int i) => 0);

  // // show input list
  // for (int i = 0; i < inputList.length; i++) {
  //   print(inputList[i]);
  // }

  // copy to list of int
  for (int i = 0; i < inputList.length; i++) {
    intList[i] = int.parse(inputList[i]);
  }

  // initial map
  int c = 0;
  for (int j = 0; j <= 8; j++) {
    for (int i = 0; i < intList.length; i++) {
      if (intList[i] == j) {
        c++;
      }
    }
    map[j] = c;
    c = 0;
  }

  // // show int list
  // for (int i = 0; i < intList.length; i++) {
  //   print(intList[i]);
  // }

  // population growth
  int t = 0;
  for (int j = 0; j < 256; j++) {
    t = map[0];
    for (int i = 0; i < 8; i++) {
      map[i] = map[i + 1];
    }
    map[8] = t;
    map[6] += t;
  }

  // result
  int sum = 0;
  for (int i = 0; i <= 8; i++) {
    sum += map[i];
  }
  print(sum);
}
