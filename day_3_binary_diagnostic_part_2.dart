//      dart day_3_binary_diagnostic_part_2.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/input3.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');
  List<String> o2 = inputlist;
  List<String> co2 = inputlist;
  List<String> temp = <String>[];
  String lookup;

  while (o2.length > 1) {
    for (int j = 0; j < inputlist[0].length - 1; j++) {
      int c = 0;
      for (int i = 0; i < o2.length; i++) {
        if (o2[i][j] == '0') {
          c++;
        }
      }
      print('c = $c');
      if (c > o2.length / 2) {
        lookup = '0';
      } else {
        lookup = '1';
      }
      print('lookup $lookup');

      for (int i = 0; i < o2.length; i++) {
        if (o2[i][j] == lookup) {
          temp.add(o2[i]);
        }
      }
    }
    o2.clear();
  }
}
  // for (int j = 0; j < inputlist[0].length - 1; j++) {
  //   int c = 0;
  //   for (int i = 0; i < co2.length; i++) {
  //     if (co2[i][j] == '0') {
  //       c++;
  //     }
  //   }
  //   List<String> temp = <String>[];
  //   if (c <= co2.length) {
  //     for (int i = 0; i < co2.length; i++) {
  //       if (co2[i][j] == '0') {
  //         temp.add(o2[i][j]);
  //       }
  //     }
  //   } else {
  //     for (int i = 0; i < co2.length; i++) {
  //       if (co2[i][j] == '1') {
  //         temp.add(co2[i][j]);
  //       }
  //     }
  //   }
  //   co2 = temp;
  // }

  // print(o2);
  // print(co2);
  // int lsr =
  //     int.parse(o2.toString(), radix: 2) * int.parse(co2.toString(), radix: 2);
  // print(int.parse(o2.toString(), radix: 2));
  // print(int.parse(co2.toString(), radix: 2));
  // print(lsr);

