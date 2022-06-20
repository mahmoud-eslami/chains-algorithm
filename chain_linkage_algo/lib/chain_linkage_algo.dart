import 'dart:collection';

import 'package:chain_linkage_algo/models.dart';

// this position show that what chain is start chain
int globalStartPosition = 0;
double bestLength = 0;
int callCount = 0;

resetAppState() {
  globalStartPosition = 0;
  bestLength = 0;
  callCount = 0;
}

chainLinckageMethod(List<double> chains, CustomNode? node, int index) {
  callCount++;
  Queue<NodeDirection> currentQueue = nodeToQueue(node, Queue());
  double length = calculateUsedAreaOfChains(currentQueue);

  // todo : improvement level 1
  /// pruning the part of tree when the length is more than best length
  if (bestLength != 0 && length > bestLength) {
    // ignore this state
    return;
  }

  // todo : improvement level 2
  /// pruning the part of tree when the length is more than 2 * max chain length
  if (index < chains.length) {
    double maxOptimalLength = getMaxOptimalAnswer(node);

    if (length > 2 * maxOptimalLength) {
      // ignore this state
      return;
    }
  }

  // prevent to start when length of chains are smaller than 3
  // stop to call function when all chains linked
  if (index < chains.length && chains.length >= 3) {
    if (node == null) {
      // create parent of tree for the first time
      double chainValue = chains.reversed.toList()[index];
      CustomNode leftLoaf =
          CustomNode(leftChild: CustomNode(value: chainValue));
      CustomNode rightLoaf =
          CustomNode(rightChild: CustomNode(value: chainValue));
      chainLinckageMethod(chains, leftLoaf, index + 1);
      chainLinckageMethod(chains, rightLoaf, index + 1);
    } else {
      // update child of the parent
      double chainValue = chains.reversed.toList()[index];
      node.value = chainValue;
      CustomNode leftChild = CustomNode(leftChild: node);
      CustomNode rightChild = CustomNode(rightChild: node);
      chainLinckageMethod(
          chains, leftChild, (index < chains.length) ? index + 1 : index);
      chainLinckageMethod(
          chains, rightChild, (index < chains.length) ? index + 1 : index);
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
    print(node);
    print("queue : $currentQueue");
    print("length : $length");
    print("best length : $bestLength");
    print("  ");
    print("******************");
    print("  ");
    print("  ");
  }
}

double getMaxOptimalAnswer(CustomNode? node) {
  List<double> newList = getListOfDoublesFromQueue(node, []);
  double max = 0;

  for (var element in newList) {
    if (max == 0) {
      max = element;
    } else {
      if (element > max) {
        max = element;
      }
    }
  }
  return max;
}

List<double> getListOfDoublesFromQueue(CustomNode? node, List<double> list) {
  if (node == null) {
    return list;
  }
  list.add(node.value ?? 0);
  getListOfDoublesFromQueue(node.leftChild, list);
  getListOfDoublesFromQueue(node.rightChild, list);

  return list;
}

double calculateUsedAreaOfChains(Queue<NodeDirection> queue) {
  List<NodeDirection> list = queue.toList();
  double max = 0;
  double min = 0;
  double position = 0;

// start index from 1 and ignore root of tree
  for (var i = 1; i < list.length; i++) {
    if (list[i - 1].direction == "R") {
      position += list[i].value;
    } else if (list[i - 1].direction == "L") {
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
Queue<NodeDirection> nodeToQueue(CustomNode? node, Queue<NodeDirection> queue) {
  if (node == null) {
    return queue;
  }
  queue.addLast(NodeDirection(
      value: node.value ?? 0,
      direction: (node.leftChild == null && node.rightChild == null)
          ? "End"
          : (node.leftChild == null)
              ? "R"
              : "L"));
  nodeToQueue(node.leftChild, queue);
  nodeToQueue(node.rightChild, queue);

  return queue;
}

List<double> parseInputToList(String input) {
  List<String> list = input.split("-");
  List<double> intList = [];

  for (var i = 0; i < list.length; i++) {
    intList.add(double.parse(list[i]));
  }

  return intList;
}

void endMessages() {
  print(" ");
  print("Function call Count : $callCount");
  print(" ");
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
