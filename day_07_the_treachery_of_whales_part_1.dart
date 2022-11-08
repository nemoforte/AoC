// dart day_07_the_treachery_of_whales_part_1.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_07.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split(',');

  // copy to list of int
  List<int> intList = List<int>.generate(inputList.length, (int i) => 0);
  for (int i = 0; i < inputList.length; i++) {
    intList[i] = int.parse(inputList[i]);
  }

  // finding min and max
  int min = 0;
  int max = 0;
  for (int i = 0; i < intList.length; i++) {
    if (max < intList[i]) {
      max = intList[i];
    }
    if (min > intList[i]) {
      min = intList[i];
    }
  }

  // print(min);
  // print(max);

  // Map
  List<int> fuelMap = List<int>.generate(max - min, (int i) => 0);
  int fuel = 0;
  for (int j = 0; j < max - min; j++) {
    fuel = 0;
    for (int i = 0; i < intList.length; i++) {
      fuel += (intList[i] - j).abs();
    }
    fuelMap[j] = fuel;
  }

  // print(fuelMap);
  int minFuel = fuelMap[0];
  for (int j = 1; j < max - min; j++) {
    if (minFuel > fuelMap[j]) {
      minFuel = fuelMap[j];
    }
  }

  print(minFuel);
  
}
