//      dart day_3_binary_diagnostic_part_2.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_3.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');
  List<String> o2 = inputlist;
  List<String> co2 = inputlist;
  List<String> temp = <String>[];
  String lookup;

  for (int j = 0; j < inputlist[0].length - 1; j++) {
    int c = 0;
    if (o2.length > 1) {
      for (int i = 0; i < o2.length; i++) {
        if (o2[i][j] == '0') {
          c++;
        }
      }
      if (c > o2.length / 2) {
        lookup = '0';
      } else {
        lookup = '1';
      }
      for (int i = 0; i < o2.length; i++) {
        if (o2[i][j] == lookup) {
          temp.add(o2[i]);
        }
      }
      o2 = temp;
      temp = <String>[];
    }
  }

  for (int j = 0; j < inputlist[0].length - 1; j++) {
    int c = 0;
    if (co2.length > 1) {
      for (int i = 0; i < co2.length; i++) {
        if (co2[i][j] == '0') {
          c++;
        }
      }
      if (c <= co2.length / 2) {
        lookup = '0';
      } else {
        lookup = '1';
      }
      for (int i = 0; i < co2.length; i++) {
        if (co2[i][j] == lookup) {
          temp.add(co2[i]);
        }
      }
      co2 = temp;
      temp = <String>[];
    }
  }

  // print(o2[0]);
  // print(co2[0]);
  int lsr =
      int.parse(o2[0].toString(), radix: 2) * int.parse(co2[0].toString(), radix: 2);
  // print(int.parse(o2[0].toString(), radix: 2));
  // print(int.parse(co2[0].toString(), radix: 2));
  print(lsr);
}