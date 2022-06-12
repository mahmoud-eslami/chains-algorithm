import 'dart:io';

void main(List<String> args) {
  // entry point of application

  print("**********************************************");
  print("**********************************************");
  print("*****           Chain Linkage            *****");
  print("**********************************************");
  print("*****      Course : Algorithm design     *****");
  print("**********************************************");
  print("*****   Supervisor : Dr Mahdi Yaghoubi   *****");
  print("**********************************************");
  print("**********************************************");

  print(" ");
  print(" ");
  print(" ");
  print("Please enter list of chains with below format :");
  print("for example : 2 3 4 5 6 10 2 2");
  print(" ");

  // Reading name of the Geek
  print("input : ");
  String? input = stdin.readLineSync();
  List<double> listOfChains = parseInputToList(input!);

  print(getMaxChain(listOfChains));
}

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
  chains.forEach((element) {
    if (element > max) {
      max = element;
    }
  });
  return max;
}

int chianLinckageMethod(List<int> chains) {
  return 0;
}
