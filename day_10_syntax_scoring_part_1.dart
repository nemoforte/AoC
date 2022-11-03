// dart day_10_syntax_scoring_part_1.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_10.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');  
}
