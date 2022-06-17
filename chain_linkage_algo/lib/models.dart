import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CustomNode extends Equatable {
  CustomNode? leftChild;
  CustomNode? rightChild;
  double? value;

  CustomNode({this.leftChild, this.rightChild, this.value});

  @override
  List<Object?> get props => [leftChild, rightChild];

  @override
  String toString() {
    final out = StringBuffer();

    rightChild?._buildTree(out, true, '');
    out.writeln(value);
    leftChild?._buildTree(out, false, '');

    return out.toString();
  }

  // this method copied from stack over flow , i am trying to learn how to work
  void _buildTree(StringBuffer stringBuffer, bool isRight, String indent) {
    rightChild?._buildTree(
        stringBuffer, true, indent + (isRight ? '     ' : '|    '));

    stringBuffer
      ..write(indent)
      ..write(isRight ? '┌─── ' : '└─── ')
      ..writeln(value);

    leftChild?._buildTree(
        stringBuffer, false, indent + (isRight ? '│    ' : '     '));
  }
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
