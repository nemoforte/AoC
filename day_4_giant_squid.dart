//      dart day_4_giant_squid.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/input4.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(',');

  List<String> lol = inputlist[99].split('\n');
  dynamic remover = inputlist.removeAt(inputlist.length - 1);
  inputlist.add(lol[0]);
  remover = lol.removeAt(0);
  for (int i = 0; i < lol.length; i++) {
    if (lol[i] == null) {
      remover = lol.removeAt(i);
      i--;
    }
  }
  print(lol[0]);
}
