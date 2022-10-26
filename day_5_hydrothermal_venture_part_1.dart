// dart day_5_hydrothermal_venture_part_1.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_5.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(RegExp(' -> |,'));
  // List<List<String>> cords = List<List<String>>.generate(inputlist.length ~/ 2,
  //     (int i) => List<String>.generate(4, (int j) => ''));
  for (int i = 0; i < inputlist.length; i++) {
    print(inputlist[i]);
  }
}
