import 'dart:collection';
import 'dart:math';

import 'package:chain_linkage_algo/models.dart';

List<Queue> answerStatus = [];
// this position show that what chain is start chain
int globalStartPosition = 0;

chainLinckageMethod(List<double> chains, CustomNode? node, int index) {
  if (index == chains.length || chains.length < 3) {
  } else {
    if (node == null) {
      // create parent of tree for the first time
      List<double> newList = chains;
      double firstChainValue = newList[index];
      chainLinckageMethod(newList, CustomNode(value: firstChainValue), 1);
    } else {
      // update child of the parent
      List<double> newList = chains;
      double firstChainValue = newList[index];
      CustomNode leftChild =
          CustomNode(value: firstChainValue, leftChild: node);
      CustomNode rightChild =
          CustomNode(value: firstChainValue, rightChild: node);
      chainLinckageMethod(
          chains, leftChild, (index < chains.length) ? index + 1 : index);
      chainLinckageMethod(
          chains, rightChild, (index < chains.length) ? index + 1 : index);
    }
  }
  Queue currentQueue = nodeToQueue(node, Queue(), null);
  if (currentQueue.length == chains.length) {
    answerStatus.add(nodeToQueue(node, Queue(), null));
  }
  if (answerStatus.length == chains.length) {
    print(answerStatus);
    print(answerStatus.length);
  }

  print("all states : ${pow(2, chains.length)}");
}

calculateUsedAreaOfChains(List<NodeDirection> list) {
  double max = 0;
  double min = 0;
  double position = 0;

  for (var i = 0; i < list.length; i++) {
    if (list[i].direction == "P") {
      position += list[i].value;
      max = position;
    } else if (list[i].direction == "R") {
      position += list[i].value;
    } else {
      position -= list[i].value;
    }

    if (position > max) {
      max = position;
    } else if (position < min) {
      min = position;
    }
  }

  return max - min;
}

// use Recursive to get all chians in order from tree as a list
/// P : parent
/// L : left
/// R : right
/// F : finish
nodeToQueue(CustomNode? node, Queue<NodeDirection> queue, CustomNode? parent) {
  if (node == null) {
    return queue;
  }
  queue.addLast(NodeDirection(
      value: node.value,
      direction: (parent != null)
          ? (parent.leftChild == null)
              ? (parent.rightChild == null)
                  ? "F"
                  : "R"
              : "L"
          : "P"));
  nodeToQueue(node.leftChild, queue, node);
  nodeToQueue(node.rightChild, queue, node);

  return queue;
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

double getMaxChain(List chains) {
  double max = chains[0];
  for (var element in chains) {
    if (element > max) {
      max = element;
    }
  }
  return max;
}

List<double> parseInputToList(String input) {
  List<String> list = input.split(" ");
  List<double> intList = [];

  for (var i = 0; i < list.length; i++) {
    intList.add(double.parse(list[i]));
  }

  return intList;
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
