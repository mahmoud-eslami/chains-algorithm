import 'package:equatable/equatable.dart';

class CustomNode extends Equatable {
  CustomNode? leftChild;
  CustomNode? rightChild;
  final double value;

  CustomNode({this.leftChild, this.rightChild, required this.value});

  @override
  List<Object?> get props => [leftChild, rightChild];
}

class NodeDirection extends Equatable {
  final double value;
  final String direction;

  NodeDirection({required this.value, required this.direction});

  @override
  List<Object?> get props => [value, direction];

  @override
  String toString() {
    return "($value,$direction)";
  }
}
