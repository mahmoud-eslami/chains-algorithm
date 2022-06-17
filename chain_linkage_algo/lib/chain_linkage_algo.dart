import 'dart:collection';

import 'package:chain_linkage_algo/models.dart';

// this position show that what chain is start chain
int globalStartPosition = 0;
double bestLength = 0;

chainLinckageMethod(List<double> chains, CustomNode? node, int index) {
  Queue<NodeDirection> currentQueue = nodeToQueue(node, Queue());
  List<NodeDirection> nodeDirectionList =
      queueToNodeDirectionList(currentQueue);
  double length = calculateUsedAreaOfChains(nodeDirectionList);

  if (index == chains.length || chains.length < 3) {
    // ignore this states
  } else {
    if (node == null) {
      // create parent of tree for the first time
      List<double> newList = chains;
      double firstChainValue = newList[index];
      chainLinckageMethod(newList,
          CustomNode(leftChild: CustomNode(value: firstChainValue)), 1);
      chainLinckageMethod(newList,
          CustomNode(rightChild: CustomNode(value: firstChainValue)), 1);
    } else {
      // if (bestLength != 0 && length > bestLength == false) {
      // update child of the parent
      List<double> newList = chains;
      double firstChainValue = newList[index];
      node.value = firstChainValue;
      CustomNode leftChild = CustomNode(leftChild: node);
      CustomNode rightChild = CustomNode(rightChild: node);
      chainLinckageMethod(
          chains, leftChild, (index < chains.length) ? index + 1 : index);
      chainLinckageMethod(
          chains, rightChild, (index < chains.length) ? index + 1 : index);
      // }
    }
  }

  // we added a empty node as parent so the length of queue should be one more than chain list length
  // it means we found a complete answer
  if (currentQueue.length == chains.length + 1) {
    if (bestLength == 0) {
      bestLength = length;
    } else if (length < bestLength) {
      bestLength = length;
    }

    print("**Possible answer**");
    print("  ");
    print("diagram : ");
    printTree2D(node, "");
    print("queue : $currentQueue");
    print("length : $length");
    print("best length : $bestLength");
    print("  ");
    print("******************");
    print("  ");
    print("  ");
  }
}

printTree2D(CustomNode? node, String space) {
  if (node == null) return;
  space = (node.leftChild != null) ? "" : "    ";
  print((node.value == null) ? "  root  " : space + node.value.toString());
  printTree2D(node.leftChild, space);
  printTree2D(node.rightChild, space);
}

double calculateUsedAreaOfChains(List<NodeDirection> list) {
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

// give me a queue to return a list with same type
List<NodeDirection> queueToNodeDirectionList(Queue<NodeDirection> queue) =>
    queue.toList();

// use Recursive to get all chians in order from tree as a list
/// P : parent
/// L : left
/// R : right
/// F : finish
Queue<NodeDirection> nodeToQueue(CustomNode? node, Queue<NodeDirection> queue) {
  if (node == null) {
    return queue;
  }
  queue.addLast(NodeDirection(
      value: node.value ?? 0, direction: (node.leftChild == null) ? "R" : "L"));
  nodeToQueue(node.leftChild, queue);
  nodeToQueue(node.rightChild, queue);

  return queue;
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
  List<String> list = input.split("-");
  List<double> intList = [];

  for (var i = 0; i < list.length; i++) {
    intList.add(double.parse(list[i]));
  }

  return intList;
}

void startMessages() {
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
  print("for example : 2-3-4-5-6-10-2-2");
  print(" ");
}
