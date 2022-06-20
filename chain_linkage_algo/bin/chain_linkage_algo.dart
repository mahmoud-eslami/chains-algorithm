import 'dart:io';

import 'package:chain_linkage_algo/chain_linkage_algo.dart';

void main(List<String> arguments) {
  // entry point of application
  startMessages();
  // Reading name of the Geek
  print("input : ");
  String? input = stdin.readLineSync();
  List<double> listOfChains = parseInputToList(input!);

  chainLinckageMethod(listOfChains, null, 0);
}
