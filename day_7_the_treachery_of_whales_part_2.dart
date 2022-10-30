// dart day_7_the_treachery_of_whales_part_2.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_7.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(',');

  // copy to list of int
  List<int> intlist = List<int>.generate(inputlist.length, (int i) => 0);
  for (int i = 0; i < inputlist.length; i++) {
    intlist[i] = int.parse(inputlist[i]);
  }

  // finding min and max
  int min = 0;
  int max = 0;
  for (int i = 0; i < intlist.length; i++) {
    if (max < intlist[i]) {
      max = intlist[i];
    }
    if (min > intlist[i]) {
      min = intlist[i];
    }
  }

  // print(min);
  // print(max);

  // Map
  List<int> fuelmap = List<int>.generate(max - min, (int i) => 0);
  int fuel = 0;
  int c = 0;
  for (int j = 0; j < max - min; j++) {
    fuel = 0;
    for (int i = 0; i < intlist.length; i++) {
      for (int k = 1; k <= (intlist[i] - j).abs(); k++) {
        c += k;
      }
      fuel += c;
      c = 0;
    }
    fuelmap[j] = fuel;
  }

  // print(fuelmap);
  int minfuel = fuelmap[0];
  for (int j = 1; j < max - min; j++) {
    if (minfuel > fuelmap[j]) {
      minfuel = fuelmap[j];
    }
  }

  print(minfuel);
}
