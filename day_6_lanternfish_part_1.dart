// dart day_6_lanternfish_part_1.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_6.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(',');
  List<int> intlist = List<int>.generate(inputlist.length, (int i) => 0);

  // // show input list
  // for (int i = 0; i < inputlist.length; i++) {
  //   print(inputlist[i]);
  // }
  
  // copy to list of int
  for (int i = 0; i < inputlist.length; i++) {
    intlist[i] = int.parse(inputlist[i]);
  }

  // population growth
  for (int j = 0; j < 80; j++) {
    int l = intlist.length;
    for (int i = 0; i < l; i++) {
      if (intlist[i] > 0) {
        intlist[i]--;
      } else {
        intlist[i] = 6;
        intlist.add(8);
      }
    }
  }

  // // show int list
  // for (int i = 0; i < intlist.length; i++) {
  //   print(intlist[i]);
  // }

  print(intlist.length);

}
