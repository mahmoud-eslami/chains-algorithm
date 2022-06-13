import 'package:equatable/equatable.dart';

class CustomNode extends Equatable {
  final CustomNode? leftChild;
  final CustomNode? rightChild;

  CustomNode({this.leftChild, this.rightChild});

  @override
  List<Object?> get props => [leftChild, rightChild];
}
