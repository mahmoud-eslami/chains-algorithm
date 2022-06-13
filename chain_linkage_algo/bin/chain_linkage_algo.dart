import 'dart:io';

import 'package:chain_linkage_algo/chain_linkage_algo.dart'
    as chain_linkage_algo;

void main(List<String> arguments) {
  // entry point of application
  chain_linkage_algo.startMessages();
  // Reading name of the Geek
  print("input : ");
  String? input = stdin.readLineSync();
  List<double> listOfChains = chain_linkage_algo.parseInputToList(input!);

  print(chain_linkage_algo.getMaxChain(listOfChains));
}
