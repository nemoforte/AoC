// dart day_03_binary_diagnostic_part_1.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_03.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split('\n');
  StringBuffer gamma = StringBuffer();
  StringBuffer epsilon = StringBuffer();

  for (int j = 0; j < inputList[0].length - 1; j++) {
    int c = 0;
    for (int i = 0; i < inputList.length; i++) {
      if (inputList[i][j] == '0') {
        c++;
      }
    }
    if (c > inputList.length / 2) {
      gamma.write('0');
    } else {
      gamma.write('1');
    }
  }

  String gammaRate = gamma.toString();
  for (int i = 0; i < gammaRate.length; i++) {
    if (gammaRate[i] == '0') {
      epsilon.write('1');
    } else {
      epsilon.write('0');
    }
  }
  String epsilonRate = epsilon.toString();
  // print(gammaRate);
  // print(epsilonRate);
  int pc = int.parse(gammaRate, radix: 2) * int.parse(epsilonRate, radix: 2);
  // print(int.parse(gammaRate, radix: 2));
  // print(int.parse(epsilonRate, radix: 2));
  print(pc);
}
