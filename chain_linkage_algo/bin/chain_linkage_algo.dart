import 'package:chain_linkage_algo/chain_linkage_algo.dart';
import 'package:chain_linkage_algo/custom_node.dart';

void main(List<String> arguments) {
  // // entry point of application
  // chain_linkage_algo.startMessages();
  // // Reading name of the Geek
  // print("input : ");
  // String? input = stdin.readLineSync();
  // List<double> listOfChains = parseInputToList(input!);

  // print(getMaxChain(listOfChains));

  print(
    chainsToList(
        CustomNode(
            value: 20,
            leftChild:
                CustomNode(value: 30, rightChild: CustomNode(value: 30))),
        []),
  );
}
