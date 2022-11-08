// dart day_06_lanternfish_part_1.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_06.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split(',');
  List<int> intList = List<int>.generate(inputList.length, (int i) => 0);

  // // show input list
  // for (int i = 0; i < inputList.length; i++) {
  //   print(inputList[i]);
  // }
  
  // copy to list of int
  for (int i = 0; i < inputList.length; i++) {
    intList[i] = int.parse(inputList[i]);
  }

  // population growth
  for (int j = 0; j < 80; j++) {
    int l = intList.length;
    for (int i = 0; i < l; i++) {
      if (intList[i] > 0) {
        intList[i]--;
      } else {
        intList[i] = 6;
        intList.add(8);
      }
    }
  }

  // // show int list
  // for (int i = 0; i < intList.length; i++) {
  //   print(intList[i]);
  // }

  print(intList.length);

}
