// dart day_3_binary_diagnostic_part_1.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_3.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');
  StringBuffer gamma = StringBuffer();
  StringBuffer epsilon = StringBuffer();

  for (int j = 0; j < inputlist[0].length - 1; j++) {
    int c = 0;
    for (int i = 0; i < inputlist.length; i++) {
      if (inputlist[i][j] == '0') {
        c++;
      }
    }
    if (c > inputlist.length / 2) {
      gamma.write('0');
    } else {
      gamma.write('1');
    }
  }

  String gammarate = gamma.toString();
  for (int i = 0; i < gammarate.length; i++) {
    if (gammarate[i] == '0') {
      epsilon.write('1');
    } else {
      epsilon.write('0');
    }
  }
  String epsilonrate = epsilon.toString();
  // print(gammarate);
  // print(epsilonrate);
  int pc = int.parse(gammarate, radix: 2) * int.parse(epsilonrate, radix: 2);
  // print(int.parse(gammarate, radix: 2));
  // print(int.parse(epsilonrate, radix: 2));
  print(pc);
}
