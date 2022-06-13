import 'package:chain_linkage_algo/custom_node.dart';

List<double> parseInputToList(String input) {
  List<String> list = input.split(" ");
  List<double> intList = [];

  for (var i = 0; i < list.length; i++) {
    intList.add(double.parse(list[i]));
  }

  return intList;
}

double getMaxChain(List chains) {
  double max = chains[0];
  for (var element in chains) {
    if (element > max) {
      max = element;
    }
  }
  return max;
}

int chianLinckageMethod(List<int> chains) {
  return 0;
}

// use Recursive to calculate sum value of all nodes
calculateValueOfNode(CustomNode? node) {
  if (node == null) {
    return 0;
  }

  return node.value +
      calculateValueOfNode(node.leftChild) +
      calculateValueOfNode(node.rightChild);
}

// use Recursive to get all chians in order from tree as a list
chainsToList(CustomNode? node, List list) {
  if (node == null) {
    return list;
  }
  chainsToList(node.leftChild, list);
  list.add(node.value);
  chainsToList(node.rightChild, list);

  return list;
}

startMessages() {
  print("**********************************************");
  print("**********************************************");
  print("*****           Chain Linkage            *****");
  print("**********************************************");
  print("*****      Course : Algorithm design     *****");
  print("**********************************************");
  print("*****   Supervisor : Dr Mahdi Yaghoubi   *****");
  print("**********************************************");
  print("*****      Student : Mahmoud Eslami      *****");
  print("**********************************************");
  print("**********************************************");

  print(" ");
  print(" ");
  print(" ");
  print("Please enter list of chains with below format :");
  print("for example : 2 3 4 5 6 10 2 2");
  print(" ");
}
