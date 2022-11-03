// dart day_9_smoke_basin_part_2.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_9.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split('\n');
  
  // generate aux array
  List<List<int>> array = List<List<int>>.generate(
      inputlist.length + 4,
      (int j) =>
          List<int>.generate(inputlist[0].trim().length + 4, (int i) => 9));
  for (int j = 2; j < array.length - 2; j++) {
    for (int i = 2; i < array[0].length - 2; i++) {
      array[j][i] = int.parse(inputlist[j - 2][i - 2]);
    }
  }

  // count basins
  List<int> basin = <int>[];
  List<int> largest = List<int>.generate(3, (int i) => 0);
  int y = 0;
  int x = 0;
  int c = 0;
  int min = 0;
  bool repeat = false;
  for (int j = 2; j < inputlist.length + 2; j++) {
    for (int i = 2; i < inputlist[0].length + 1; i++) {
      basin = <int>[];
      c = 1;
      if (array[j][i] < array[j][i + 1] &&
          array[j][i] < array[j][i - 1] &&
          array[j][i] < array[j - 1][i] &&
          array[j][i] < array[j + 1][i]) {
        // print(array[j][i]);
        basin.addAll(<int>[j, i]);
        for (int q = 0; q < basin.length - 1; q += 2) {
          y = basin[q];
          x = basin[q + 1];
          if (array[y][x] < array[y][x + 1] && array[y][x + 1] != 9) {
            repeat = false;
            for (int p = 0; p < basin.length - 1; p += 2){
              if (basin[p] == y && basin[p + 1] == x + 1) {
                repeat = true;
              }
            }
            if (repeat == false) {
              basin.addAll(<int>[y, x + 1]);
              c++;
              // print(array[y][x + 1]);
            } else {
              repeat = false;
            }
          }
          if (array[y][x] < array[y][x - 1] && array[y][x - 1] != 9) {
            repeat = false;
            for (int p = 0; p < basin.length - 1; p += 2){
              if (basin[p] == y && basin[p + 1] == x - 1) {
                repeat = true;
              }
            }
            if (repeat == false) {
              basin.addAll(<int>[y, x - 1]);
              c++;
              // print(array[y][x - 1]);
            } else {
              repeat = false;
            }
          }
          if (array[y][x] < array[y - 1][x] && array[y - 1][x] != 9) {
            repeat = false;
            for (int p = 0; p < basin.length - 1; p += 2){
              if (basin[p] == y - 1 && basin[p + 1] == x) {
                repeat = true;
              }
            }
            if (repeat == false) {
              basin.addAll(<int>[y - 1, x]);
              c++;
              // print(array[y - 1][x]);
            } else {
              repeat = false;
            }
          }
          if (array[y][x] < array[y + 1][x] && array[y + 1][x] != 9) {
            repeat = false;
            for (int p = 0; p < basin.length - 1; p += 2){
              if (basin[p] == y + 1 && basin[p + 1] == x) {
                repeat = true;
              }
            }
            if (repeat == false) { 
              basin.addAll(<int>[y + 1, x]);
              c++;
              // print(array[y + 1][x]);
            } else {
              repeat = false;
            }
          }
        }
        // print('c = $c');
        min = 0;
        for (int l = 0; l < largest.length; l++) {
          if (c > largest[l]) {
            for (int t = 1; t < largest.length; t++) {
              if (largest[min] > largest[t]) {
                min = t;
              }
            }
          largest[min] = c; 
          l = largest.length;
          }
        }
      }
    }
  }
  // print(largest[0]);
  // print(largest[1]);
  // print(largest[2]);
  print(largest[0]*largest[1]*largest[2]);
}
