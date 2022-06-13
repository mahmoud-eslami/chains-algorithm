import 'package:equatable/equatable.dart';

class CustomNode extends Equatable {
  final CustomNode? leftChild;
  final CustomNode? rightChild;
  final double value;

  CustomNode({this.leftChild, this.rightChild, required this.value});

  @override
  List<Object?> get props => [leftChild, rightChild];
}
